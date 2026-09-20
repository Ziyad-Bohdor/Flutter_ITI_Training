import 'package:flutter/material.dart';

import '../models/note.dart';

class AddEditNotePage extends StatefulWidget {

  final Note? note;

  const AddEditNotePage({
    super.key,
    this.note,
  });

  @override
  State<AddEditNotePage> createState() =>
      _AddEditNotePageState();
}

class _AddEditNotePageState
    extends State<AddEditNotePage> {

  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(
      text: widget.note?.title ?? '',
    );

    descriptionController = TextEditingController(
      text: widget.note?.description ?? '',
    );
  }

  @override
  void dispose() {

    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  void saveNote() {

    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      return;
    }

    final note = Note(
      title: titleController.text,
      description: descriptionController.text,
    );

    Navigator.pop(
      context,
      note,
    );
  }

  @override
  Widget build(BuildContext context) {

    final isEdit = widget.note != null;

    return Scaffold(

      appBar: AppBar(
        title: Text(
          isEdit ? "Edit Note" : "Add Note",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: titleController,

              decoration: const InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: descriptionController,

              maxLines: 5,

              decoration: const InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: saveNote,

                child: Text(
                  isEdit ? "Update Note" : "Add Note",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}