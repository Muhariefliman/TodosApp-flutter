// ignore_for_file: file_names, non_constant_identifier_names

class Todo {

  Todo(
    String title,
    String description,
    String date,
    String time,
  ){
    _title = title;
    _description = description;
    _date = date;
    _time = time;
  }
  
  late String _title;
  late String _description;
  late String _date;
  late String _time;


  get title => _title;
  get description => _description;
  get date => _date;
  get time => _time;
  
}