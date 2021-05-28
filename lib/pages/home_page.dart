import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:simple_flutter_contactlist/models/contact.dart';

import 'package:simple_flutter_contactlist/ui/contact_row.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter Contact List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.green[700],
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
  final _faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text(widget.title),
      ),
      body: new Container(
        child: new ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.only(left: 72),
            child: Divider(),
          ),
          itemCount: _contactListNumberPeople,
          itemBuilder: (BuildContext context, int index) {
            
            Contact _thisPerson = new Contact(
                name: _faker.person.firstName(),
                surname: _faker.person.lastName(),
                phone: '999999',
                email: _faker.internet.email(),
                address: _faker.address.streetAddress(),
                city: _faker.address.city(),
                username: _faker.internet.userName(),
                prefix: _faker.person.prefix());

            return new ContactRow(contact: _thisPerson);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.person_add_alt_1),
      ),
    );
  }
}
