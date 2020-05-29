class Contact {
  int _id;
  String _name;
  String _phone;
  String _status;

  Contact(this._name, this._phone, this._status);

  Contact.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._phone = map['phone'];
    this._status = map['status'];
  }

  // getter
  int get id => _id;
  String get name => _name;
  String get phone => _phone;
  String get status => _status;

  // setter
  set name(String value) {
    _name = value;
  }

  set phone(String value) {
    _phone = value;
  }

  set status(String value) {
    _status = value;
  }

  // konversi dari Contact ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['phone'] = phone;
    map['status'] = status;
    return map;
  }
}