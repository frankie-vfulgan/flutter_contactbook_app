import "package:flutter/material.dart";
import 'package:mymusicapp/contacts_model.dart';

class ContactProfileView extends StatelessWidget {
  const ContactProfileView({Key? key, required this.contact}) : super(key: key);

  final ContactList contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text("Contacts",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),

        body: SafeArea(
          child: ListView(children: [
            CircleAvatar(
              radius: 70,
              child: ClipOval(
                child: Image.asset(
                  contact.photo,
                  fit: BoxFit.cover,
                  width: 140,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                contact.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: Text(
                "${contact.region}, ${contact.country}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: const Color(0xff9aadbe).withOpacity(0.3),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      "Mobile",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      contact.phone,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff858484)),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        IconButton(
                            onPressed: null,
                            icon: Icon(Icons.message, color: Colors.black)),
                        IconButton(
                            onPressed: null,
                            icon: Icon(Icons.call, color: Colors.black)),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      contact.email,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff858484)),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        IconButton(
                            onPressed: null,
                            icon: Icon(Icons.email, color: Colors.black)),
                      ],
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      "Group",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "Close Friends",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff858484)),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Linked Accounts",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Container(
              color: const Color(0xff9aadbe).withOpacity(0.3),
              child: Column(children: [
                ListTile(
                  title: const Text(
                    "Whatsapp",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  trailing: Image.asset("assets/whatsapp.png"),
                ),
                ListTile(
                  title: const Text(
                    "Telegram",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  trailing: Image.asset("assets/telegram.png"),
                )
              ]),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("More Options",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Container(
              color: const Color(0xff9aadbe).withOpacity(0.3),
              child: Column(children: const [
                ListTile(
                  title: Text(
                    "Share Contact",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                ListTile(
                  title: Text(
                    "QR Code",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                )
              ]),
            ),
          ]),
        ));
  }
}
