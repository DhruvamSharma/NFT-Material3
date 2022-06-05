import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:nft_material/custom_router.dart';
import 'package:nft_material/pages/home.dart';
import 'package:nft_material/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final settings = ValueNotifier(
    ThemeSettings(
      sourceColor: Colors.deepPurple,
      themeMode: ThemeMode.system,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => ThemeProvider(
        settings: settings,
        lightDynamic: lightDynamic,
        darkDynamic: darkDynamic,
        child: NotificationListener<ThemeSettingChange>(
          onNotification: (notification) {
            settings.value = notification.settings;
            return true;
          },
          child: ValueListenableBuilder<ThemeSettings>(
              valueListenable: settings,
              builder: (context, value, _) {
                final theme = ThemeProvider.of(context);
                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: theme.light(settings.value.sourceColor),
                  darkTheme: theme.dark(settings.value.sourceColor),
                  themeMode: theme.themeMode(),
                  initialRoute: HomePage.routeName,
                  onGenerateRoute: CustomRouter.onRoute,
                  debugShowCheckedModeBanner: false,
                );
              }),
        ),
      ),
    );
  }
}
