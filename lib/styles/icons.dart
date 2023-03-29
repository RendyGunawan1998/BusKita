// ------- ICONS -------

// Dart imports:
import 'dart:io' show Platform;

// Flutter imports:
import 'package:flutter/material.dart';

final IconData backButtonIcon =
    Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back;
final IconData forwardButtonIcon =
    Platform.isIOS ? Icons.arrow_forward_ios : Icons.arrow_forward;
