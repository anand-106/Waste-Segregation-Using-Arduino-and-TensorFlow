import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ui extends StatefulWidget {
  const ui({super.key});
  @override
  State<ui> createState() {
    return _ui();
  }
}

class _ui extends State<ui> {
  String? data;
  String _phone = '9946192941';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController phnController = TextEditingController();
  final websiteUri = Uri.parse('https://pub.dev/packages/url_launcher/install');
  String? uname;
  String? addr;
  String? pin;
  String? phn;
  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    addController.dispose();
    pinController.dispose();
    phnController.dispose();
    super.dispose();
  }

  void switchScreen() {
    setState(() {});
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: 350,
            height: 75,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 31, 31, 33),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Bio-degradable',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 25,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  '$data %',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: readData,
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    'Refresh',
                    style: TextStyle(color: Color.fromARGB(255, 255, 254, 254)),
                  )),
              TextButton.icon(
                  onPressed: () async {
                    final url = Uri(scheme: 'tel', path: _phone);
                    if (await canLaunchUrl(url)) {
                      launchUrl(url);
                    }
                  },
                  icon: const Icon(Icons.call),
                  label: const Text(
                    'Call for pick-up',
                    style: TextStyle(color: Color.fromARGB(255, 255, 254, 254)),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Submit Form',
            style: TextStyle(
                color:  Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              style:const  TextStyle(color: Colors.white),
              controller: nameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              style:const  TextStyle(color: Colors.white),
              controller: addController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Address Line',
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              style:const  TextStyle(color: Colors.white),
              controller: pinController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Pincode',
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              style:const  TextStyle(color: Colors.white),
              controller: phnController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Phone Number',
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                uname = nameController.text;
                addr = addController.text;
                pin = pinController.text;
                phn = phnController.text;
                writeData();
                nameController.clear();
                addController.clear();
                pinController.clear();
                phnController.clear();
              },
              child: const Text('Submit')),
        ],
      ),
    );
  }

  void writeData() {
    final url =
        Uri.https('dustbin-88db1-default-rtdb.firebaseio.com', 'list.json');
    http.post(url,
        headers: {
          'content-type': 'application/json',
        },
        body: json.encode({
          'details': {
            'name': '$uname',
            'address': '$addr',
            'pin': '$pin',
            'phn': '$phn'
          }
        }));
  }

  void readData() async {
    final url =
        Uri.https('dustbin-88db1-default-rtdb.firebaseio.com', 'data.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // Successful request
      // print(response.body);
      // final Map<String, Map<String, dynamic>> listData =
      Map<String, dynamic> ans = convert.json.decode(response.body);
      data = ans["-Nui7th8_LTYzWYcPZNx"]["fill"];
      switchScreen();
      //print(listData.values.first['fill']);
    } else {
      // Request failed
      throw Exception('Failed to fetch data');
    }
  }
}
