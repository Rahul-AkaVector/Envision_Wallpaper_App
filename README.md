
# Envision - Wallpaper App

Envision is a sleek and user-friendly wallpaper app that allows users to discover and download high-quality wallpapers for their devices. With an extensive collection of stunning images and a range of customizable features, Envision offers an immersive experience to enhance your device's visual appeal.



## Technologies Used

- Flutter & Dart: The app is developed using the Flutter framework with the Dart programming language, enabling cross-platform compatibility for Android and iOS.

- Firestore Database: Firebase Firestore is used to store and manage the wallpaper data, user favorites, likes, and comments.

- Firebase Storage: Images are stored on Firebase Storage, ensuring reliable access and fast downloads.


## Documentation

[ Flutter Documentation](https://docs.flutter.dev/)
[ Firebase Documentation](https://firebase.flutter.dev/docs/overview/)


## Demo

https://github.com/Rahul-AkaVector/Envision_Wallpaper_App/assets/90543113/4de013f4-149b-42ff-ae82-8279a3fc8ea1

## YouTube Video Review

https://youtu.be/ZjE__8RJr3o

## Firebase Properties

To run this project, you will need to add the following environment variables to your firebaseproperties.dart file

    static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'add ur api key',
    appId: 'add ur app id',
    messagingSenderId: 'add ur messanger sender id',
    projectId: 'add ur project id',
    storageBucket: 'add ur storage bucket',
    );

    static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'add ur api key',
    appId: 'add ur app id',
    messagingSenderId: 'add ur messanger sender id',
    projectId: 'add ur project id',
    storageBucket: 'add ur storage bucket id',
    iosClientId:'add ur ios client id',
    iosBundleId: 'add your ios bundled id',
    );


## Installation

- Install my-project with git clone

```bash
git clone https://github.com/your-username/envision-wallpaper-app.git
```
```bash 
cd envision-wallpaper-app
```
```bash
flutter pub get
```

- Set up your Firebase project:

Create a new project on the Firebase Console.

Create a new Firebase Storage & Firebase Cloud Store on the Firebase Console.

Follow the instructions to add the Android and iOS apps to your Firebase project.

Download the google-services.json file for Android and GoogleService-Info.plist for iOS.

Place these files in the respective app directories (android/app for Android and ios/Runner for iOS).

- Run the app on your device or emulator:
```bash
flutter run
```


    
## Contributing

We welcome contributions from the open-source community to make Envision even better. If you find any issues or have suggestions for improvements, please create a pull request or raise an issue in the GitHub repository.


## Happy wallpaper hunting with Envision! 🌄
