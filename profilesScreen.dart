import 'package:flutter/material.dart';

class Profiles extends StatefulWidget {
  static const routeName = '/profiles-screen';
  const Profiles({Key? key}) : super(key: key);

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          Container(
            height: mediaQuery.height * 0.10,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Colors.green,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Profiles',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //sliver appBar
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          // handle notifications button press
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          // handle settings button press
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.15,
            child: Expanded(
                child: SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              "http://picsum.photos/200/300",
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Hazim sief",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "hazemsief@gmail.com",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Edit",
                            ),
                          ),
                          Divider(thickness: 4)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
          ),
          // Divider(
          //   thickness: 1,
          // ),
          Expanded(
            child: Container(
              // height: mediaQuery.height * 0.50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                child: ListView(
                  children: <Widget>[
                    buildAccountOption(
                        context, 'My Orders', Icons.shopping_cart),
                    buildDivider(),
                    buildAccountOption(context, 'Wishlist', Icons.favorite),
                    buildDivider(),
                    buildAccountOption(
                        context, 'My Prescription', Icons.receipt),
                    buildDivider(),
                    buildAccountOption(
                        context, 'Payment Methods', Icons.credit_card),
                    buildDivider(),
                    buildAccountOption(
                        context, 'Your Addresses', Icons.location_on),
                    buildDivider(),
                    buildAccountOption(
                        context, 'Payment History', Icons.history),
                    buildDivider(),
                    buildAccountOption(
                        context, 'Invite Friends', Icons.person_add),
                    buildDivider(),
                    buildAccountOption(context, 'Change Password', Icons.lock),
                    buildDivider(),
                    buildAccountOption(context, 'Log Out', Icons.logout),
                    buildDivider(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      height: 0.06,
      color: Colors.grey[400],
      // indent: .05,
      // endIndent: 10,
      thickness: 2,
    );
  }

  GestureDetector buildAccountOption(
      BuildContext context, String title, IconData iconData) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.55, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                iconData,
                size: 24,
              ),
            ),
            SizedBox(width: 0.5),
            Expanded(
                child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey,
                ),
              ),
            )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: Checkbox.width,
                ))
          ],
        ),
      ),
    );
  }
}
