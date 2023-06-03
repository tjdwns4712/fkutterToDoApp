import 'package:flutter/material.dart';
import 'package:todo/widgets/todoItem.dart';
import '../model/todo.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final todoList = ToDo.todoList();
  // todo의 todoList를 받아온다
  final _todController = TextEditingController();
  //텍스트 입력창에 입력되는 값을 추적하여 읽어오거나 편집하는 역할을 하는 변수
  List<ToDo> _foundToDo = [];
  //ToDo클래스의 형식을 이용하는 검색결과를 저장하는 변수
  @override
  void initState() {
    _foundToDo = todoList;
    //기본값으로 todoList를 쓰겠다는 의미.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        shadowColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Icon(Icons.supervised_user_circle),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    onChanged: (value) => runFilter(value),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 20,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        maxWidth: 25,
                      ),
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          'To do',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      for (ToDo todoo in _foundToDo)
                        TodoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          // ToDo클래스의 isDone의 bool상태를 바꿈
                          onDeleteItem: _deleteTodoItem,
                          // 쓰레기통 아이톤을 통해 삭제를 수행
                        ),
                      //todoo는 todo.dart의 ToDo클래스의 todoList의 값을 순서대로 가져온다
                      //todo는 TodoItem.dart의 todo이다 이는 가운데 내용인 todoText를 의미한다.
                      //todoList의 내용을 todoo순서에 따라 todo를 출력하는것
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
          Align(
            //자식 위젯을 원하는 위치에 정렬
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todController,
                    // 편집을 담당하는 TextEditingController를 textField 컨트롤러로 지정.
                    decoration: const InputDecoration(
                      hintText: 'Add new todo item',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _addToDoItem(_todController.text);
                    //_todController를 통해 텍스토 입력값을 텍스트로 받아와 메소드 실행
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(60, 60),
                    elevation: 10,
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
  // isDone의 bool 상태를 변경

  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
      // todoList에서 id를 제거
      // 람다 표현식  ((item) => item.id == id) 에서 item은 id중 1개를 의미하는 임의 변수임.
      // todoList 중 받아온 아이디와 일치하는 id를 true 반환한다(제거한다).
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todoList.add(ToDo(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        //id값은 현재 시간을 microsecondsSinceEpoch 타입으로 String 형태로 한다.
        todoText: toDo,
        //todoText값은 입력받은 값을 한다.
      ));
    });
    _todController.clear();
    //입력 후 입력창 내용을 지움.
  }

  void runFilter(String enterKeyword) {
    List<ToDo> results = [];
    if (enterKeyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) =>
              item.todoText!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
      // where메소드를 이용하여 item객체의 todoText 속성 값이 endterKeyword를 포함하는것만 걸러냄
      //검색 기능상 대소문자를 구분하지 않기 위해 .toLowerCase를 사용
      //.contains는 검색어인 enterKeyword를 포함하는지
    }
    setState(() {
      _foundToDo = results;
      //검색 결과를 저장하는 _foundToDo에 results 값을 저장.
    });
  }
}
