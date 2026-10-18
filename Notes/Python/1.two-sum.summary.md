# LeetCode 1: Two Sum

## Initial thinking

I recognized that the question guarantees a solution, so I considered recording values already seen while traversing the list.

## Approach considered

Use a dictionary whose keys are numbers and whose values are their indices. For each number, calculate the complement needed to reach the target and check whether that complement has already appeared.

## Where I got stuck

I needed a reminder of Python's `enumerate` syntax to iterate with both an index and a value.

## Hints I needed

I was prompted to check for the complement before adding the current number to the dictionary. This avoids using the same list element twice when the target is twice the current value.

## Mistakes or incorrect assumptions

No incorrect approach was pursued. I clarified why adding before checking could incorrectly match an element with itself.

## Key realization

At each index, the dictionary contains only earlier elements. Therefore, when the complement is found, its stored index and the current index form a valid answer.

## Final approach

Iterate through `nums` with `enumerate`. For each number, compute `target - number`. If that complement is in the dictionary, return its saved index and the current index. Otherwise, store the current number and index.

## Complexity

- Time: O(n)
- Space: O(n)

## What to recognize next time

When a problem asks for a pair that reaches a target, consider a hash map of previously seen values. Check before inserting the current value when an element must not be reused.
