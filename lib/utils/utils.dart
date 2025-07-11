import 'package:flutter/cupertino.dart';

abstract class Utils {
  static Size screenSize(BuildContext context) => MediaQuery.sizeOf(context);
}
