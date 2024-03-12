
import'package:flutter/material.dart';
import 'package:flutter_notes/create_note.dart';
import 'package:flutter_notes/note_card.dart';
import 'package:flutter_notes/note_modal.dart';
//import 'package:flutter_notes/main.dart';
//void main(){
  //runApp(const MyApp());
//}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('flutter notes'),

      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(note: notes[index], index: index,onNoteDeleted: onNoteDeleted,);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CreateNote(onNewNoteCreated: onNewNoteCreated,)));

        },
        child: const Icon(Icons.add),
      ),


    );
  }
  void onNewNoteCreated(Note note){
    notes.add(note);
    setState(() {

    });
  }
  void onNoteDeleted(int index){
    notes.removeAt( index);
    setState(() {

    });

  }
}