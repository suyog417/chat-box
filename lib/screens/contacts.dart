import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton.outlined(onPressed: () {}, icon: const Icon(CupertinoIcons.search)),
          leadingWidth: MediaQuery.sizeOf(context).width * 0.2,
          automaticallyImplyLeading: false,
          title: Text("Contacts"),
          centerTitle: true,
        )
      ],
    );
  }
}
