import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/');
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    // return false;
    return true;
  }
}
