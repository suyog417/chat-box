import 'package:auto_size_text/auto_size_text.dart';
import 'package:chatbox/on_boarding/sign_in.dart';
import 'package:chatbox/on_boarding/sign_up.dart';
import 'package:chatbox/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/svgs.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        forceMaterialTransparency: true,
        // systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: DefaultTextStyle(
        style: GoogleFonts.poppins(color: Colors.white),
        child: Container(
          padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.04),
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              focal: Alignment(0.5, -0.7),
              focalRadius: 0.15,
              radius: 1,
              tileMode: TileMode.clamp,
              colors: [
                Colors.purple,
                Colors.black
              ],),
          ),
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            // gradient: SweepGradient(colors: [Colors.purple,
            //   Colors.black])
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: AppBar().preferredSize.height * 0.5,),
              OverflowBar(
                alignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.string(chatBoxLogo),
                  const AutoSizeText(" Chatbox",style: TextStyle(fontSize: 20),)
                ],),
              const AutoSizeText.rich(TextSpan(text: 'Connect Friends ',children: [
                TextSpan(text: 'easily & quickly',style: TextStyle(fontWeight: FontWeight.w600))
              ]),maxLines: 4,style: TextStyle(fontSize: 72),softWrap: true,),
              const AutoSizeText('Our chat app is the perfect way to stay connected with friends and family.',style: TextStyle(fontSize: 18),maxLines: 2,),
              SizedBox(
                height: AppBar().preferredSize.height / 2,
              ),
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
              FilledButton(onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context) => const SignUp(),));
              }, child: const Text("Sign Up With E-mail"),),
              const Spacer(),
              AutoSizeText.rich(TextSpan(
                  text: 'Existing User? ',
                  children: [TextSpan(text: 'Log in',recognizer: TapGestureRecognizer()..onTap = (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => const SignIn(),));
                  },style: const TextStyle(fontWeight: FontWeight.bold))]
              ),textAlign: TextAlign.center,),
              SizedBox(height: AppBar().preferredSize.height * 0.3,)
            ],
          ),
        ),
      ),
    );
  }
}