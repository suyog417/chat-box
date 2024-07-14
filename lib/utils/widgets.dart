import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      alignment: MainAxisAlignment.center,
      children: [
        IconButton.outlined(
          onPressed: (){},
          icon: SvgPicture.asset('assets/svgs/google.svg',height: 28,),
        ),
        const VerticalDivider(color: Colors.transparent,),
        IconButton.outlined(
          onPressed: (){},
          icon: SvgPicture.asset('assets/svgs/facebook.svg',height: 28,),
        ),
        const VerticalDivider(color: Colors.transparent,),
        IconButton.outlined(
          onPressed: (){},
          icon: SvgPicture.asset('assets/svgs/apple.svg',height: 28,color: Colors.white,),
        ),
      ],
    );
  }
}
