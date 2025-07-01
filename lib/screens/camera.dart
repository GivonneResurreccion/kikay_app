import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraScreen({super.key, required this.cameras});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  int _cameraIndex = 1;
  bool _isCameraInitialized = false;

  final Color pink = const Color(0xFFF4BBD3);
  final Color cream = const Color(0xFFF1E4F3);
  final Color darkPink = const Color(0xFFDC1768);

  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate),
  );

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    if (_cameraIndex >= widget.cameras.length) _cameraIndex = 0;
    _controller = CameraController(
      widget.cameras[_cameraIndex],
      ResolutionPreset.medium,
      enableAudio: false,
    );

    try {
      await _controller.initialize();
      if (!mounted) return;
      setState(() => _isCameraInitialized = true);
    } catch (e) {
      debugPrint('Camera error: $e');
    }
  }

  void _switchCamera() {
    setState(() {
      _cameraIndex = (_cameraIndex + 1) % widget.cameras.length;
    });
    _initializeCamera();
  }

  Future<void> _capturePhoto() async {
    if (!_controller.value.isInitialized || _controller.value.isTakingPicture) {
      return;
    }

    try {
      final XFile file = await _controller.takePicture();

      final InputImage inputImage = InputImage.fromFilePath(file.path);
      final List<Face> faces = await _faceDetector.processImage(inputImage);

      if (!mounted) return;

      if (faces.isNotEmpty) {
        Navigator.pushNamed(context, '/result', arguments: file.path);
      } else {
        _showNoFaceDialog();
      }
    } catch (e) {
      debugPrint('Error detecting face: $e');
    }
  }

  void _showNoFaceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: pink,
        title: const Text('No Face Detected'),
        content: const Text(
          'Please try again and make sure your face is visible.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
      body: Stack(
        children: [
          Positioned.fill(
            child: _isCameraInitialized
                ? CameraPreview(_controller)
                : const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: pink,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.flip_camera_ios,
                      color: darkPink,
                      size: 30,
                    ),
                    onPressed: _switchCamera,
                  ),
                  GestureDetector(
                    onTap: _capturePhoto,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[400]!, width: 4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
