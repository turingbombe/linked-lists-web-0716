----
tags: data structures, linked lists, stack, deque, computer science
languages: ruby
----

# Objective

Implement a double-ended queue (deque - pronounced "deck") in Ruby

# Introduction

In simple-lists we created a push-down stack using a purely
functional linked list, but if we allow mutability and add another
pointer we can build a very fast deque data structure.

Deques have four fundamental operations (using Array terminology):

* push (insert value at back)
* unshift (insert value at front)
* pop (remove value at back)
* shift (remove value at front)

The difference between deque and Array performance is that a deque
implements all of these operations in constant time. Even clever
implementations of Array will often have to copy the entire Array
in order to unshift.

Under the hood we'll use the same Element class from
simple-linked-list, but we will need writeable `next` and `previous`
attributes. `next` does what it already does, and `previous` points to
the previous `Element` in the list.

To make the API usable, you'll use a Deque class as a proxy for this
list. There two good ways to implement Deque: maintain separate references to the
first and last Element, or maintain a reference to one of them and
ensure that the list is circular (first.prev.next == first).

To keep your implementation simple, the tests will not cover error
conditions. Specifically: pop or shift will never be called on an empty Deque.

You'll use the specs in `spec/deque_spec` as your guide.

In languages that do not have good support for mutability (such as
Elixir or Erlang), you may choose to implement a functional Deque
where shift and pop have amortized O(1) time. The simplest data structure
for this will have a pair of linked lists for the front and back,
where iteration order is front ++ reverse back.

# Lab Steps

### 1 - Augment Element

We first need to make our elements *mutable* and make them understand
both `next` and `previous` elements. The first `describe` block in
`spec/deque_spec.rb` defines specs for this.

The end result is that you can set `next` and `previous` after object
creation, at any time.

Additionally, we want setting `next` to also set `previous` on the next
element, or setting `previous` to also set `next` on the previous
element, so that we ensure our list integrity in a single operation
rather than having to perform both operations every time (and
potentially forgetting!)

This action of having each node know both `next` and `previous` nodes
transforms it from a *singly-linked list* to a *doubly-linked list*.

### 2 - Deque

Now we make the Deque. The second `describe` block in
`spec/deque_spec.rb` defines these specs.

Yes, you could use an Array under the hood of the Deque to get the tests
to pass, but don't be tempted. The goal is to actually implement a
Deque for your Element objects.

**Push and Pop**

In a stack, `push` pushes the elements down and places a new one on top,
and `pop` removes the top item, making the next item the top. Back to
the can of Pringles analogy, a `push` puts a new chip in the top of the
can, and 100 `pop` operations means you ate them all in order.

```
deque = Deque.new
deque.push(10)
deque.push(20)
deque.pop #=> 20
deque.push(30)
deque.pop #=> 30
deque.pop #=> 10
```

Each `push` should take an argument that will become the `datum` of a
new element that will be linked to the current top-most element in the
Deque.

Each `pop` should remove the top-most element in the Deque

Remember to adjust `next`/`previous` appropriately.

**Shift and Unshift**

In a stack, `unshift` is similar to `push`, except working on the bottom
of the stack. If you `unshift` a pringle into the can, you magically put
it on the very bottom of the stack.

If `unshift` is similar to `push`, then `shift` is similar to `pop`. If
you `shift` the can of pringles, you remove the bottom chip and eat it.

```
deque = Deque.new
deque.push(10)
deque.push(20)
deque.shift #=> 10
deque.unshift(10)
deque.pop #=> 20
```

Once you've implemented `push`, `pop`, `shift` and `unshift` you will
have a working double-ended queue and a full set of passing tests!
