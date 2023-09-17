import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("(QUIZ ONLINE)")),
        ),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var sum1;
  var sum2;

  Future<void> _queryCount() async {
    final url1 = Uri.parse("http://192.168.100.100:8087/quiz/query_count.php");
    var response = await http.post(url1, body: {});
    var datauser = jsonDecode(response.body);

    if (datauser.isEmpty) {
      setState(() {
        sum1 = "0";
      });
    } else {
      setState(() {
        sum1 = datauser[0]["jumlah"];
        sum2 = int.parse(sum1) + 1;
      });
    }
  }

  @override
  void initState() {
    _queryCount();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sum2.toString(),
              style: TextStyle(fontSize: 200),
            )
          ],
        )
      ],
    );
  }
}
