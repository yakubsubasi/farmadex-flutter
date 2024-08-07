import 'package:flutter/material.dart';

extension FastTextStyle on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get bodySmall => textTheme.bodySmall!;

  TextStyle get bodyMedium => textTheme.bodyMedium!;

  TextStyle get bodyLarge => textTheme.bodyLarge!;

  TextStyle get labelSmall => textTheme.labelSmall!;

  TextStyle get labelMedium => textTheme.labelMedium!;

  TextStyle get labelLarge => textTheme.labelLarge!;

  TextStyle get titleSmall => textTheme.titleSmall!;

  TextStyle get titleMedium => textTheme.titleMedium!;

  TextStyle get titleLarge => textTheme.titleLarge!;

  TextStyle get headlineSmall => textTheme.headlineSmall!;

  TextStyle get headlineMedium => textTheme.headlineMedium!;

  TextStyle get headlineLarge => textTheme.headlineLarge!;

  TextStyle get displaySmall => textTheme.displaySmall!;

  TextStyle get displayMedium => textTheme.displayMedium!;

  TextStyle get displayLarge => textTheme.displayLarge!;
}

extension FastTextColor on TextStyle {
  TextStyle primary(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.primary);

  TextStyle secondary(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.secondary);

  TextStyle tertiary(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.tertiary);

  TextStyle onPrimary(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.onPrimary);

  TextStyle onSecondary(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.onSecondary);

  TextStyle onTertiary(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.onTertiary);

  TextStyle background(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.surface);

  TextStyle onBackground(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.onSurface);

  TextStyle surface(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.surface);

  TextStyle onSurface(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.onSurface);

  TextStyle surfaceTint(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.surfaceTint);

  TextStyle error(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.error);

  TextStyle onError(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.onError);

  TextStyle outline(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.outline);

  TextStyle inversePrimary(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.inversePrimary);

  TextStyle inverseSurface(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.inverseSurface);

  TextStyle onInverseSurface(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.onInverseSurface);

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
}

extension FastColor on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primary => colorScheme.primary;

  Color get secondary => colorScheme.secondary;

  Color get tertiary => colorScheme.tertiary;

  Color get primaryContainer => colorScheme.primaryContainer;

  Color get secondaryContainer => colorScheme.secondaryContainer;

  Color get tertiaryContainer => colorScheme.tertiaryContainer;

  Color get onPrimary => colorScheme.onPrimary;

  Color get onSecondary => colorScheme.onSecondary;

  Color get onTertiary => colorScheme.onTertiary;

  Color get background => colorScheme.surface;

  Color get onBackground => colorScheme.onSurface;

  Color get surface => colorScheme.surface;

  Color get onSurface => colorScheme.onSurface;

  Color get surfaceTint => colorScheme.surfaceTint;

  Color get error => colorScheme.error;

  Color get onError => colorScheme.onError;

  Color get outline => colorScheme.outline;

  Color get inversePrimary => colorScheme.inversePrimary;

  Color get inverseSurface => colorScheme.inverseSurface;

  Color get onInverseSurface => colorScheme.onInverseSurface;
}
