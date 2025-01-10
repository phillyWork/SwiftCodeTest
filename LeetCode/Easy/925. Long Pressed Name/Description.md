Your friend is typing his name into a keyboard. Sometimes, when typing a character c, the key might get long pressed, and the character will be typed 1 or more times.

You examine the typed characters of the keyboard. Return True if it is possible that it was your friends name, with some characters (possibly none) being long pressed.

`Constraints`
- 1 <= name.length, typed.length <= 1000
- name and typed consist of only lowercase English letters.

`Example`
|Input|Output|
|:-:|:-:|
|name = "alex", typed = "aaleex"|true|
|name = "saeed", typed = "ssaaedd"|false|

Example 1 Explanation)
- 'a' and 'e' in 'alex' were long pressed.

Example 2 Explanation)
- 'e' must have been pressed twice, but it was not in the typed output.
 

