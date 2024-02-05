import 'package:flutter/material.dart';

abstract class HyphenAuthenticateDelegate {
  late void Function(Intent) hyphenAuthenticateActivityResultLauncher;
  void Function(dynamic)? hyphenActivityResultCallback;
}
