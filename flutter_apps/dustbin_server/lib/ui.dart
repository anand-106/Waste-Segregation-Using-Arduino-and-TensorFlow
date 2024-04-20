import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);

  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  Map<String, dynamic>? ans;

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 33),
      body: ans == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: ans!.length,
              itemBuilder: (BuildContext context, int index) {
                final key = ans!.keys.elementAt(index);
                final dynamic value = ans![key];
                return ListTile(
                  title: const Center(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  subtitle: Text(
                    'Name: ${value['details']['name']},Address:${value['details']['address']},Pincode:${value['details']['pin']},Phone: ${value['details']['phn']}',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                );
              },
            ),
    );
  }

  Future<void> readData() async {
    final url =
        Uri.https('dustbin-88db1-default-rtdb.firebaseio.com', 'list.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        ans = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

// void main() {
//   runApp(const MaterialApp(
//     home: UI(),
//   ));
// }
