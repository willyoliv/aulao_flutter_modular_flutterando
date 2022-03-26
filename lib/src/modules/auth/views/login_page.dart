import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_aula/src/modules/auth/blocs/events/login_event.dart';
import 'package:modular_aula/src/modules/auth/blocs/login_bloc.dart';
import 'package:modular_aula/src/modules/auth/blocs/states/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginBloc> {
  @override
  void initState() {
    super.initState();
    bloc.stream.listen((state) async {
      if (state is LoginSuccess) {
        await Future.delayed(const Duration(milliseconds: 300));
        Modular.to.navigate('/products/red');
      }

      if (state is LoginFailure) {
        final banner = MaterialBanner(
          content: const Text('Erro no login'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  // Modular.to.pop();
                },
                child: const Text('Chato'))
          ],
        );
        ScaffoldMessenger.of(context).showMaterialBanner(banner);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login page'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoginSuccess) {
              return const Center(
                child: Text('Entrou'),
              );
            }
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    bloc.add(LoginWithEmail(
                        password: '123', email: 'willy@email.com'));
                  },
                  child: const Text("Login")),
            );
          }),
    );
  }
}
