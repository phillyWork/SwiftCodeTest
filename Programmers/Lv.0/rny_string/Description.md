문자열 rny_string이 주어질 때, rny_string의 모든 'm'을 "rn"으로 바꾼 문자열을 return 하는 solution 함수를 작성해 주세요.

`제한사항`
- 1 ≤ rny_string의 길이 ≤ 100
- rny_string은 영소문자로만 이루어져 있습니다.

`입출력 예`
|rny_string|result|
|:-:|:-:|
|"masterpiece"|"rnasterpiece"|
|"programmers"|"prograrnrners"|
|"jerry"|"jerry"|
|"burn"|"burn"|
- 입출력 예 #1)

|rny_string|m|a|s|t|e|r|p|i|e|c|e|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|result|rn|a|s|t|e|r|p|i|e|c|e|

- 입출력 예 #2)

|rny_string|p|r|o|g|r|a|m|m|e|r|s|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|result|p|r|o|g|r|a|rn|rn|e|r|s|

- 입출력 예 #3)
예제 3번의 rny_string에는 'm'이 없습니다. 따라서 rny_string 그대로인 "jerry"를 return 합니다.
- 입출력 예 #4)
예제 4번의 rny_string에는 'm'이 없습니다. 따라서 rny_string 그대로인 "burn"를 return 합니다.
