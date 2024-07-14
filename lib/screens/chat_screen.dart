import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  GlobalKey bottomSheetKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.1),offset: const Offset(0, 7),blurRadius: 5,spreadRadius: 1)
                ]
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.01,vertical: 0),
                leading: ButtonBar(
                  overflowButtonSpacing: 0,
                  buttonPadding: EdgeInsets.zero,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Theme.of(context).colorScheme.surface,)),
                    const CircleAvatar(),
                  ],
                ),
                title: AutoSizeText("UserName",style: TextStyle(color: Theme.of(context).colorScheme.surface),maxLines: 1,),
                subtitle: const AutoSizeText("Active Now",maxLines: 1,),
                trailing: ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.phone,color: Theme.of(context).colorScheme.surface)),
                    IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.video_camera,color: Theme.of(context).colorScheme.surface))
                  ],
                ),
              ),
            ),
            // Spacer(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.05),
                itemCount: 30,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                reverse: true,
                itemBuilder: (context, index) {
                return BubbleSpecialOne(
                  color: Colors.teal.shade100,
                  text: "How are you?",isSender: true,
                  tail: true,
                  seen: false,
                  delivered: true,
                );
              },),
            ),
            const Divider(color: Colors.transparent,),
            SizedBox(
              height: AppBar().preferredSize.height,
            )
          ],
        ),
        resizeToAvoidBottomInset: true,
        bottomSheet: Container(
          key: bottomSheetKey,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.5),width: 0.5))
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.attachment)),
              Expanded(child: TextField(
                onTapOutside: (event) {
                  FocusNode().unfocus();
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.3),
                  hintText: "Write your message",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.05),borderSide: const BorderSide(color: Colors.transparent)),
                ),
              )),
              IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.camera)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.mic_none))
            ],
          ),
        ),
      ),
    );
  }
}
