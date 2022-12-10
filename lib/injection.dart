import 'package:get_it/get_it.dart';
import 'package:todo/application/auth/signupform/sign_up_form_bloc.dart';

final sl = GetIt.I;

Future<void> init() async {
  //State Management
  sl.registerFactory(() => SignUpFormBloc());
}
