import "package:flutter/material.dart";
import "package:grouped_list/grouped_list.dart";
import "package:mymusicapp/contact_profile.dart";
import "package:mymusicapp/contacts_model.dart";

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "Abed Ashley Morrison",
      "phone": "+233 59 109 1751",
      "email": "vulputate@google.ca",
      "country": "Costa Rica",
      "region": "Chocó",
      "photo": "assets/Abed.jpg"
    },
    {
      "name": "Alhassan Donne",
      "phone": "1-472-455-4660",
      "email": "magna.duis@hotmail.ca",
      "country": "Austria",
      "region": "South Gyeongsang",
      "photo": "assets/Field.jpg"
    },
    {
      "name": "Brimah Mudasiru Musah",
      "phone": "1-712-678-4895",
      "email": "nulla.dignissim@protonmail.couk",
      "country": "Brazil",
      "region": "Salzburg",
      "photo": "assets/Muda.jpg"
    },
    {
      "name": "Blessed Linda",
      "phone": "1-977-427-3764",
      "email": "ac.mi@google.org",
      "country": "Italy",
      "region": "Oaxaca",
      "photo": "assets/Linda.jpg"
    },
    {
      "name": "Cassy Akosua Scissorhand",
      "phone": "1-234-737-3557",
      "email": "a.nunc@google.net",
      "country": "Colombia",
      "region": "Bình Định",
      "photo": "assets/cassie.jpg"
    },
    {
      "name": "Catherine Donna",
      "phone": "1-234-737-3557",
      "email": "a.nunc@google.net",
      "country": "Colombia",
      "region": "Bình Định",
      "photo": "assets/catherine.jpg"
    },
    {
      "name": "Frankie Vfülgan",
      "phone": "+233 27 188 7162",
      "email": "d.hollowind@gmail.com",
      "country": "Niger",
      "region": "Niamey",
      "photo": "assets/frankie.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          title: const Text("My Contacts",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Center(
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/frankie.jpg"),
                ),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Container(
                    height: 59,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 4.0), //(x,y)
                          blurRadius: 12.0,
                        ),
                      ],
                    ),

                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(16)),
                            hintText: "Search by name or number...",
                            suffixIcon: const Icon(Icons.search)),
                    ),
                  ))),
        ),
        
        body: SafeArea(
          child: ListView(
            controller: _scrollController,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Text(
                  "Recents",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListView.separated(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                          return ContactProfileView(
                              contact: ContactList(
                                name: "Ohemaa Abena Piesie",
                                phone: "1-396-425-2187",
                                email: "molestie.pharetra.nibh@aol.com",
                                country: "United States",
                                region: "New York",
                                photo: "assets/Jackie.jpg"
                            ));
                        }));
                      },
                      leading: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("assets/Jackie.jpg")),
                      title: const Text(
                        "Ohemaa Abena Piesie",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: const Text("+233 59 109 1751"),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(indent: 25, thickness: 2);
                  },
                  itemCount: 3
              ),
                  
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Text("Contacts",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
              ),

              GroupedListView<Map<String, String>, String>(
                shrinkWrap: true,
                elements: data,
                groupBy: (element) =>
                    element["name"].toString().substring(0, 1),
                groupSeparatorBuilder: (String groupByValue) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(groupByValue.substring(0, 1),
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        )),
                  ),
                ),
                itemBuilder: (context, Map<String, String> element) {
                  ContactList contact = ContactList.fromJson(element);
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ContactProfileView(
                              contact: contact,
                            );
                          }));
                        },
                        leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("${element["photo"]}")),
                        title: Text(
                          "${element["name"]}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text("${element["phone"]}"),
                        trailing: const IconButton(
                            onPressed: null, icon: Icon(Icons.more_horiz)),
                      ),
                      const Divider(indent: 25, thickness: 2),
                    ],
                  );
                },
                itemComparator: (item1, item2) =>
                    item1['name']!.compareTo(item2['name']!), // optional
                useStickyGroupSeparators: true, // optional
                floatingHeader: true, // optional
                order: GroupedListOrder.ASC, // optional
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff1a4ada),
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
