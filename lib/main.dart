import 'package:flutter/material.dart';
import 'package:helloworld/tabs/call.dart';
import 'package:helloworld/tabs/camera.dart';
import 'package:helloworld/tabs/chat.dart';
import 'package:helloworld/tabs/status.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff085e54),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xff25d366)),
      ),
      debugShowCheckedModeBanner: false,
      home: const Myapp(),
    ));

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> with SingleTickerProviderStateMixin {
  late TabController
      _tabController; // Add "late" keyword to delay the initialization
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WhatApp'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              color: Colors.white,
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            controller: _tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: ('CHART'),
              ),
              Tab(
                text: ('STATUS'),
              ),
              Tab(
                text: ('CALL'),
              ),
            ],
          ),
        ),
        body: new TabBarView(controller: _tabController, children: [
          new camera(),
          new chat(),
          new status(),
          new call(),
        ]),
        floatingActionButton: _tabController.index == 0
            ? FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              )
            : _tabController.index == 1
                ? FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                  )
                : _tabController.index == 2
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              height: 45.0,
                              width: 45.0,
                              child: FloatingActionButton(
                                backgroundColor: Colors.white,
                                onPressed: () {},
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.blueGrey,
                                ),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    : FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add_call,
                          color: Colors.white,
                        ),
                      ));
  }
}
