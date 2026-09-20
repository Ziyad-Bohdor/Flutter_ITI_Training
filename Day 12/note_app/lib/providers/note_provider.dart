import 'package:flutter/material.dart';

import '../models/note.dart';

class NoteProvider extends ChangeNotifier {

  List<Note> notes = [];

  void setNotes(List<Note> newNotes) {
    notes = newNotes;

    notifyListeners();
  }

  void addNoteToUI(Note note) {
    notes.add(note);

    notifyListeners();
  }

  void updateNoteInUI(int index, Note note) {
    notes[index] = note;

    notifyListeners();
  }

  void deleteNoteFromUI(int index) {
    notes.removeAt(index);

    notifyListeners();
  }
}