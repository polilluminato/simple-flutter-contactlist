import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_flutter_contactlist/models/contact.dart';

import 'package:simple_flutter_contactlist/ui/contact_row.dart';
import 'package:simple_flutter_contactlist/ui/fav_avatar.dart';
import 'package:simple_flutter_contactlist/utils/utils.dart' as Utils;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter Contact List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24, color: Colors.white),
          headline6: TextStyle(fontSize: 16, color: Colors.green),
        ),
      ),
      home: MyHomePage(title: 'Simple Flutter Contact List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _contactListNumberPeople = 25;
  final _faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.search,
            size: 26,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.more_vert,
              size: 26,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  FavAvatar(
                      link:
                          "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/00/001ccef182d7504961fb1bed6593a58cc5dba110_full.jpg"),
                  FavAvatar(
                      link:
                          "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/40/405eb712c10aab48663509ed57163039119e4341_full.jpg"),
                  FavAvatar(
                      link:
                          "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/40/40a7ac4651bbbd49866138add9f1d346ca35f423_full.jpg"),
                  FavAvatar(
                      link:
                          "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/40/40a14c570f7883538ffa9948be79664df3c30283_full.jpg"),
                  FavAvatar(
                      link:
                          "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/46/46cfbb595c45beb5f1c8a30d6cb31bf91685a9fe_full.jpg"),
                  FavAvatar(
                      link:
                          "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/20/207fe77523d657080fecf6fbe68d8ca66fe52553_full.jpg"),
                  FavAvatar(
                      link:
                          "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/58/5860b7c464f4f8da96e616eb7b50e25ab32f915e_full.jpg"),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Text(
                    "Contacts",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _contactListNumberPeople,
                itemBuilder: (BuildContext context, int index) {
                  String _contactFirstName = _faker.person.firstName();
                  String _contactLastName = _faker.person.lastName();
                  String _domainName = _faker.internet.domainName();

                  Contact _thisPerson = Contact(
                      name: _contactFirstName,
                      surname: _contactLastName,
                      phone: _faker.phoneNumber.us(),
                      email: Utils.createEmail(
                          _contactFirstName, _contactLastName, _domainName),
                      address: _faker.address.streetAddress(),
                      city: _faker.address.city(),
                      username: Utils.createUsername(
                          _contactFirstName, _contactLastName),
                      avatar: Utils.createAvatarLink(
                          _contactFirstName, _contactLastName));

                  return ContactRow(contact: _thisPerson);
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.person_add_alt_1),
      ),
    );
  }
}
