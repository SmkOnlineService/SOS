package com.example.sos

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.sos/general"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
          flutterEngine.dartExecutor.binaryMessenger,
          CHANNEL
        ).setMethodCallHandler { call, result ->
           if (call.method == "getFlavor") {
            result.success(BuildConfig.FLAVOR)
          } else {
            result.notImplemented()
          }
        }
    }
}
