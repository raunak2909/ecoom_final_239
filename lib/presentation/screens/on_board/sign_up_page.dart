
import 'package:ecommerce_app/presentation/screens/on_board/sign_up_bloc/sign_bloc.dart';
import 'package:ecommerce_app/presentation/screens/on_board/sign_up_bloc/sign_event.dart';
import 'package:ecommerce_app/presentation/screens/on_board/sign_up_bloc/sign_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/ui_helper.dart';
class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  var emailController=TextEditingController();
  var passController=TextEditingController();
  var nameController=TextEditingController();
  var mobController=TextEditingController();
  bool isHide=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Create Account',style: TextStyle(fontSize: 30,)),
              mySizeBox(),
              myTextFiled(controllerName: nameController, label: 'Name',hint: 'Enter your Name'),
              mySizeBox(),
              myTextFiled(controllerName: mobController, label: 'Mobile Number',hint: 'Enter your Mobile Number',keyboardType: TextInputType.number,),
              mySizeBox(),
              myTextFiled(controllerName: emailController, label: 'Email',hint: 'Enter your Email',),
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
                          onTap: (){
                            if(isHide){
                              isHide=false;
                            }else{
                              isHide=true;
                            }
                            setState(() {});
                          },
                          child: Icon(Icons.remove_red_eye)),
                      border: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(12),
                      )
                  ),
                  obscureText: isHide,
                ),
              ),
              mySizeBox(),
              BlocListener<SignupBloc,SignupState>(
                listener: (context, state){
                  if(state is SErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg)));
                  }else if(state is SLoadedState){
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(onPressed: ()  {
                    context.read<SignupBloc>().add(SignEvent(
                        name: nameController.text.toString(),
                        mobile_number:mobController.text,
                        email:  emailController.text.toString(),
                        password:  passController.text.toString()));

                  }, child: Text('Sign Up',style: TextStyle(fontSize: 25,color: Colors.white),),style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Colors.blue.shade500,),),
                ),),
              mySizeBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an Account,',style: TextStyle(fontSize: 20,color: Colors.purple.shade600),),
                  InkWell(onTap: (){
                  },
                      child: Text(' Login now',style: TextStyle(fontSize: 21,color: Colors.blue),)),
                ],
              ),
            ],
          ),
        )
    );
  }
}
