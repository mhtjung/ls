# Find and fix the bug in the following code:

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([]) # works
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# is expected to print:

[]
[21]
[9, 16]
[25, 36, 49]

# However, it does not. Obviously, there is a bug. Find and fix the bug, then explain why the buggy program printed the results it did.
=begin

The fix was on line 6. The elsif statement didn't have a conditional at the end of it.

Explanation: (Incorrect)
Since if/else returns nil when none of the conditions are met, the only 'succesful' test of the code was the first. The first test used an empty array as a parameter which is caught by the first
if conditional ( if array.empty? ).

Explanation: (Correct)
When ruby sees the missing conditional after elsif on line 6, it looks for a conditional on the next line. An array#map call (and it's associated code block)
are technically considered conditional expressions that's value is truthy. It's value is the returned array whose value is always true.

Since Ruby thinks that the Array#map is the conditional associated with elsif, it looks for an associated code block. Since the Array#map statement (and
its associated code block) are being used as the elsif conditional, Ruby ignores Array#map's code block. Since conditional branches don't require a code
block, no error is raised and the function returns nil whenever an non-empty array is passed to my_method.
=end