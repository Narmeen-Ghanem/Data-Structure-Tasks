import 'package:dart_application_2/stack.dart';
import 'package:dart_application_2/LinkedList.dart';

void main() {
  reverselist();
  isValid();
  calllinkedlistmethods();
}

//function to reverse the list using stack
void reverselist() {
  List<int> mylist = [1, 2, 3, 4, 5];
  //note: we can print it in reverse without using stack using two ways
  //first using for loop start at the end of the list
  //for (int i = mylist.length - 1; i >= 0; i--) {
  //  print(mylist[i]);
  //}
  //second: using List.reversed
  //var list2 = mylist.reversed;
  //print(list2);

  Stack<int> stack = Stack();
  for (int i = 0; i < mylist.length; i++) {
    stack.push(mylist[i]);
  }
  mylist.clear();
  while (stack.isNotEmpty) {
    mylist.add(stack.peek);
    stack.pop();
  }
  print(mylist);
}

//function to check balanced Parentheses
void isValid() {
  String s = "(narm(e(en)omar)";
  if (s.isEmpty) print("balanced parentheses");

  Stack<String> stack = Stack();
  for (int i = 0; i < s.length; i++) {
    if (s[i] == '(') {
      stack.push(s[i]);
    } else if (s[i] == ')') {
      stack.pop();
    } else {
      continue;
    }
  }
  print(stack.isEmpty ? "balanced parentheses" : "unbalanced parentheses");
}

//function to call linked list functions
void calllinkedlistmethods() {
  // first create linked list and add values
  final list = LinkedList<int>();
  list.append(2);
  list.append(4);
  list.append(3);
  list.append(2);
  list.append(1);

// print linked list before any changes
  print(list.toString());

// call printinrevers to print a linked list in reverse order
  list.printinrevers(list.head);

// call reverselist to reverse the linked list then print it
  list.head = list.reverselist(list.head);
  print('');
  print(list.toString());

// calling the printMiddle function to print the middle value in the linked list
  list.printMiddle();

// calling deleteKey function to remove all occurrences
  list.deleteKey(2);
  print(list.toString());
}
