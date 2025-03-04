import 'package:hive/hive.dart';
//! the name of this file that will be generated should be the same as the name of the model file
part 'note_model.g.dart';

//* typeId should be unique from one model to another
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NoteModel({
    required this.color,
    required this.date,
    required this.subTitle,
    required this.title,
  });
}
