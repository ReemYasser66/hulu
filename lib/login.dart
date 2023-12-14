import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/home.dart';
import 'package:movies/register.dart';

import 'onboarding.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool check =false;
  bool isObscure=true;
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body:
          Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Container(alignment: Alignment.center,
                  height: 130,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('images/Hulu-Logo 1.png'),
                  ),
                ), //logo
                const SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
controller: email,
                    style: const TextStyle(color: Colors.white54),
                    validator: (String? value ){
                      if(value!.isEmpty || value==null){
                        return 'Required';
                      }
                    },
                    decoration:
                    InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                        hintText: 'User Name',
                        hintStyle: const TextStyle(
                          color: Colors.white54
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Color(0xff00CF71))
                        )
                    ),

                  ),
                ),    //username
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
controller: pass,
                    style: const TextStyle(color: Colors.white54),
                    validator: (String? value ){
                      if(value!.isEmpty || value==null){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Fill Data")));
                        return 'Required';
                      }
                    },
                    
                    obscureText:isObscure,
                    decoration: InputDecoration(
                      filled: true,
                        fillColor: Colors.white10,
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            isObscure=!isObscure;
                          });
                        },icon: const Icon(Icons.remove_red_eye_outlined , color: Colors.white54,),
                        ),
                        hintText:'Password',
                        hintStyle: const TextStyle(color: Colors.white54),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Color(0xff00CF71))
                        )
                    ),

                  ),
                ), //pass
                Row(
                  children: [
                    Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(width: 1.0, color: Colors.white54),
                        ),
                        checkColor: Colors.white54,
                        value: check ,
                        activeColor: const Color(0xff232429),
                        onChanged: (value){
                          check=value!;
                          setState(() {

                          });
                        }
                    ),
                    const Text('Remember me', style: TextStyle(color: Colors.white54)),
                    const SizedBox(width: 80,),
                    const Flexible(child: Text('Forget Password ?', style: TextStyle(color: Colors.white54),))
                  ],
                ),
               isLoading==false?
               Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      if(formKey.currentState!.validate()==true){
                        signInFirebase();
                      }
                    },
                    child: Container(

                      alignment: Alignment.center,
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color(0xff00CF71),
                        borderRadius:BorderRadius.circular(10),
                      ),
                      child:
                      const Text('Sign in' , style: TextStyle(color: Colors.black , fontSize: 20 ,fontWeight: FontWeight.bold),),

                    ),
                  ),
                )
                   :const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: CircularProgressIndicator(color: Colors.greenAccent,),
                   ),
                const Text('Or sign up with', style: TextStyle(color: Colors.white54),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: const Icon(Icons.facebook , color: Colors.white,),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white54
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: const Icon(Icons.apple,color: Colors.white,),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white54
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: const Icon(Icons.insert_emoticon,color: Colors.white,),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white54
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don’t have an account?',style: TextStyle(color: Colors.white54),),
                    InkWell(
                        onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Register ();
                      }));
                    },
                        child: const Text('Register',style: TextStyle(color: Color(0xff00CF71)),))
                  ],

                )
              ],
            ),
          )
          ,
        ),
      ),
    );
  }
  signInFirebase() async{
    setState(() {
      isLoading=true;
    });

    try{
       await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: pass.text.trim(),).then((value) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Logined Successfully"),backgroundColor: Colors.green,))).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context){
            return Home();
       })));
    } on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.message}"),backgroundColor: Colors.red.shade900,));
    }finally{
      setState(() {
        isLoading=false;
      });
    }

  }
}
