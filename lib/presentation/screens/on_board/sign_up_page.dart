
import 'package:flutter/material.dart';

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
  var genderController=TextEditingController();
  bool isHide=true;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
        body: MediaQuery.of(context).size.height>550?
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Create Account',style: TextStyle(fontSize: 30,)),
              mySizeBox(),
              myTextFiled(controllerName: nameController, label: 'Name',hint: 'Enter your Name'),
              mySizeBox(),
              myTextFiled(controllerName: mobController, label: 'Mobile Number',hint: 'Enter your Mobile Number',keyboardType: TextInputType.number,),
              mySizeBox(),
              myTextFiled(controllerName: genderController, label: 'Gender',hint: 'Enter your Gender',),
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
              Container(
                width: 500,
                height: 50,
                child: ElevatedButton(onPressed: () async {
                }, child: Text('Sign Up',style: TextStyle(fontSize: 25,color: Colors.white),),style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.blue.shade500,),),
              ),
              mySizeBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an Account,',style: TextStyle(fontSize: 20,color: Colors.purple.shade600),),
                  InkWell(onTap: (){
                    Navigator.pop(context);
                  },
                      child: Text(' Login now',style: TextStyle(fontSize: 21,color: Colors.blue),)),
                ],
              ),
            ],
          ),
        ):Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create Account',style: TextStyle(fontSize: 30,)),
                mySizeBox(),
                myTextFiled(controllerName: nameController, label: 'Name',hint: 'Enter your Name'),
                mySizeBox(),
                myTextFiled(controllerName: mobController, label: 'Mobile Number',hint: 'Enter your Mobile Number',keyboardType: TextInputType.number,),
                mySizeBox(),
                myTextFiled(controllerName: genderController, label: 'Gender',hint: 'Enter your Gender',),
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
                Container(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(onPressed: () async {

                  }, child: Text('Sign Up',style: TextStyle(fontSize: 25,color: Colors.white),),style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Colors.blue.shade500,),),
                ),
                mySizeBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account,',style: TextStyle(fontSize: 20,color: Colors.purple.shade600),),
                    InkWell(onTap: (){
                      Navigator.pop(context);
                    },
                        child: Text(' Login now',style: TextStyle(fontSize: 21,color: Colors.blue),)),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
