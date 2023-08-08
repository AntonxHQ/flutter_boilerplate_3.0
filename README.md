# AntonX Flutter Template

## Initial check points

Few things to make sure before using this template:

- Update your version to Flutter V3.10.6
- Adopted Stack CLI
- Contains Flavors

## Initial App Flow settings

All initial app settings are done in `_initialSetup();` function on `startup_viewmodel` Screen with the following flow:

- Init localStorageService
- Check internet connectivity
- Configure notifications service
- Get onboarding data (if onboarding is dynamic otherwise it's removed)
- Check if onboarding was complete (if not go to relevant onboarding screen otherwise move further)
- Do authentication setup with the following steps
  - Check if user is logged in by checking the access_token
  - If logged in then get user data and also update users FCM token
- Check if user is logged-in, move to home_view (home) otherwise move to login_view.

## Logging

For logging make sure the following steps:

- Never use print statement directly for logs
- For logging use `getLogger` function adopted from stacked cli.
- In `getLogger` pass the class name as parameter from where we are generating the logs. It helps us identity the location from where the logs are being generated.
Here is an example as well:

```dart
class TestClass{
final log = getLogger('TestClass');

doSomeWork(){
  log.i('@doSomeWork: Testing info logs'); // Use it to log information
  log.d('@doSomeWork: Testing debug logs'); // Use it to log debug messages
  log.e('@doSomeWork: Testing error logs'); // Use it to log error messages
  log.wtf('@doSomeWork: Testing WTF logs'); // Use it to log critical error messages
  }
}
```

## Onboarding

For onboarding, we have two options. One is dynamic (onboarding data coming from a remote server via REST Apis) and other is static (in most cases we prefer static as it's experience is pretty smooth).

So if dynamic onboarding is used then there is implementation done on splash screen and here is line calling onboarding data function:

```dart
onboardingList = await _getOnboardingData();
```

After getting data from a remote server or using local server, we use local_storage (Shared Preferences) to store user onboarding status (record the screen number that user already went through) and then next time when the user comes back to the app, we show data to the user accordingly. And you can find the implementation in this code on Splash Screen.

```dart
if (_localStorageService.onBoardingPageCount + 1 < onboardingList.length) {
      ///
      /// For better user experience we precache onboarding images in case
      /// they are coming from a remote server. 
      /// Remove it if onboarding is static.
      ///
      final List<Image> preCachedImages =
          await _preCacheOnboardingImages(onboardingList);
      await Get.to(() => OnboardingScreen(
          currentIndex: _localStorageService.onBoardingPageCount,
          onboardingList: onboardingList,
          preCachedImages: preCachedImages));
      return;
    }
```
## Addition of .env File
We need  `.env` file to keep the important keys(google api keys, stripe payment keys, etc) secure. 
```
Steps for adding .env file:
  - create .env file int the root of your project directory
  - add *.env into your .gitignore file under the # Miscellaneous section
  - add keys to file for example: google_api_key = your_google_api_keys

To Fetch this key in your file:
  - you can use dotenv for example: String googleApiKey = dotenv.env['google_api_key']!;
```
## Environments and config file

We have set three environments in the this template:

- Dev
- Test
- Production

We have also added config file to add configurations relevant to the environment the app is running. You can find config file at `lib/core/config_service` and there you need to set all three BaseUrls for all three envs.
Then `ApiService` class will get the relevant base_url according to the environment the app is running in.

After the Addition of the google_services.json files for each particular firebase we also need to add the firebase_options.dart file respectively. Firebase option files contains the relevant information about the particular firebase being used in current flavor, therefore, we need to add 3 different firebase option files for each flavor. The following is the method to generate it: 
``` 
-------------------------------------------------------
NOTE: SET THE FOLLOWING CODE ACCORDING TO YOUR USE CASE
-------------------------------------------------------

flutterfire config \ --project=your_firebase_project_id \ --out=lib/give_firebase_options_name_according_to_flavor.dart \ --ios-bundle-id=com.eatkareem.halalnow.stg \ --android-app-id=com.eatkareem.halalnow.stg
```
Using the above snippet of code, you can generate the files for different flavored firebases. 

## Running Various Flavors from Terminal
We can use the following commands to run various flavors using the terminal.
```
To Run Production: 
  fvm flutter run --flavor envProduction --target lib/main.dart

To Run Test:
  fvm flutter run --flavor envTest --target lib/main_test.dart

To Run Dev: 
  fvm flutter run --flavor envDev --target lib/main_dev.dart
```
## API responses

## Features List

AntonX starter app to speedup our development process by adding a list of most commonly used features directly here.
The features already added include:

- Optimized Project Structure
- App initial flow settings
- Local Storage (SharedPreferences) complete settings
- Screen Utils settings for adoptive design
- Dependency injection settings with get_it package
- Firebase Integration settings
- Notifications using Firebase Cloud Messaging
- Rest APIs Integration settings:
  - APIs Services file with the boilerplate code
  - Response handling settings
- Onboarding flow settings
- Authentication settings:
  - Login with email & password REST APIs
  - Signup with email & password REST APIs
  - Forgot password settings with REST APIs
  - Login with Gmail (In progress)
  - Login with Apple (In Progress)
  - Login with Facebook (In Progress)
- Google maps integration
- Location services:
  - Getting user permissions and it's handling
  - Getting user location and it's handling
- Pin location on map implementation
- File picker services
  - Image picker (Compression quality etc)
  - File picker
  - .heic to jpg conversion
- Localization services
- Custom logger for better debugging

## Theme
* Theme is define in AppTheme file using ThemeData class.

# use theme
  MaterialApp(
      theme: myTheme,
      darkTheme: myDarkTheme,
      home: MyHomePage(),
    );

# example
 Text(
 'Headline 1',        
  style: Theme.of(context).textTheme.headline1,
 ),

## Go Router
* Routes are define in AppRoutes file
* Router object is define in AppRouter file

# main file
* MaterialApp.route(
    routerConfig: AppRouter().router,
)

# usage (works on context too)
context.go(AppRoutes.chat);
GoRouter.of(context).go(AppRoutes.chat);

Future planned features:
