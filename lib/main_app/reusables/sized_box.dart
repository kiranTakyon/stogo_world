import 'package:flutter/widgets.dart';

final SizedBox sh5 = const SizedBox(height: 5);
final SizedBox sh10 = const SizedBox(height: 10);
final SizedBox sh20 = const SizedBox(height: 20);
final SizedBox sh30 = const SizedBox(height: 30);
final SizedBox sh40 = const SizedBox(height: 40);
final SizedBox sh50 = const SizedBox(height: 50);
final SizedBox sh100 = const SizedBox(height: 100);
final SizedBox sh200 = const SizedBox(height: 200);

final SizedBox sw5 = const SizedBox(width: 5);
final SizedBox sw10 = const SizedBox(width: 10);
final SizedBox sw20 = const SizedBox(width: 20);
final SizedBox sw30 = const SizedBox(width: 30);
final SizedBox sw40 = const SizedBox(width: 40);
final SizedBox sw50 = const SizedBox(width: 50);

Size getScreenSize(BuildContext context) => MediaQuery.of(context).size;
