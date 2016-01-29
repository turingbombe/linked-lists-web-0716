# Objective

Implement an singly-linked list in Ruby

# Introduction

The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures. They're pervasive in functional programming languages, such as Clojure, Erlang, or Haskell, but far less common in imperative languages such as Ruby or Python.

The simplest kind of linked list is an immutable singly-linked list, which is the kind that's built-in to these functional programming languages. Immutable (or more specifically: persistent) data structures can be copied in constant time (since a reference is equivalent to a copy), and can save loads of time and memory for certain use cases because structure can be shared between versions of the data structure.

This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out), a data structure that can be visualized like a can of Pringles. You can only access the topmost element in the stack, and it's always the most recently added.

### Definitions

**Constant Time** - when operation time is independent of problem size, that operation is a *constant time* (or *O(1) time*) operation. Accessing an element at a given index of an array is a constant time operation, because no matter how big an array is, it doesn't affect the time required to access an element by position. Finding the maximum element of an array, on the other hand, is not a constant time operation, because a full scan of the elements is required and the time required to complete that scan grows with the number of elements.

# Lab Steps

### 1 - Create Elements

As a first take, lets create a persistent singly-linked list with just Node objects containing the range (1..10), and provide functions to reverse a linked list and convert to and from arrays. Use the provided rspec tests in `spec/simple_linked_list_spec.rb` to guide development.

When implementing this in a language with built-in linked lists, implement your own abstract data type.

We want to create a `Node` class that represents a node in a singly-linked list. An `Node` only understands two things: `data` - the piece of information that `Node` holds, and `next`, which is a reference to the next item in the list.

### 2 - Basic LL CRUD methods

Day-to-Day users won't be interacting with our `Node` class, they will be interacting with a new layer of abstraction housed in a `LinkedList` class. Your `LinkedList` class should have the following methods. Remember NO USING ARRAYS.

 * `#index_at` should take an index in and return the data at that index
 * `insert_at_index` should take an index and data, and insert that data at that index shifting everything else down
 * `unshift` should remove something from the head of the linked list
 * `push` should add one piece of data do the end of the Linked List

### 3 - Reverse the List

Finally, we want to be able to reverse the linked list.
You'll be writing a `#reverse` method as well as the required tests to make sure it works!

If we envision the list as a piece of data (`datum`) and a *pointer* to the next element, then reversing a list is a matter of reversing the pointers while retaining the data.

If we have a list with elements `A,B,C,D` that looks like this:
`A -> B -> C -> D`, then reversing that list at element A would make it this:
`D -> C -> B -> A`. Essentially, the `next` of each element is reversed, so where D used to have a `next` of `nil`, it now has a `next` of C. Where A once had a `next` of B, it now has a `next` of `nil`.

Another way to visualize it would be like this: `A <- B <- C <- D`. Keep in mind that we are still implementing only `next` in this list, even though the directionality appears to indicate a `previous` style relationship. In a singly-linked list, there is only one direction.

Think about the different trade offs and ways to handle this reverse method. Some use more memory, and less time...others use more time and less memory!


# Resources

Some more general reading about linked lists:

http://en.wikipedia.org/wiki/Linked_list
http://cjlwired.github.io/blog/2013/08/08/linked-lists-and-ruby/
http://en.wikipedia.org/wiki/Singly_linked_list#Singly_linked_lists
http://en.wikipedia.org/wiki/Doubly_linked_list

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/linked-lists' title='Objective'>Objective</a> on Learn.co and start learning to code for free.</p>
