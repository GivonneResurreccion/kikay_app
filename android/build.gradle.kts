allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

plugins.withType<com.android.build.gradle.BasePlugin>().configureEach {
    configure<com.android.build.gradle.BaseExtension> {
        ndkVersion = "27.0.12077973"
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}