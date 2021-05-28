import 'package:flutter/material.dart';

import 'package:faker/faker.dart';
import '../ui/contact_list.dart';
import '../models/contact.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter Contact List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  var faker = new Faker();

  Future<List<Contact>> _createContactList() async {
    List<Contact> _list = List<Contact>.empty(growable: true);
    for (int i = 0; i < _contactListNumberPeople; i++) {
      Contact thisPerson = new Contact(
          name: faker.person.firstName(),
          surname: faker.person.lastName(),
          phone: '999999',
          email: faker.internet.email(),
          address: faker.address.streetAddress(),
          city: faker.address.city(),
          username: faker.internet.userName(),
          prefix: faker.person.prefix());
      _list.add(thisPerson);
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new FutureBuilder<List<Contact>>(
          future: _createContactList(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return new Center(
                child: new CircularProgressIndicator(),
              );
            } else {
              List<Contact> myContactList = snapshot.data ?? [];
              return new ContactList(
                contacts: myContactList,
              );
            }
          },
        ),
      ),
    );
  }
}
