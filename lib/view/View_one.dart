import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'View_second.dart';

class ViewOne extends StatefulWidget {
  @override
  ViewOneState createState() => ViewOneState();
}

class ViewOneState extends State<ViewOne> {
  List data = [];

  List<bool> isFavList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Movies',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.wrap_text_rounded,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/user.jpg"),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
          elevation: 1,
        ),
        body: Container(
          child: Center(
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/user.json'),
                builder: (context, snapshot) {
                  var new_data = json.decode(snapshot.data.toString());

                  if (isFavList.isEmpty) {
                    OnNotified(new_data.length);
                  }
                  return Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Now Showing',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      backgroundColor: Colors.yellow),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Coming Soon',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      backgroundColor: Colors.yellow),
                                )),
                          ],
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemCount: new_data == null ? 0 : new_data.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 400.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        10.0,
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          new_data[index]["Poster"],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    //color: Colors.black.withOpacity(0.1),
                                    padding: EdgeInsetsDirectional.only(
                                      bottom: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Colors.white,
                                              child: Text(
                                                new_data[index]["Rate"],
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 180,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isFavList[index] =
                                                      !isFavList[index];
                                                });
                                                print(isFavList);
                                              },
                                              icon: Icon(isFavList[index]
                                                  ? Icons.favorite
                                                  : Icons.favorite_border),
//                                                  icon: Icon(
//
// // !isFavList.asMap().containsKey(index)?Icons.favorite_border:isFavList[index]["$index"]==true?Icons.favorite:Icons.favorite_border
//                                                  ))
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 60,
                                        ),
                                        Center(
                                            child: Text(
                                          new_data[index]["Title"],
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        Text(
                                          new_data[index]["Runtime"],
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 177,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(

                                                  decoration: BoxDecoration(

                                                    border: Border.all(

                                                      width: 5,
                                                    ),
                                                  ),
                                                  child: Text(
                                                      new_data[index]
                                                      ["category1"],
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.white,
                                                      ))),
                                            ),

                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Container(

                                              decoration: BoxDecoration(

                                                border: Border.all(

                                                  width: 5,
                                                ),
                                              ),
                                                  child: Text(
                                                      new_data[index]
                                                          ["category2"],
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ))),
                                            ),
                                            SizedBox(
                                              width: 60,
                                            ),
                                            Expanded(
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => ViewSecond(movie:new_data[index]),
                                                      ),
                                                    );
                                                  },
                                                  child: Text('Book',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ))),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                          },
                        ))
                      ]));
                }),
          ),
        ));
  }

  void OnNotified(int index) {
    isFavList = [];
    for (var i = 0; i <= index; i++) {
      isFavList.add(false);
    }
  }
}
