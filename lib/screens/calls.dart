import 'package:chatbox/utils/dimensions.dart';
import 'package:chatbox/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton.outlined(onPressed: () {}, icon: const Icon(CupertinoIcons.search)),
          leadingWidth: MediaQuery.sizeOf(context).width * 0.2,
          automaticallyImplyLeading: false,
          title: const Text("Calls"),
          centerTitle: true,
          pinned: true,
          backgroundColor: textFieldLabelColor,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: AppDimensions().verticalScreenPadding(context),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
              color: Theme.of(context).primaryColor
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions().horizontalScreenPadding(context),vertical: AppDimensions().verticalScreenPadding(context)),
              shrinkWrap: true,
              children: [
                Text("Recents",style: TextStyle(
                  fontSize: AppDimensions().horizontalScreenPadding(context) + 5,
                  fontWeight: FontWeight.bold
                ),),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: 15,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                  return ListTile(
                    // contentPadding: EdgeInsets.symmetric(horizontal: AppDimensions().horizontalScreenPadding(context) / 2),
                    contentPadding: EdgeInsets.zero,
                    leading: const CircleAvatar(),
                    title: Text("Caller",style: TextStyle(color: Theme.of(context).colorScheme.surface,fontWeight: FontWeight.bold),),
                    subtitle: const Text("timeago, 9:30 AM",style: TextStyle(color: Colors.blueGrey),),
                    // visualDensity: VisualDensity.comfortable,
                    trailing: ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      alignment: MainAxisAlignment.spaceAround,
                      buttonPadding: EdgeInsets.zero,
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.phone)),
                        IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.videocam,size: AppDimensions().verticalScreenPadding(context),))
                      ],
                    ),
                  );
                },),
              ],
            )
          ),
        )
      ],
    );
  }
}
