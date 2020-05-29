import 'package:flutter/material.dart';
import 'uientryform.dart';
import 'kontak.dart';
import 'databases.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Contact> contactList;

  @override
  Widget build(BuildContext context) {
    if (contactList == null) {
      contactList = List<Contact>();
    }

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
            Icons.home,
            color: Colors.white,
            size: 30
        ),
        title: Text('Organisasi Desa'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.white, size: 28),
            onPressed: () async {
              var contact = await navigateToEntryForm(context, null);
              if (contact != null) addContact(contact);
            },
          ),
        ],
        bottom: PreferredSize(
            child: Container(
              color:Colors.cyan,
              height: 4.0,
            ),
            preferredSize: null
        ),
      ),
      body: createListView(),
    );
  }

  Future<Contact> navigateToEntryForm(BuildContext context, Contact contact) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) {
              return EntryForm(contact);
            }
        )
    );
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.cyanAccent,
              child: Icon(Icons.person),
            ),
            title: Text(this.contactList[index].name, style: textStyle,),
            subtitle: Text(this.contactList[index].status + ' | ' + this.contactList[index].phone),
            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.redAccent,),
              onTap: () {
                deleteContact(contactList[index]);
              },
            ),
            onTap: () async {
              var contact = await navigateToEntryForm(context, this.contactList[index]);
              if (contact != null) editContact(contact);
            },
          ),
        );
      },
    );
  }

  void addContact(Contact object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  void editContact(Contact object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  void deleteContact(Contact object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Contact>> contactListFuture = dbHelper.getContactList();
      contactListFuture.then((contactList) {
        setState(() {
          this.contactList = contactList;
          this.count = contactList.length;
        });
      });
    });
  }

}