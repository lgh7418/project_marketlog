address_no는 오토 인크레니까 넣을 필요 없고

member_no랑 주소, 배송비만 넣으면 됨



로그인 인터셉터에서 member_no를 세션에 바인딩했음



dto에 배열로 담고

서비스에서 불러옴 

서비스에서 addressVO.getMember_no를 해서 dao에 넣어줌



리스트로 받아옴...

리스트를 풀어서 넣어야 함....

dto를 받아옴

dto.list()하면 리스트가 나올 것.

dto : list {

dto list의 0번 1번을 name, price에 넣고, 

}

GoodsDTO [goods_name=null, goods_price=null, list=[GoodsDTO [goods_name=11, goods_price=11, list=null], GoodsDTO [goods_name=33, goods_price=33, list=null]]]

list = goodsDTO.getList()

list[0].getGoods_name() , list[0].getGoods_price()

 list[1]



addressVO로 address_no 조회



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



- [ ] 상품명 중복 선택 하면 안됨
- [ ] 선택 하고 dropdown 자동으로 close / hide


- [ ]  form 태그 넣어서 선택한 상품 이름, 가격 넘기기
- [ ]  db에 넣어야 할 것: 주문 번호, 구매한 사람 member_no, 페이지 address_no, 상품 이름, 상품 가격
- [ ]  배송 정보 테이블: 주문 번호, 배송 정보


