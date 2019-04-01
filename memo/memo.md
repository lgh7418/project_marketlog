- [ ] 주소가 중복되면 안됨

- [x] 배송비를 안넣으면 안됨
- [ ] 

다음 버튼 눌렀을 때, 주소가 중복되면 안됩니다.

배송비를 안넣으면 다음으로 못 넘어가게 함

#### seller/input 처리

```js
if (
```

#### seller_form

* 테이블 왼쪽에 삭제 버튼 추가



상품이름이 null이면 mapper에 넣지 않기



### buyer/input -> buyer_select

주소 받아옴(controller) 

* 주소를 모바일 버전으로 처리
* 주소를 바인딩해서 값 넘겨줌
* iframe의 src에 입력

주소를 넣어서 주소 번호 받아옴(service)

if 주소가 일치하는 페이지가 있다면

* 주소번호랑 일치하는 상품 목록 받아옴 (service) <완료!>
* 상품 목록을 option 태그에 뿌려줌

### buyer_select

옵션을 선택

* 선택한 옵션(상품 이름, 가격)이 아래 표에 뿌려지고

* 수량 버튼이랑 전달사항 체크가 뜸
* if 전달사항 체크
  * 전달사항 input 박스가 뜸

'주문하기' 버튼 클릭

* 표의 값을 받아서 db에 넘김
* 주문번호, 주소 번호, 상품 이름, 상품 수량, 전달사항
* 주문번호, 총가격, 배송비





판매하기 

#### service

```java
// 상품 목록 조회
List<GoodsVO> goodsList = goodsDAO.selectGoods(GoodsVO);
// 상품이 없는 경우 null을 반환
/*if(goodsList.size()==0) {
    return null;
}*/
// 상품정보를 반환
return goodsList;
```

#### view

```jsp
<c:forEach var="goods" items="${goodsList}">
    ${goods[0]} // goods_name
    ${goods[1]} // goods_price
```

버튼 클릭하면 

밑에 뜨게 함



이벤트: 테이블을 만들어놓고 display:hidden을 보이게 설정

#### buyer_select

- [ ] 상품명 중복 선택 하면 안됨
  * 상품명 선택하면 onclick 속성을 없애게 함
  * 삭제를 선택하면 onclick 속성을 다시 생성
- [ ] 선택 하고 dropdown 자동으로 close / hide


- [x] form 태그 넣어서 선택한 상품 이름, 가격 넘기기
- [x] db에 넣어야 할 것: 주문 번호, 구매한 사람 member_no, 페이지 address_no, 상품 이름, 상품 가격

##### !문제

- [x] vo에 있는 field가 input이 없어도 예외 발생 안하는가? -> 발생 안함 null
- [x] isEmpty 적용 했는데도 null이 넘어감
  * 지금은 됨... 이유 모름

#### buyer_shipping


- [x] 배송 정보 테이블: 주문 번호, 배송 정보
- [ ] buyer_shipping에서 취소하면 derete row
- [x] 배송 정보 넣음 -> 주문 번호 가져옴 -> 주문 상품 번호 넣음

##### !문제

- [x] order_goods의 주문번호가 order_info의 주문번호랑 다름
  * insert 안에 selectkey 이용했는데  insert의 파라미터타입이 map종류인 경우, map에 key값이 들어가서 getter로 가져와야 함



#### 구매현황

- [ ]  db에서 : id를 찾고 -> 주문 날짜, 주문 번호, 배송 정보 (order_info)
- [ ]  주문 번호 -> 상품 목록 (order_goods)
- [ ]  배송 정보 수정 / 선택한 상품 주문 취소

##### !문제

- [ ]  한 페이지에서 여러 상품을 주문하면 나중에 select할 때 가나다 순서대로 나올 거임
- [ ]  가격 합계 써줘야 함 (buyer_shipping)



