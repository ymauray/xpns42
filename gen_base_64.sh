#! /bin/env bash

base64 android/app/google-services.json > google-services.base64
base64 ios/firebase_app_id_file.json > firebase_app_id_file.base64
base64 ios/Runner/GoogleService-Info.plist > GoogleService-Info.base64
base64 lib/firebase_options.dart > firebase_options.base64
