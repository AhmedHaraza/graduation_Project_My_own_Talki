import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/ChatScreen/main_chat_screen.dart';
import 'package:intl/intl.dart';

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  List<Contact>? _contacts;

  @override
  void initState() {
    super.initState();
    refreshContacts();
  }

  Future<void> refreshContacts() async {
    // Load without thumbnails initially.
    var contacts =
        (await ContactsService.getContacts(withThumbnails: false)).toList();
//      var contacts = (await ContactsService.getContactsForPhone("8554964652"))
//          .toList();
    setState(() {
      _contacts = contacts;
    });

    // Lazy load thumbnails after rendering initial contacts.
    for (final contact in contacts) {
      ContactsService.getAvatar(contact).then((avatar) {
        if (avatar == null) return; // Don't redraw if no change.
        setState(() => contact.avatar = avatar);
      });
    }
  }

  void updateContact() async {
    Contact ninja = _contacts!
        .toList()
        .firstWhere((contact) => contact.familyName!.startsWith("Ninja"));
    ninja.avatar = null;
    await ContactsService.updateContact(ninja);

    refreshContacts();
  }

  _openContactForm() async {
    try {
      var contact = await ContactsService.openContactForm();
      refreshContacts();
    } on FormOperationException catch (e) {
      switch (e.errorCode) {
        case FormOperationErrorCode.FORM_OPERATION_CANCELED:
        case FormOperationErrorCode.FORM_COULD_NOT_BE_OPEN:
        case FormOperationErrorCode.FORM_OPERATION_UNKNOWN_ERROR:
        default:
          print(e.errorCode);
      }
    }
  }

  _updateTest() async {
    Iterable<Contact> johns = await ContactsService.getContacts(query: "john");
    if (johns.length > 0) {
      var firstConatct = johns.first;
      print(firstConatct.middleName);
      firstConatct.givenName = "jhon2";
      firstConatct.middleName = "hi";
      firstConatct.phones = [Item(label: "phone", value: "1234567")];
      await ContactsService.updateContact(firstConatct);
      refreshContacts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MainChatScreen()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1C1C1C),
          title: Text(
            'Contacts List',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: _contacts != null
              ? ListView.builder(
                  itemCount: _contacts?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    Contact c = _contacts!.elementAt(index);
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ContactDetailsPage(
                                  c,
                                  onContactDeviceSave:
                                      contactOnDeviceHasBeenUpdated,
                                )));
                      },
                      leading: (c.avatar != null && c.avatar!.length > 0)
                          ? CircleAvatar(
                              backgroundImage: MemoryImage(c.avatar!))
                          : CircleAvatar(
                              child: Text(c.initials()),
                              backgroundColor: Color.fromRGBO(255, 75, 38, 1.0),
                            ),
                      title: Text(
                        c.displayName ?? "",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  void contactOnDeviceHasBeenUpdated(Contact contact) {
    this.setState(() {
      var id = _contacts?.indexWhere((c) => c.identifier == contact.identifier);
      _contacts![id!] = contact;
    });
  }
}

class ContactDetailsPage extends StatelessWidget {
  ContactDetailsPage(this._contact, {required this.onContactDeviceSave});

  final Contact _contact;
  final Function(Contact) onContactDeviceSave;

  _openExistingContactOnDevice(BuildContext context) async {
    try {
      var contact = await ContactsService.openExistingContact(_contact);
      if (onContactDeviceSave != null) {
        onContactDeviceSave(contact);
      }
      Navigator.of(context).pop();
    } on FormOperationException catch (e) {
      switch (e.errorCode) {
        case FormOperationErrorCode.FORM_OPERATION_CANCELED:
        case FormOperationErrorCode.FORM_COULD_NOT_BE_OPEN:
        case FormOperationErrorCode.FORM_OPERATION_UNKNOWN_ERROR:
        default:
          print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => ContactListPage()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1C1C1C),
          title: Text(_contact.displayName ?? ""),
          actions: <Widget>[
            //          IconButton(
            //            icon: Icon(Icons.share),
            //            onPressed: () => shareVCFCard(context, contact: _contact),
            //          ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => ContactsService.deleteContact(_contact),
            ),
            IconButton(
              icon: Icon(Icons.update),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UpdateContactsPage(
                    contact: _contact,
                  ),
                ),
              ),
            ),
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => _openExistingContactOnDevice(context)),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Name",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  _contact.givenName ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  "Middle name",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  _contact.middleName ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  "Family name",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  _contact.familyName ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  "Prefix",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  _contact.prefix ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  "Suffix",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  _contact.suffix ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  "Birthday",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  _contact.birthday != null
                      ? DateFormat('dd-MM-yyyy').format(_contact.birthday!)
                      : "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  "Company",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  _contact.company ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  "Job",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  _contact.jobTitle ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  "Account Type",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  (_contact.androidAccountType != null)
                      ? _contact.androidAccountType.toString()
                      : "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              AddressesTile(_contact.postalAddresses!.toList()),
              ItemsTile("Phones", _contact.phones!.toList()),
              ItemsTile("Emails", _contact.emails!.toList())
            ],
          ),
        ),
      ),
    );
  }
}

class AddressesTile extends StatelessWidget {
  AddressesTile(this._addresses);

  final Iterable<PostalAddress> _addresses;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
            title: Text(
          "Addresses",
          style: TextStyle(color: Colors.white),
        )),
        Column(
          children: _addresses
              .map((a) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Street",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            a.street ?? "",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Postcode",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            a.postcode ?? "",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "City",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            a.city ?? "",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Region",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            a.region ?? "",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Country",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            a.country ?? "",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class ItemsTile extends StatelessWidget {
  ItemsTile(this._title, this._items);

  final Iterable<Item> _items;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
            title: Text(
          _title,
          style: TextStyle(color: Colors.white),
        )),
        Column(
          children: _items
              .map(
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListTile(
                    title: Text(
                      i.label ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Text(
                      i.value ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class AddContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  Contact contact = Contact();
  PostalAddress address = PostalAddress(label: "Home");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a contact"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _formKey.currentState?.save();
              contact.postalAddresses = [address];
              ContactsService.addContact(contact);
              Navigator.of(context).pop();
            },
            child: Icon(Icons.save, color: Colors.white),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'First name'),
                onSaved: (v) => contact.givenName = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Middle name'),
                onSaved: (v) => contact.middleName = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last name'),
                onSaved: (v) => contact.familyName = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Prefix'),
                onSaved: (v) => contact.prefix = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Suffix'),
                onSaved: (v) => contact.suffix = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                onSaved: (v) =>
                    contact.phones = [Item(label: "mobile", value: v)],
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                onSaved: (v) =>
                    contact.emails = [Item(label: "work", value: v)],
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Company'),
                onSaved: (v) => contact.company = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Job'),
                onSaved: (v) => contact.jobTitle = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Street'),
                onSaved: (v) => address.street = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'City'),
                onSaved: (v) => address.city = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Region'),
                onSaved: (v) => address.region = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Postal code'),
                onSaved: (v) => address.postcode = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Country'),
                onSaved: (v) => address.country = v,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateContactsPage extends StatefulWidget {
  UpdateContactsPage({required this.contact});

  final Contact contact;

  @override
  _UpdateContactsPageState createState() => _UpdateContactsPageState();
}

class _UpdateContactsPageState extends State<UpdateContactsPage> {
  late Contact contact;
  PostalAddress address = PostalAddress(label: "Home");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    contact = widget.contact;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Contact"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () async {
              _formKey.currentState?.save();
              contact.postalAddresses = [address];
              await ContactsService.updateContact(contact);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ContactListPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: contact.givenName ?? "",
                decoration: const InputDecoration(labelText: 'First name'),
                onSaved: (v) => contact.givenName = v,
              ),
              TextFormField(
                initialValue: contact.middleName ?? "",
                decoration: const InputDecoration(labelText: 'Middle name'),
                onSaved: (v) => contact.middleName = v,
              ),
              TextFormField(
                initialValue: contact.familyName ?? "",
                decoration: const InputDecoration(labelText: 'Last name'),
                onSaved: (v) => contact.familyName = v,
              ),
              TextFormField(
                initialValue: contact.prefix ?? "",
                decoration: const InputDecoration(labelText: 'Prefix'),
                onSaved: (v) => contact.prefix = v,
              ),
              TextFormField(
                initialValue: contact.suffix ?? "",
                decoration: const InputDecoration(labelText: 'Suffix'),
                onSaved: (v) => contact.suffix = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                onSaved: (v) =>
                    contact.phones = [Item(label: "mobile", value: v)],
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                onSaved: (v) =>
                    contact.emails = [Item(label: "work", value: v)],
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                initialValue: contact.company ?? "",
                decoration: const InputDecoration(labelText: 'Company'),
                onSaved: (v) => contact.company = v,
              ),
              TextFormField(
                initialValue: contact.jobTitle ?? "",
                decoration: const InputDecoration(labelText: 'Job'),
                onSaved: (v) => contact.jobTitle = v,
              ),
              TextFormField(
                initialValue: address.street ?? "",
                decoration: const InputDecoration(labelText: 'Street'),
                onSaved: (v) => address.street = v,
              ),
              TextFormField(
                initialValue: address.city ?? "",
                decoration: const InputDecoration(labelText: 'City'),
                onSaved: (v) => address.city = v,
              ),
              TextFormField(
                initialValue: address.region ?? "",
                decoration: const InputDecoration(labelText: 'Region'),
                onSaved: (v) => address.region = v,
              ),
              TextFormField(
                initialValue: address.postcode ?? "",
                decoration: const InputDecoration(labelText: 'Postal code'),
                onSaved: (v) => address.postcode = v,
              ),
              TextFormField(
                initialValue: address.country ?? "",
                decoration: const InputDecoration(labelText: 'Country'),
                onSaved: (v) => address.country = v,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
