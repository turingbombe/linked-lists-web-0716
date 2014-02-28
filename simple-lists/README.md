----
tags: data structures, linked lists, computer science
languages: ruby
----

# Objective

Implement an immutable singly-linked list in Ruby

# Introduction

The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures. They're pervasive in functional programming languages, such as Clojure, Erlang, or Haskell, but far less common in imperative languages such as Ruby or Python.

The simplest kind of linked list is an immutable singly-linked list, which is the kind that's built-in to these functional programming languages. Immutable (or more specifically: persistent) data structures can be copied in constant time (since a reference is equivalent to a copy), and can save loads of time and memory for certain use cases because structure can be shared between versions of the data structure.

This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out), a data structure that can be visualized like a can of Pringles. You can only access the topmost element in the stack, and it's always the most recently added.

### Definitions

**Immutable** - data that cannot be changed. An immutable data structure
can only be created or destroyed but not changed by an external actor.
Immutable structures are great for multi-threaded operations because
there is little danger of unexpected side-effects changing the object.

**Constant Time** - when operation time is independent of problem size,
that operation is a *constant time* (or *O(1) time*) operation.
Accessing an element at a given index of an array is a constant time
operation, because no matter how big an array is, it doesn't affect the
time required to access an element by position. Finding the maximum
element of an array, on the other hand, is not a constant time
operation, because a full scan of the elements is required and the time
required to complete that scan grows with the number of elements.

# Lab Steps

### 1 - Create Elements

As a first take, lets create a persistent singly-linked list with just Element objects containing the range (1..10), and provide functions to reverse a linked list and convert to and from arrays. Use the provided rspec tests in `spec/simple_linked_list_spec.rb` to guide development.

When implementing this in a language with built-in linked lists, implement your own abstract data type.

We want to create an `Element` class that represents a node in a
singly-linked list. An `Element` only understands two things: `datum` -
the piece of information that `Element` holds, and `next`, which is a
reference to the next item in the list.

Examples (Ruby):
```
node1 = Element.new(1, nil)
node1.datum #=> 1
node1.next #=> nil

node2 = Element.new(2, node1)
node2.datum #=> 2
node2.next #=> node1

node2.next.datum #=> 1
node2.next.next #=> nil
```
Those last two lines above illustrate the linked list. Node 1 has a
piece of data, and no link to another element. As far as it knows, it's
the only node in the world.

Node 2, on the other hand, has a piece of data and a link to Node 1.
Node 2 doesn't know how big this list is, but it can direct you to the
next guy no problem and let it tell you what comes after that.

### 2 - Convert List to and from Array

Next we need to turn the list into an ordered array of the datum of each
of our elements.  
However, because this is an immutable list, we don't want to change any
of our elements. Using the example above, it should look like this:

`Element.to_a(node2) #=> [2,1]`

Remember that in this singly-linked list, each element just knows the
next element, so if we turn node1 into an array, even though node2 is
linked to node1, we'd expect this:

`Element.to_a(node1) #=> [1]`

After we can convert to an array, we want to be able to build a
singly-linked list from an array as well. The assumption would be that
each index represents a new node where the `datum` is the value of the
array at that index, and that that node's `next` element is an element
created from the value of the following array index.

```
arr = [3,2,1]
Element.from_a(arr) #=> <Element @datum=3, @next=<Element @datum=2,
@next=<Element @datum=1, @next=nil>>>

range = Element.from_a(1..10)
range.datum #=> 1
range.next.next.next.next.next.next.next.next.next.next.datum #=> 10
```

Finally, we should be able to convert an element to an array, then
create a new element from that array, and its structure should be the
same as the original element.

### 3 - Reverse the List

Finally, we want to be able to reverse a list from a given element.  

If we envision the list as a piece of data (`datum`) and a *pointer* to
the next element, then reversing a list is a matter of reversing the
pointers while retaining the data.

If we have a list with elements `A,B,C,D` that looks like this:
`A -> B -> C -> D`, then reversing that list at element A would make it
this:
`D -> C -> B -> A`. Essentially, the `next` of each element is reversed, so where
D used to have a `next` of `nil`, it now has a `next` of C. Where A once
had a `next` of B, it now has a `next` of `nil`.

Another way to visualize it would be like this: `A <- B <- C <- D`. Keep
in mind that we are still implementing only `next` in this list, even
though the directionality appears to indicate a `previous` style
relationship. In a singly-linked list, there is only one direction.

### 4 - Conclusion

Once you've done the above, all of your specs in
`spec/simple_linked_list_spec.rb` will be passing! We will then use this
`Element` class in the next part - implementing a Deque.

# Resources

Some more general reading about linked lists:

http://en.wikipedia.org/wiki/Linked_list
http://cjlwired.github.io/blog/2013/08/08/linked-lists-and-ruby/
http://en.wikipedia.org/wiki/Singly_linked_list#Singly_linked_lists
http://en.wikipedia.org/wiki/Doubly_linked_list
