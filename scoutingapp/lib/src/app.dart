import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoutingapp/src/pages/data_page_graph_view.dart';
import 'package:scoutingapp/src/Pages/home_page.dart';
import 'package:scoutingapp/src/pages/field_scouting/auto_scouting.dart';
import 'package:scoutingapp/src/pages/field_scouting/teleop_scouting.dart';
import 'package:scoutingapp/src/pages/file_creation.dart';
import 'package:scoutingapp/src/util/app_data.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(
            useMaterial3: true,
            // Define the default brightness and colors.
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green.shade600,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green.shade600,
            brightness: Brightness.dark,
          )),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case DataPageGraphView.routeName:
                    return const DataPageGraphView();
                    case FileCreation.routeName:
                    if(AppData.currentlyScouting){
                      return AppData.currentScoutingPage();
                    } else {
                    return const FileCreation();
                    }
                  case AutoScoutingPage.routeName:
                    return const AutoScoutingPage();
                    case TeleopScoutingPage.routeName:
                      return const TeleopScoutingPage();
                  default:
                    return const HomePage();
                }
              },
            );
          },
        );
      },
    );
  }
}
