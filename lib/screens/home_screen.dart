import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quote_assignment/model/quotes.dart';
import 'package:quote_assignment/services/api.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var size, height, width;
  Quotes? data;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text(" Random Quotes"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh_outlined,
            ),
            iconSize: 30,
            onPressed: () {
              print("icon refresh");
              getQuotes();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: getQuotes,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Pull to Refresh",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: width / 2,
              child: Card(
                margin: EdgeInsets.only(top: 20),
                color: Color(0XFFeeeeee),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${data!.content}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 22),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            data!.author,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> getQuotes() async {
    data = await Api.getQuotes();
    setState(() {});
  }
}
