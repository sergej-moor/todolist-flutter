import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/auth/signupform/sign_up_form_bloc.dart';
import 'package:todo/presentation/signup/widgets/signin_register_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    late String _email;
    late String _password;

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String? validateEmail(String? input) {
      const emailRegex =
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

      if (input == null || input.isEmpty) {
        return "please enter email";
      } else if (RegExp(emailRegex).hasMatch(input)) {
        _email = input;
        return null;
      } else {
        return "invalid email format";
      }
    }

    String? validatePassword(String? input) {
      if (input == null || input.isEmpty) {
        return "please enter password";
      } else if (input.length >= 6) {
        _password = input;
        return null;
      } else {
        return "password should be longer than 5 characters";
      }
    }

    final themeData = Theme.of(context);
    return BlocConsumer<SignUpFormBloc, SignUpFormState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showValidationMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 80),
              Text(
                "Willkommen",
                style: themeData.textTheme.headline1!.copyWith(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4,
                ),
              ),
              Text(
                "Please register or sign in",
                style: themeData.textTheme.headline1!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              TextFormField(
                cursorColor: Colors.white,
                decoration: const InputDecoration(labelText: "E-Mail"),
                validator: validateEmail,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorColor: Colors.white,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: validatePassword,
              ),
              SizedBox(
                height: 40,
              ),
              SignInRegisterButton(
                buttonText: "Sign In",
                callback: () {
                  print("sign in pressed");
                  if (formKey.currentState!.validate()) {
                    print("validated");
                    BlocProvider.of<SignUpFormBloc>(context).add(
                      SignInWithEmailAndPasswordPressed(
                          email: _email, password: _password),
                    );
                  } else {
                    print("unvalid");
                    BlocProvider.of<SignUpFormBloc>(context).add(
                      SignInWithEmailAndPasswordPressed(
                          email: null, password: null),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Text(
                          "invalid input",
                          style: themeData.textTheme.bodyText1,
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              SignInRegisterButton(
                buttonText: "Register",
                callback: () {
                  print("register pressed");
                  if (formKey.currentState!.validate()) {
                    print("validated");
                    BlocProvider.of<SignUpFormBloc>(context).add(
                      RegisterWithEmailAndPasswordPressed(
                          email: _email, password: _password),
                    );
                  } else {
                    print("unvalid");
                    BlocProvider.of<SignUpFormBloc>(context).add(
                      RegisterWithEmailAndPasswordPressed(
                          email: null, password: null),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Text(
                          "invalid input",
                          style: themeData.textTheme.bodyText1,
                        ),
                      ),
                    );
                  }
                },
              ),
              if (state.isSubmitting) ...[
                SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  color: themeData.colorScheme.secondary,
                )
              ],
            ],
          ),
        );
      },
    );
  }
}
