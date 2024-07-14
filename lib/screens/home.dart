import 'package:auto_size_text/auto_size_text.dart';
import 'package:chatbox/screens/chat_screen.dart';
import 'package:chatbox/screens/home_layout.dart';
import 'package:chatbox/utils/dimensions.dart';
import 'package:chatbox/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void dispose() {
    // TODO: implement dispose
    FocusManager.instance.primaryFocus!.unfocus();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          actions: [
            const CircleAvatar(
              backgroundColor: Colors.black,
            ),
            const VerticalDivider(
              color: Colors.transparent,
            ),
          ],
          centerTitle: true,
          leadingWidth: MediaQuery.sizeOf(context).width * 0.2,
          leading: IconButton.outlined(onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          }, icon: const Icon(CupertinoIcons.search)),
          title: const AutoSizeText("Home"),
          backgroundColor: textFieldLabelColor,
        ),
        SliverAppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.04),
                child: Row(
                  children: List.generate(
                    10,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.fromBorderSide(
                                        BorderSide(color: Colors.white, width: 2))),
                                child: const CircleAvatar()),
                            const AutoSizeText(
                              "Joe",
                              maxFontSize: 17,
                              minFontSize: 14,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            // height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(MediaQuery.sizeOf(context).width * 0.1))
              ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.04,vertical: MediaQuery.sizeOf(context).width * 0.04),
              itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(),
                contentPadding: EdgeInsets.symmetric(horizontal: AppDimensions().horizontalScreenPadding(context) / 3),
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => const ChatScreen(),));
                },
                title: AutoSizeText("Joe ${index + 1}",style: TextStyle(
                  color: Theme.of(context).colorScheme.surface
                ),),
                subtitle: const AutoSizeText("Joe who?",overflow: TextOverflow.ellipsis,maxLines: 1,),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const AutoSizeText("2 min ago"),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: AutoSizeText("13",style: TextStyle(
                        color: Theme.of(context).colorScheme.surface
                      ),),
                    )
                  ],
                ),
              );
            },),
        ),
        ),
      ],
    );
  }
}
