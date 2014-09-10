---
  tags: data structures, linked lists, stack, deque, computer science
  languages: ruby
  resources: 2
---

## Objective

Implement an immutable singly-linked list, a mutable doubly-linked list,
and a double-ended queue (deque) in Ruby.

# Introduction

This lab will take you through creating three fundamental data
structures in Ruby.

The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures. They're pervasive in functional programming languages, such as Clojure, Erlang, or Haskell, but far less common in imperative languages such as Ruby or Python.

The simplest kind of linked list is an immutable *singly-linked list*, which is the kind that's built-in to these functional programming languages. In a singly-linked list, each node only understands the next node.

Singly-linked lists are used to represent sequences or push-down (LIFO -
Last-in, First-out) stack structures.

The next thing you'll create is a *doubly-linked list*. In a doubly-linked
list, each node understands both the next node, and the previous nodes.

This variant of linked lists can be used to represent queues and other
data structures.

The final thing you'll create is a *double-ended queue* (or *deque* -
prounounced "deck"). You'll build the deque on top of your doubly-linked
list.

# Lab Steps

Fork and clone this repository.

This lab has two parts. The first is found in the `simple-lists` folder.
Follow the instructions in `simple-lists/README.md` and use the specs in
`spec/simple_linked_list_spec.rb` as your guide.

Once you've completed the simple lists step, move to the instructions
found in `deque/README.md` and use the specs in `spec/deque_spec.rb` as
your guide.

Once you've completed the lab and all your tests pass, commit and issue a pull request.

## Resources
* [Wikipedia](http://en.wikipedia.org/) - [Linked List](http://en.wikipedia.org/wiki/Linked_list)
* [Matt Weppler's Blog](http://matt.weppler.me/) - [Implementing a Linked List](http://matt.weppler.me/2013/08/14/implementing-a-linked-list-in-ruby.html)
