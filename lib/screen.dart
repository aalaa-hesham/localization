import 'package:flutter/material.dart';

import 'main.dart';

class Mysecondscreen extends StatefulWidget {


  var data;
  var passdata;
  Mysecondscreen({this.data, this.passdata ,   super.key});

  //  x = x;  this.x  //ali = ahmed // this.ahmed

  @override
  State<Mysecondscreen> createState() => _MysecondscreenState();
}

class _MysecondscreenState extends State<Mysecondscreen> {
  var x = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Text("Second screen"),
        automaticallyImplyLeading:false   )   ,
      body: Center(child: Column(
        children: [
          Text("${widget.data}"),
          Text("${widget.passdata}"),




        TextField(
          controller: x,
          decoration:  InputDecoration(
            filled: true,
            labelText: 'write ok',
          )),
          ElevatedButton(onPressed: (){}, child: Mytext(
            label: "${x.text}",
          ),),
          ElevatedButton(onPressed: (){

            Navigator.pop(context);
          }, child: Icon(Icons.backpack)),
        ],
      ),) ,

    );
  }
}