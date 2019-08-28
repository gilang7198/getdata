import 'package:flutter/material.dart';
import 'package:getdata/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Demo Get Data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: fetchUser(),
        builder: (context, snapdata) {
          if (snapdata.hasError) print(snapdata.error);
          return snapdata.hasData ?
          Container(
            child: ListView.builder(
              itemCount: snapdata.data.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListTile(
                      leading: Text(snapdata.data[index].idUser),
                      title: Text(snapdata.data[index].nameUser),
                      subtitle: Text(snapdata.data[index].address),
                    ),
                  ),
                );
              },
            ),
          ) : Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}
