팀의 막내인 철수는 아메리카노와 카페 라테만 판매하는 카페에서 팀원들의 커피를 사려고 합니다. 

아메리카노와 카페 라테의 가격은 차가운 것과 뜨거운 것 상관없이 각각 4500, 5000원입니다. 

각 팀원에게 마실 메뉴를 적어달라고 하였고, 그 중에서 메뉴만 적은 팀원의 것은 차가운 것으로 통일하고 "아무거나"를 적은 팀원의 것은 차가운 아메리카노로 통일하기로 하였습니다.

각 직원이 적은 메뉴가 문자열 배열 order로 주어질 때, 카페에서 결제하게 될 금액을 return 하는 solution 함수를 작성해주세요. order의 원소는 아래의 것들만 들어오고, 각각의 의미는 다음과 같습니다.
|order의 원소|의미|
|:-:|:-:|
|"iceamericano", "americanoice"|차가운 아메리카노|
|"hotamericano", "americanohot"|따뜻한 아메리카노|
|"icecafelatte", "cafelatteice"|차가운 카페 라테|
|"hotcafelatte", "cafelattehot"|따뜻한 카페 라테|
|"americano"|아메리카노|
|"cafelatte"|카페 라테|
|"anything"|아무거나|

`제한사항`
- 1 ≤ order의 길이 ≤ 1,000

`입출력 예`
|order|result|
|:-:|:-:|
|["cafelatte", "americanoice", "hotcafelatte", "anything"]|19000|
|["americanoice", "americano", "iceamericano"]|13500|

입출력 예 #1)
- 예제 1번의 입력을 표로 나타내면 다음과 같습니다.

|order[i]|팀원의 적은 음료|실제 주문 음료|
|---|---|---|
|"cafelatte"|카페 라테|차가운 카페 라테|
|"americanoice"|차가운 아메리카노|차가운 아메리카노|
|"hotcafelatte"|따뜻한 카페 라테|따뜻한 카페 라테|
|"anything"|아무거나|차가운 아메리카노|
- 철수는 차가운 아메리카노 2잔, 차가운 카페 라테 1잔, 따뜻한 카페 라테 1잔을 주문하게 되므로 결제 금액은 4500 &times; 2 + 5000 &times; 2 = 19000원입니다. 따라서 19000을 return 합니다.

입출력 예 #2)
- 예제 2번의 입력에서는 모든 음료를 차가운 아메리카노로 시키게 됩니다. 따라서 결제 금액은 4500 × 3 = 13500원이고 13500을 return 합니다.
