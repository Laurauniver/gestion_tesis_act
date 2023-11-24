import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/core/contants/app_colors.dart';
import 'package:gestion_tesis/src/core/validators/form_validator.dart';
import 'package:gestion_tesis/src/presentation/pages/auth/bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late TextEditingController _userController;
  late TextEditingController _passwordController;

  late bool obscureText = true;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    _userController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  void _clearForm() {
    _userController.clear();
    _passwordController.clear();
    _keyForm.currentState?.reset();
  }

  @override
  void dispose() {
    _userController.clear();
    _passwordController.clear();
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return AuthForm(
        keyForm: _keyForm,
        emailController: _userController,
        passwordController: _passwordController,
        authBloc: authBloc);
  }
}

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required GlobalKey<FormState> keyForm,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.authBloc,
  })  : _keyForm = keyForm,
        _userController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _keyForm;
  final TextEditingController _userController;
  final TextEditingController _passwordController;
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {


    

    return Form(
      key: _keyForm,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 1.0,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: TextFormField(
                    autocorrect: true,
                    keyboardType: TextInputType.text,
                    controller: _userController,
                    validator: validateUserLogin,
                    cursorColor: AppColors.baseColor,
                    decoration: InputDecoration(
                      hintText: "Usuario",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Icon(
                          Icons.people_alt_outlined,
                          color: AppColors.baseColor,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: validatedPasswordLogin,
                    cursorColor: AppColors.baseColor,
                    decoration: const InputDecoration(
                      hintText: "***********",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                        child: Icon(
                          Icons.lock_outlined,
                          color: AppColors.baseColor,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthStateLogged) {
                      Navigator.pushReplacementNamed(context, 'navBar');
                    } else if (state is AuthStateFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.message)));
                    }
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.baseColor,
                      ),
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          authBloc.add(
                            OnLoginEvent(
                              _userController.text,
                              _passwordController.text,
                            ),
                          );
                        }
                      },
                      child: const Text('Iniciar sesión'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
