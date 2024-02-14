import 'package:flutter/material.dart';
import 'package:hyphen_flutter_sdk/src/ui/theme/color.dart';
import 'package:flutter/services.dart';

class HyphenUITheme extends StatelessWidget {
  final bool darkTheme;
  final bool dynamicColor;
  final Widget child;

  const HyphenUITheme({super.key, 
    required this.darkTheme,
    this.dynamicColor = true,
    required this.child,
  });

  ColorScheme getColorScheme(bool darkTheme, BuildContext context) {
    return darkTheme ? dynamicDarkColorScheme(context) : dynamicLightColorScheme(context);
  } 

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(darkTheme, context);

    // Apply system UI overlay styles
    final systemUiOverlayStyle = darkTheme
        ? SystemUiOverlayStyle.light.copyWith(
            statusBarColor: colorScheme.primary,
            systemNavigationBarColor: colorScheme.background,
            systemNavigationBarIconBrightness: Brightness.light,
          )
        : SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: colorScheme.primary,
            systemNavigationBarColor: colorScheme.background,
            systemNavigationBarIconBrightness: Brightness.dark,
          );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyle,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: colorScheme.primary,
          scaffoldBackgroundColor: colorScheme.background,
          // Add other theme properties as needed
        ),
        home: child,
      ),
    );
  }
}


ColorScheme dynamicDarkColorScheme(BuildContext context) {
  return const ColorScheme.dark(
    primary: HyphenTheme.purple80,
    secondary: HyphenTheme.purpleGrey80,
    tertiary: HyphenTheme.pink80,
    // surface: Colors.grey[900],
    // background: Colors.grey[850],
    // onPrimary: Colors.white,
    // onSecondary: Colors.white,
    // onSurface: Colors.white,
    // onBackground: Colors.white,
  );
}

ColorScheme dynamicLightColorScheme(BuildContext context) {
  return const ColorScheme.light(
    primary: HyphenTheme.purple40,
    secondary: HyphenTheme.purpleGrey40,
    tertiary: HyphenTheme.pink40,
    // surface: Colors.grey[100],
    //background: Colors.grey[50],
    // onPrimary: Colors.black,
    // onSecondary: Colors.black,
    // onSurface: Colors.black,
    // onBackground: Colors.black,
  );
}
