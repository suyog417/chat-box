import 'package:auto_size_text/auto_size_text.dart';
import 'package:chatbox/cubits/signIn_cubits/signIn_bloc.dart';
import 'package:chatbox/screens/home_layout.dart';
import 'package:chatbox/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool showPass = false;
  final _formKey = GlobalKey<FormState>();

  bool _name = true;
  bool _email = true;
  bool _password = true;

  textfieldUnfocus(PointerDownEvent event){
    FocusManager.instance.primaryFocus!.unfocus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    FocusManager.instance.primaryFocus!.unfocus();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,size: 18),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AutoSizeText("Sign Up with E-mail",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                const Divider(color: Colors.transparent,),
                const AutoSizeText("Get chatting with friends and family today by signing up for our chat app!",style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
                SizedBox(height: AppBar().preferredSize.height,),
                AutoSizeText("Your Name",style: TextStyle(color: _name ? textFieldLabelColor : Colors.red,fontWeight: FontWeight.bold),),
                TextFormField(
                  onTapOutside: textfieldUnfocus,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _name = true;
                      _formKey.currentState!.reset();
                    });
                  },
                  validator: (value) {
                    if(value == null || value.isEmpty){
                     setState(() {
                       _name = false;
                     });
                      return "Enter valid Name";
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent,),
                const AutoSizeText("Your Email",style: TextStyle(color: textFieldLabelColor,fontWeight: FontWeight.bold),),
                TextField(
                  onTapOutside: textfieldUnfocus,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero
                  ),
                ),
                const Divider(color: Colors.transparent,),
                const AutoSizeText("Password",style: TextStyle(color: textFieldLabelColor,fontWeight: FontWeight.bold),),
                TextField(
                  onTapOutside: textfieldUnfocus,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero
                  ),
                ),
                const Divider(color: Colors.transparent,),
                const AutoSizeText("Confirm Password",style: TextStyle(color: textFieldLabelColor,fontWeight: FontWeight.bold),),
                TextField(
                  onTapOutside: textfieldUnfocus,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    suffix: IconButton(onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    }, icon: const Icon(Icons.remove_red_eye_rounded))
                  ),
                  obscureText: true,
                ),
                SizedBox(height: AppBar().preferredSize.height,),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width * 0.04),
        width: MediaQuery.sizeOf(context).width,
        child: FilledButton(onPressed: () {
          signInWithGoogle();
          // if(_formKey.currentState!.validate()){
          //   print(("Form validated."));
          // }
          // Navigator.push(context, CupertinoPageRoute(builder: (context) => const HomeLayout(),));
        }, child: const Text("Create an account",style: TextStyle(fontWeight: FontWeight.bold),),),
      ),
    );
  }
}
