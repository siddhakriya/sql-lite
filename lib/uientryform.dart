import 'package:flutter/material.dart';
import 'kontak.dart';

class EntryForm extends StatefulWidget {
  final Contact contact;
  EntryForm(this.contact);
  @override
  EntryFormState createState() => EntryFormState(this.contact);
}

class EntryFormState extends State<EntryForm> {
  Contact contact;
  EntryFormState(this.contact);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (contact != null) {
      nameController.text = contact.name;
      phoneController.text = contact.phone;
      statusController.text = contact.status;
    }

    return Scaffold(
        appBar: AppBar(
          title: contact == null ? Text('Tambah') : Text('Edit'),
          leading: Icon(Icons.keyboard_arrow_left),
          bottom: PreferredSize(
              child: Container(
                color:Colors.green[800],
                height: 4.0,
              ),
              preferredSize: null
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
          child: ListView(
            children: <Widget> [
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Telepon',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: statusController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Jabatan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:10.0, bottom:10.0),
                child: Row(
                  children: <Widget> [
                    Expanded(
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(
                          'Simpan',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (contact == null) {
                            contact = Contact(nameController.text, phoneController.text, statusController.text);
                          } else {
                            contact.name = nameController.text;
                            contact.phone = phoneController.text;
                            contact.status = statusController.text;
                          }
                          Navigator.pop(context, contact);
                        },
                      ),
                    ),
                    Container(width: 5.0,),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text(
                          'Batal',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}