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
        todoText: "qweqwe1",
        isDone: true,
      ),
      ToDo(
        id: '02',
        todoText: "qweqwe2",
        isDone: true,
      ),
      ToDo(
        id: '03',
        todoText: "qweqwe3",
      ),
      ToDo(
        id: '04',
        todoText: "qweqwe4",
      ),
      ToDo(
        id: '05',
        todoText: "qweqwe5",
      ),
      ToDo(
        id: '06',
        todoText: "qweqwe6",
      ),
    ];
  }
}
