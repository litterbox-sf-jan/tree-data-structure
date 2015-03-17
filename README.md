# Binary Search Trees

Your task is to fully implement a Binary Search Tree with the following functionality:

1. Correct insertion of new values, using the `Node` and `Tree` classes provided in `lib/`
2. Depth-first traversal:
    1. Pre-order (`Tree#pre_order`)
    2. In-order (`Tree#in_order`)
    3. Post-order (`Tree#post_order`)
3. Breadth-first/level-order traversal (`Tree#level_order`)
4. Find a value in the tree (`Tree#find`)

**Note:** Traversals should return arrays containing the visited nodes, in the correct order.

The `Tree#find` method may use any of the traversals, your choice.

The tests in the `spec/` folder will guide you to the solutions. Understand the next failing step in the spec, understand how to code up the solution. And, of course, use what we had discussed in class.

This exercise is going to be much easier to do in ruby first, and that is what we have a solution for, and that is what the tests are written for.

If you finish the ruby solution quickly, pelase feel free to attempt it in JS. =)