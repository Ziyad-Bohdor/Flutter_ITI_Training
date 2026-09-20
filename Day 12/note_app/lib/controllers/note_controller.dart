import '../models/note.dart';
import '../services/hive_service.dart';

class NoteController {
  final HiveService hiveService;

  NoteController({
    required this.hiveService,
  });

  List<Note> getNotes() {
    return hiveService.getNotes();
  }

  Future<void> addNote(Note note) async {
    await hiveService.addNote(note);
  }

  Future<void> updateNote(int index, Note note) async {
    await hiveService.updateNote(index, note);
  }

  Future<void> deleteNote(int index) async {
    await hiveService.deleteNote(index);
  }
}