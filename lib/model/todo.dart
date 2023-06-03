class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(
        id: '01',
        todoText: "example 1",
        isDone: true,
      ),
      ToDo(
        id: '02',
        todoText: "example 2",
        isDone: true,
      ),
      ToDo(
        id: '03',
        todoText: "example 3",
      ),
      ToDo(
        id: '04',
        todoText: "example 4",
      ),
      ToDo(
        id: '05',
        todoText: "example 5",
      ),
      ToDo(
        id: '06',
        todoText: "example 6",
      ),
    ];
  }
}
