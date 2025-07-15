plugins{
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics") version "2.9.9"
}

android {
    namespace = "com.example.flutter_auth"
    compileSdk = 34 // Recommended to use latest SDK

    ndkVersion = "25.2.9519653" // ✅ Must match the folder name in your sdk/ndk directory

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    defaultConfig {
        applicationId = "com.example.flutter_auth"
        minSdk = 23
        targetSdk = 34
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Firebase BoM
    implementation(platform("com.google.firebase:firebase-bom:33.16.0"))

    // Firebase libraries (versions managed by BoM)
    implementation("com.google.firebase:firebase-crashlytics-ndk")
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-auth")
}

//If the app isn’t on Play Store yet or running in debug mode, you might face SMS sending limits unless you use test numbers.

//No, you're not able to receive real OTP SMS on a simulator/emulator unless the emulator has Google Play Services and SIM/network support, which most don’t.