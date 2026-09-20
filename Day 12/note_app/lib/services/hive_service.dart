import 'package:hive/hive.dart';
import '../models/note.dart';

class HiveService {
  static const String boxName = 'notesBox';

  Future<void> init() async {
    await Hive.openBox<Note>(boxName);
  }

  Box<Note> get box => Hive.box<Note>(boxName);

  List<Note> getNotes() {
    return box.values.toList();
  }

  Future<void> addNote(Note note) async {
    await box.add(note);
  }

  Future<void> updateNote(int index, Note note) async {
    await box.putAt(index, note);
  }

  Future<void> deleteNote(int index) async {
    await box.deleteAt(index);
  }
}