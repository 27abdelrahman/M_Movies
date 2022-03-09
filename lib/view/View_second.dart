import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'View_one.dart';

class ViewSecond extends StatelessWidget {
  ViewSecond({Key? key, required this.movie}) : super(key: key);
  final movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 450.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      movie["Poster"],
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
                  child: Column(children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ViewOne();
                            }));
                          },
                          icon: Icon(Icons.arrow_back_ios_outlined),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Text(
                            movie["Rate"],
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Center(
                        child: Text(
                      movie["Title"],
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                    Text(
                      movie["Runtime"],
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
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 5,
                              ),
                            ),
                            child: Text(movie["category1"],
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ))),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 5,
                              ),
                            ),
                            child: Text(movie["category2"],
                                style: TextStyle(
                                  color: Colors.white,
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Row(
                      children: [
                        Text(
                          'Synopsic',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            'WHEN Eddie Brock acquires the powers of the powers '
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                        'a sympbiote . he will have to relese his alter-ago')

                      ],
                    ),
                    Row(
                      children: [
                        Text(' Venom to save')

                      ],
                    ),
                  ])),
            ],
          ),
        ],
      ),
    )));
  }
}
