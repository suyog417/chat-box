import 'package:auto_size_text/auto_size_text.dart';
import 'package:chatbox/utils/dimensions.dart';
import 'package:chatbox/utils/themes.dart';
import 'package:chatbox/utils/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimensions appDimensions = AppDimensions();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: appDimensions.horizontalScreenPadding(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AutoSizeText("Log in to Chatbox",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.center,),
            const Divider(color: Colors.transparent,),
            const AutoSizeText("Welcome back! Sign in using your social\naccount or email to continue us",textAlign: TextAlign.center,),
            const Divider(color: Colors.transparent,),
            const SignInButtons(),
            SizedBox(
              height: AppBar().preferredSize.height,
              child: const Row(
                children: [
                  Expanded(child: Divider()),
                  Text("  OR  "),
                  Expanded(child: Divider()),
                ],
              ),
            ),
            const AutoSizeText("Your Email",style: TextStyle(color: textFieldLabelColor,fontWeight: FontWeight.bold),),
            const TextField(
              decoration: InputDecoration(
              ),
            ),
            const Divider(color: Colors.transparent,),
            const AutoSizeText("Password",style: TextStyle(color: textFieldLabelColor,fontWeight: FontWeight.bold),),
            const TextField(
              decoration: InputDecoration(
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.04),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(onPressed: (){}, child: const Text("Log in")),
            TextButton(onPressed: () {}, child: const Text("Forgot password?",style: TextStyle(color: textFieldLabelColor),))
          ],
        ),
      ),
    );
  }
}
