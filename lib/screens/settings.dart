import 'package:chatbox/utils/themes.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  double radius = 25;
  // final controller =ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    // controller.addListener(onScroll);
    super.initState();
  }
  // onScroll(){
  //   setState(() {
  //     if(radius != 0){
  //       radius--;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // controller: controller,
      slivers: [
        const SliverAppBar(
          title: Text("Seetings"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          pinned: true,
          backgroundColor: textFieldLabelColor,
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
              color: Theme.of(context).primaryColor
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) {
              return ListTile(
                title: Text(index.toString(),style: TextStyle(color: Theme.of(context).colorScheme.surface),),
              );
            },)
          ),
        )
      ],
    );
  }
}
