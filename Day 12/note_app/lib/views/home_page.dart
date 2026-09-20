import 'package:flutter/material.dart';

import '../models/note.dart';
import '../services/hive_service.dart';
import 'add_edit_note_page.dart';

class HomePage extends StatefulWidget {
  final HiveService hiveService;
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const HomePage({
    super.key,
    required this.hiveService,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Note> notes;

  @override
  void initState() {
    super.initState();

    loadNotes();
  }

  void loadNotes() {
    notes = widget.hiveService.getNotes();
  }

  Future<void> addNote() async {

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddEditNotePage(),
      ),
    );

    if (result != null) {

      await widget.hiveService.addNote(result);

      setState(() {
        loadNotes();
      });
    }
  }

  Future<void> editNote(int index) async {

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditNotePage(
          note: notes[index],
        ),
      ),
    );

    if (result != null) {

      await widget.hiveService.updateNote(
        index,
        result,
      );

      setState(() {
        loadNotes();
      });
    }
  }

  Future<void> deleteNote(int index) async {

    await widget.hiveService.deleteNote(index);

    setState(() {
      loadNotes();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),

        actions: [

          Switch(
            value: widget.isDarkMode,
            onChanged: widget.onThemeChanged,
          ),

        ],
      ),

      body: notes.isEmpty
          ? const Center(
              child: Text(
                "No Notes Yet",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )

          : ListView.builder(
              itemCount: notes.length,

              itemBuilder: (context, index) {

                return Card(
                  margin: const EdgeInsets.all(10),

                  child: ListTile(

                    title: Text(
                      notes[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      notes[index].description,
                    ),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [

                        IconButton(
                          onPressed: () {
                            editNote(index);
                          },

                          icon: const Icon(
                            Icons.edit,
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            deleteNote(index);
                          },

                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: addNote,

        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}