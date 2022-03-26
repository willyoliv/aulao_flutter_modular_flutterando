import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_aula/src/modules/auth/auth_module.dart';
import 'package:modular_aula/src/modules/auth/guards/auth_guard.dart';
import 'package:modular_aula/src/modules/product/product_module.dart';
import 'package:modular_aula/src/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        AsyncBind((i) => SharedPreferences.getInstance()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => const SplashPage()),
        ModuleRoute("/auth", module: AuthModule()),
        ModuleRoute("/products",
            module: ProductModule(), guards: [AuthGuard()]),
        // RedirectRoute('@route_authorization', to: '/auth/'),
        WildcardRoute(
            child: (_, __) => const Scaffold(
                  body: Center(
                    child: Text('Página não existe'),
                  ),
                ))
      ];
}
