import 'dart:io';

//calss entry as a type for the linked list values
final class Entry {
  int value;
  Entry? next = null;

  Entry(this.value, next);

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

//linked list implementation
class LinkedList<E> {
  Entry? head = null;

  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    Entry? temp = head;
    String result = '';
    while (temp != null) {
      result += '${temp.value}, ';
      temp = temp.next;
    }
    return result;
  }

// finction to add value at the first in the linked list
  void push(int value) {
    Entry? temp = Entry(value, null);
    if (head == null) {
      head = temp;
    } else {
      temp.next = head?.next;
      head = temp;
    }
  }

// finction to add value at the end in the linked list
  void append(int value) {
    if (isEmpty) {
      push(value);
      return;
    }
    Entry? temp = head;

    while (temp?.next != null) {
      temp = temp?.next;
    }

    temp?.next = Entry(value, Null);
  }

// function to reverse the linkedlist
  Entry reverselist(head) {
    if (head == null || head?.next == null) return head;

    var curntnode = head;
    var prevnode = null;
    var nextnode = curntnode?.next;

    while (curntnode != null) {
      nextnode = curntnode?.next;
      curntnode?.next = prevnode;
      prevnode = curntnode;
      curntnode = nextnode;
    }
    return prevnode;
  }

//function to print a linked list in reverse order
  void printinrevers(Entry? node) {
    if (isEmpty) return;
    if (node != null) {
      printinrevers(node.next);
      stdout.write('${node.value}, ');
    }
  }

//function to print the middle value in linked list
  void printMiddle() {
    Entry? slowptr = head; //slower pointer
    Entry? fastptr = head; //faster pointer

    //move the faster pointer 2 node and the lower 1 node
    while (fastptr != null && fastptr.next != null) {
      fastptr = fastptr.next?.next;
      slowptr = slowptr?.next;
    }
    
    //the lower pointer will be the middle value
    print('The middle element is [${slowptr?.value}]');
  }

  //function to delete the Occurrences
  void deleteKey(int key) {
    // Store head node
    Entry? temp = head, prev = null;

    // If head node itself holds the key
    // or multiple occurrences of key
    while (temp != null && temp.value == key) {
      head = temp.next;
      temp = head;
    }

    // Delete occurrences other than head
    while (temp != null) {
      // Search for the key to be deleted,
      // keep track of the previous node
      while (temp != null && temp.value != key) {
        prev = temp;
        temp = temp.next;
      }

      // If key was not present in linked list
      if (temp == null) return;

      // delete the node from linked list
      prev?.next = temp.next;

      // Update Temp for next iteration of outer loop
      temp = prev?.next;
    }
  }
}
