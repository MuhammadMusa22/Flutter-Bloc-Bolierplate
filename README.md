## Getting Started

This project is the basic boiler plate code for bloc state management of flutter. There are two screens(LoginScreen, HomeScreen) and two cubits(AuthCubit,ExampleCubit). 

**AuthCubit:**
Auth Cubit use for authentication purpose and it compare the values from textfields with the values from API, if user exist in list of user, login will be successfull. 
List of users can be found here: https://jsonplaceholder.typicode.com/users

**ExampleCubit:**
Example cubit is the one which just show the flow of the bloc pattern that how can we use the bloc for state management in flutter apps.

**Test Cases:**
We have added two cases inside this boilerplat project to demonstrate flutter bloc testing and TDD approch.

**Custom Widgets:**
Custom widgets are those that have reusability inside UI so there custom widgets are made so we can reuse this inisde multiple screens.

**Routes Navigation Management:**
For this boiler plat code, there are just two screens but we have used onGenerateRoute flow for the navigation purpose, to keep navigation logic inside single file.

To clone this project use the link: https://github.com/Productboxpk/Basic_Flutter_Bloc_BoilerPlate.git

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
