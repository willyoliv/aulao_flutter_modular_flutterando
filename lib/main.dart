import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_aula/src/app_module.dart';
import 'package:modular_aula/src/app_widget.dart';

void main() {
  Modular.to.addListener((() {
    Modular.to.path;
  }));

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
