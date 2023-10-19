// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart'; // أساس الكود

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Datatext(),
    );
  }
}

class Datatext extends StatefulWidget {
  const Datatext({super.key});

  @override
  State<Datatext> createState() => _DatatextState();
}

class _DatatextState extends State<Datatext> {
  String mytext = "";    //  متغير للتغزين بداخلة التيكست المدخل
  final myController = TextEditingController();   //  لعمل كونكت مع التيكست فيلد والتخزين داخل متغير

  func() {
    setState(() {   //  لعما هوت ريفريش
        mytext = myController.text;    //  لجعل المتغير يساوي الاخر
    });
  
  }




  @override    //  تنفيذ فونكشون تلقائي  وريطه بمتغير
void initState() {
   super.initState();
   // Start listening to changes.
   myController.addListener(func);  //  المتغير والفونكشون
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("dfghdsrg")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(22),
            child: TextField(
              controller: myController,
              //  لعمل مربع ادخال
              obscureText: false, //  لجعل المدخلات مشفره
              // keyboardType: TextInputType.number,   //  للتحكم في الكيبورد
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "what is ur name:", // ملاحظه داحل التيكست فيلد
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey[700]),
                // labelText: "Password:",     // ملاحظه اعلي التيكست فيلد
                // labelStyle: TextStyle(color: Colors.blue,fontSize: 15),

                // OutlineInputBorder(),
                // icon: Icon(Icons.email),    // لعمل ايكونه خارج التيكست فيلد
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              func();   //  استدعاء فونكشون
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
            ),
            child: Text(
              "click here",
              style: TextStyle(fontSize: 19),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            "My name is : $mytext ",  // لاظهار متغير داخل تيكس
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}
