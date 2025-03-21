문자열 myString과 pat가 주어집니다. myString의 부분 문자열중 pat로 끝나는 가장 긴 부분 문자열을 찾아서 return 하는 solution 함수를 완성해 주세요.

`제한사항`
- 5 ≤ myString ≤ 20
- 1 ≤ pat ≤ 5
- pat은 반드시 myString의 부분 문자열로 주어집니다.
- myString과 pat에 등장하는 알파벳은 대문자와 소문자를 구분합니다.

`입출력 예`
|myString|pat|result|
|:-:|:-:|:-:|
|"AbCdEFG"|"dE"|"AbCdE"|
|"AAAAaaaa"|"a"|"AAAAaaaa"|

입출력 예 #1)
- "AbCdEFG"에서 "dE"는 한 번 등장하며 처음부터 해당 위치까지 잘라내면 "AbCdE"가 됩니다. 따라서 이 문자열이 "dE"로 끝나는 가장 긴 문자열이며, "AbCdE"를 return 합니다.

입출력 예 #2)
- "AAAAaaaa"에서 "a"는 총 네 번 등장하며 이 중 가장 마지막에 있는 위치까지 잘라내면 "AAAAaaaa"가 됩니다. 따라서 이 문자열이 "a"로 끝나는 가장 긴 문자열이며, "AAAAaaaa"를 return 합니다.
