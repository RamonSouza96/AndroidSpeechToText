# AndroidSpeechToText

AndroidSpeechToText is a project demonstrating the integration and usage of Google's native speech recognition feature in Android applications. This project was developed using Delphi 12 and tested on Android 13.

## Features

- **Android Dependency**: This project relies on native Android APIs for speech recognition and is specific to the Android platform. It will not work on other platforms such as iOS or Windows.

- **Online and Offline Speech Recognition**: The project utilizes Google's speech recognition service, which can operate both online and offline. However, for offline speech recognition, it's necessary to pre-download the appropriate language packages on your device.

- **Language Compatibility**: The language for speech recognition is set to Brazilian Portuguese (pt-BR). Ensure that the selected language is supported by Google's speech recognition API.

- **Event Subscription**: The class utilizes TMessageManager to subscribe and unsubscribe from messages. Ensure compatibility with other parts of your application using TMessageManager.

- **Testing and Adjustments**: Before integrating this class into a larger project, it's recommended to test it on various Android devices and usage scenarios to ensure proper functionality.

## Usage

To use this project, simply include the `FMX.SpeechToText` unit in your Delphi project and call the `StartRecognition` method to initiate speech recognition.

```delphi
// Example usage
TSpeech_Text.StartRecognition('Speak Now', ResultSpeech);
```

For additional details about Android speech recognition APIs, please consult the official [Android documentation](https://developer.android.com/reference/android/speech/package-summary).


https://github.com/RamonSouza96/AndroidSpeechToText/assets/34917070/563781be-4362-4801-aacd-4456c844f441



## Disclaimer

This project is designed for Android devices and uses native Android features for speech recognition. Requires audio recording permission in your app "android.permission.RECORD_AUDIO".
