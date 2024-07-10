import 'package:ecommerce_app/domain/api_data/api.dart';
import 'package:ecommerce_app/presentation/screens/on_board/login_bloc/login_bloc.dart';
import 'package:ecommerce_app/presentation/screens/on_board/login_bloc/login_event.dart';
import 'package:ecommerce_app/presentation/screens/on_board/login_bloc/login_state.dart';
import 'package:ecommerce_app/presentation/screens/on_board/sign_up_bloc/sign_bloc.dart';
import 'package:ecommerce_app/presentation/screens/on_board/sign_up_page.dart';
import 'package:ecommerce_app/presentation/screens/pages/home_page.dart';
import 'package:ecommerce_app/presentation/screens/pages/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('E-Commerce',
                        style: TextStyle(
                          fontSize: 30,
                        )),
                    mySizeBox(),
                    myTextFiled(
                        controllerName: emailController,
                        label: 'Email',
                        hint: 'Enter your Email'),
                    mySizeBox(),
                    Container(
                      height: 65,
                      width: 500,
                      child: TextField(
                        controller: passController,
                        decoration: InputDecoration(
                            label: Text('Password'),
                            hintText: 'Enter your Password',
                            suffixIcon: InkWell(
                                onTap: () {
                                  if (isHide) {
                                    isHide = false;
                                  } else {
                                    isHide = true;
                                  }
                                  setState(() {});
                                },
                                child: Icon(Icons.remove_red_eye)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        obscureText: isHide,
                      ),
                    ),
                    mySizeBox(),
                    BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                          if (state is ErrorState) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(state.msg)));
                        } else if (state is LoadedState) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => ProductBloc(apiHelper: ApiHelper()),
                                    child: HomePage()),
                              ));
                        }
                      },
                      child: Container(
                        width: 500,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () async {
                              context.read<LoginBloc>().add(LoginEvent(email:emailController.text.toString(), password:passController.text.toString()));
                            },
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(),
                              backgroundColor: Colors.blue.shade500,
                            )),
                      ),
                    ),
                    mySizeBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                              fontSize: 20, color: Colors.purple.shade600),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                        create: (context) =>
                                            SignupBloc(apiHelper: ApiHelper()),
                                        child: SignUp()),
                                  ));
                            },
                            child: Text(
                              'Sign up',
                              style:
                                  TextStyle(fontSize: 21, color: Colors.blue),
                            )),
                      ],
                    ),
                  ],
                ),
              ),);
  }
}
