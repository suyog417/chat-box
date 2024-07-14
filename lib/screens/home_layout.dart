import 'package:chatbox/screens/calls.dart';
import 'package:chatbox/screens/chat_screen.dart';
import 'package:chatbox/screens/contacts.dart';
import 'package:chatbox/screens/home.dart';
import 'package:chatbox/screens/settings.dart';
import 'package:chatbox/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/iconoir.dart';
import 'package:iconify_flutter/icons/lucide.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  String query = '';
  int _selectedIndex = 0;
  List<Widget> screens = [
    Home(),
    Calls(),
    Contacts(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textFieldLabelColor,
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.surface),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.text_bubble), label: "Messages"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone), label: "Calls"),
            BottomNavigationBarItem(icon: Icon(Icons.contacts_outlined), label: "Contacts"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
          ]),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<String> searchList = [
    "Apple",
    "Banana",
    "Cherry",
    "Date",
    "Fig",
    "Grapes",
    "Kiwi",
    "Lemon",
    "Mango",
    "Orange",
    "Papaya",
    "Raspberry",
    "Strawberry",
    "Tomato",
    "Watermelon",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return super.appBarTheme(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
            displayColor: Theme.of(context).primaryColor,
            bodyColor: Theme.of(context).primaryColor));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> searchResults =
        searchList.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            searchResults[index],
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {
            // Handle the selected search result.
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionList = query.isEmpty
        ? []
        : searchList.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {
            query = suggestionList[index];
            print(query);
            // Show the search results based on the selected suggestion.
          },
        );
      },
    );
  }
}
