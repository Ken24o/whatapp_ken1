import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:helloworld/model/status_model.dart';

class status extends StatelessWidget {
  const status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: ListTile(
              leading: Container(
                width: 50.0,
                child: Stack(
                  children: [
                    ClipOval(
                      child: Image.network(
                          'https://randomuser.me/api/portraits/men/0.jpg'),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        child: Icon(Icons.add),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(
                'My Status',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('tap to add the status'),
            ))
          ],
        ),
        SizedBox(
          height: 20.0,
          child: Container(
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Text(
              'Recent Update',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueGrey.shade200),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, i) => new Column(
                    children: [
                      Divider(
                        height: 0.1,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(statusdata[i].pic),
                        ),
                        title: Row(
                          children: [
                            new Text(
                              statusdata[i].name,
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        subtitle: Container(
                          child: Text(statusdata[i].time,
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 12.0)),
                        ),
                      )
                    ],
                  )),
        )
      ],
    );
  }
}
