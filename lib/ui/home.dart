import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  int i = 0;
  void _comingSoon() {
    Fluttertoast.showToast(
        msg: "This feature is coming soon!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.white10,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  int notesCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notes"),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: _comingSoon,
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Colors.black45,
        floatingActionButton: FloatingActionButton(
          tooltip: "Add Note",
          onPressed: _newNote,
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.add),
        ),
        body: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border(top: BorderSide(color: Colors.white10, width: 1)),
            ),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: _viewCreator(notesCount),
            )));
  }

  _newNote() {
    setState(() {
      notesCount++;
    });
  }

  RaisedButton _noteThumbnail(String titleText, String content) {
    return RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(20),
        textColor: Colors.white,
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NotesEdit()));
        },
        color: Colors.white10,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Text(
                  "$titleText",
                  textScaleFactor: 1.5,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: Text('$content',
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.white60)),
              )
            ]));
  }

  List _viewCreator(int count) {
    List widgetList = <RaisedButton>[];
    for (int counter = 0; counter < count; counter++) {
      widgetList.add(_noteThumbnail("Note ${counter + 1}", "content"));
    }
    return widgetList;
  }
}

class NotesEdit extends StatefulWidget {
  @override
  _NotesEditState createState() => _NotesEditState();
}

class _NotesEditState extends State<NotesEdit> {
  String title,content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_drop_down_circle), onPressed: () => {})
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                style: TextStyle(fontSize: 30),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(

                  hintText: "Title",
                ),
                onChanged: (String value)=>title=value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
