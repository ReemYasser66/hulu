import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/confimation.dart';
import 'package:movies/download.dart';

import 'login.dart';

class Register extends StatefulWidget {
   Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isObscure=true;

  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController confirm = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  bool isLoading=false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: Form(
            key: formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Login ();
                      }));
                    } ,
                    child: Container(
                      child: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white54, ),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.white54
                        )
                      ),
                    ),
                  ),
                ), //arrow back
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Create Account', style: TextStyle(color: Color(0xff00CF71), fontSize: 30,fontWeight: FontWeight.bold),),
                ),   //text1
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Register now and start exploring all that our app has to\noffer. We’re excited to welcome you to our community!', style: TextStyle(color: Colors.white, fontSize: 11,),),
                ),  //text2
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
                            borderRadius: BorderRadius.circular(10)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xff00CF71))
                        )
                    ),

                  ),
                ),  //user
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
                            borderRadius: BorderRadius.circular(10)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xff00CF71))
                        )
                    ),

                  ),
                ),   //pass
                Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: confirm,
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
                    hintText:'Confirm Password',
                    hintStyle: const TextStyle(color: Colors.white54),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff00CF71))
                    )
                ),

              ),
            ),   //confirmpass
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: phone,
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
                        hintText: 'Enter yous phone number',
                        hintStyle: const TextStyle(
                            color: Colors.white54
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xff00CF71))
                        )
                    ),

                  ),
                ), //num
                const SizedBox(height:15,),
                Center(
                  child: isLoading==false? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        if(formKey.currentState!.validate()==true){
                          signUpFirebase();
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
                        const Text('Create Account' , style: TextStyle(color: Colors.black , fontSize: 20 ,fontWeight: FontWeight.bold),),

                      ),
                    ),
                  ):CircularProgressIndicator(color: Colors.greenAccent,)
                ), //create
                const SizedBox(height: 7,),
                const Center(child: Text('By logging. your agree to our and Privacy Policy.', style: TextStyle(color: Colors.white54 , fontSize: 10),)),
                const SizedBox(height: 10,),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?', style: TextStyle(color: Colors.white54 , fontSize: 10),),
                    InkWell(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return Login ();
                          // }));
                          signUpFirebase();
                        },
                        child: const Text('Sign in', style: TextStyle(color: Color(0xff00CF71) , fontSize: 10),)),
                  ],
                )
              ],),
          ),

        ),
      ),
    );
  }
  signUpFirebase() async{
    setState(() {
      isLoading=true;
    });
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.trim(), password: pass.text.trim()).then ((value)=> ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User Created Successfully"),backgroundColor: Colors.green,)))
        .then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (context){return Login();})));
    isLoading=false;
  } on FirebaseAuthException catch(e){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.message}"),backgroundColor: Colors.red.shade900,));

  }finally{
    setState(() {
      isLoading=false;
    });
  }

  }
}
