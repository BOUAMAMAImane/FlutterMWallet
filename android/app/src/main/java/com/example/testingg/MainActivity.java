package com.example.testingg;

import android.os.StrictMode;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import com.example.mylibrarytts.Auth;
import com.example.mylibrarytts.User;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends FlutterActivity {


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        super.configureFlutterEngine(flutterEngine);


          MethodChannels channels = new MethodChannels();


            channels.userChannel(flutterEngine);
            channels.historyChannel(flutterEngine);
            channels.authChannel(flutterEngine);



    }

}



