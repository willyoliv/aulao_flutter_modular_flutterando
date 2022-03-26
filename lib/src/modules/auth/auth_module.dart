import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_aula/src/modules/auth/blocs/login_bloc.dart';
import 'package:modular_aula/src/modules/auth/views/login_page.dart';

import 'repositories/login_repository.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginRepository()),
        Bind.singleton((i) => LoginBloc(i(), i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const LoginPage()),
      ];
}
