import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/assets/assets.gen.dart';
import 'package:kasir_app/core/router/app_router.dart';
import 'package:kasir_app/core/router/router_constants.dart';
import 'package:kasir_app/features/auth/presentetion/bloc/login/login_bloc.dart';
import 'package:kasir_app/features/auth/presentetion/pages/register_page.dart';
import 'package:kasir_app/features/auth/presentetion/widget/button.dart';
import 'package:kasir_app/features/auth/presentetion/widget/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is LoginLoaded) {
            context.goNamed(RouteConstants.root,
                pathParameters: PathParameters().toMap());
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 50.0),
                  Center(child: Assets.images.logo.image(fit: BoxFit.cover)),
                  Text(
                    "E-Kasir",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "E-mail",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  QTextField(
                    controller: _emailController,
                    label: "Enter your email",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  QTextField(
                    label: "Enter your password",
                    obscure: _obscureText,
                    controller: _passwordController,
                    suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          !_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black87,
                        ),
                        onPressed: _togglePassword),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  QButton(
                      label: 'Login',
                      onPressed: () {
                        context.read<LoginBloc>().add(OnLogin(
                            email: _emailController.text,
                            password: _passwordController.text));
                      }),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member?'),
                      SizedBox(width: 7),
                      InkWell(
                        onTap: () {
                          context.pushNamed(RouteConstants.register);
                        },
                        child: Text(
                          'Register now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
