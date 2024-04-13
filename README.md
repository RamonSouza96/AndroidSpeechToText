# AndroidSpeechToText

AndroidSpeechToText is a project demonstrating the integration and usage of Google's native speech recognition feature in Android applications. This project was developed using Delphi 12 and tested on Android 13.

## Features

- **Android Dependency**: This project relies on native Android APIs for speech recognition and is specific to the Android platform. It will not work on other platforms such as iOS or Windows.

- **No Audio Permission Needed**: As highlighted by the user, since the recognition is performed by the Google app, audio recording permission is not required in your app.

- **Online Speech Recognition**: The project utilizes Google's online speech recognition service, requiring an internet connection to function. Offline recognition is not supported.

- **Language Compatibility**: The language for speech recognition is set to Brazilian Portuguese (pt-BR). Ensure that the selected language is supported by Google's speech recognition API.

- **Result Handling**: The current implementation returns only the first result of speech recognition. Further customization may be required for advanced result processing.

- **Event Subscription**: The class utilizes TMessageManager to subscribe and unsubscribe from messages. Ensure compatibility with other parts of your application using TMessageManager.

- **Testing and Adjustments**: Before integrating this class into a larger project, it's recommended to test it on various Android devices and usage scenarios to ensure proper functionality.

## Usage

To use this project, simply include the `FMX.SpeechToText` unit in your Delphi project and call the `StartRecognition` method to initiate speech recognition.

```Delphi
// Example usage
TSpeech_Text.StartRecognition('Speak Now', ResultSpeech);

## Disclaimer
This project is designed for Android devices and utilizes native Android features for speech recognition. It does not require audio recording permission in your app, as the recognition is performed by the Google app.
