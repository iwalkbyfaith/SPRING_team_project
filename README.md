# 💻 스프링 팀 프로젝트 _ 웹 소설 연재 사이트


<!---->
## 목차
1. [**프로젝트 소개**](#프로젝트-소개)

2. [**조원 구성**](#조원-구성)

3. [**개발 환경**](#개발-환경)

4. [**프로젝트 구조**](#프로젝트-구조)

5. [**기능**](#기능)

6. [**느낀점**](#느낀점)
___


## 프로젝트 소개

<br/>


## 웹소설 연재 사이트
* 사이트에 등록된 무료, 유료 연재 소설을 조회할 수 있고, 결제 후 유료 소설을 구매할 수 있습니다.
* 무료 소설 게시판에 연재하고자 하는 작품을 신청할 수 있습니다. 관리자의 승인 후, 바로 연재 가능합니다.
* 한 달에 한 번 열리는 토너먼트에서 우승한 작품은 유료 소설 게시판에서 연재할 수 있습니다.
* 좋아하는 소설을 책갈피하거나 선호작을 눌러 마이페이지에서 조회할 수 있습니다.

<br/>

---

## 팀원 및 기능 

<br/>

* 고다은 - 스프링 시큐리티, 작품신청게시판 CRUD, 토너먼트 게시판
* 김대현 - 프로젝트 기획정의서 작성
* 김승곤 - 유료 소설 게시판 CRUD
* 변종민 - 무료 소설 게시판 CRUD, 마이페이지


<br/>

---

## 개발 환경
* Java 11
* Spring 5.0.7
* JQuery
* Oracle 18C
* bootstrap 5.0.2
* Ajax
* mybatis
* lombok


---
## 프로젝트 구조
![DB](https://user-images.githubusercontent.com/93142964/174594846-81f828f4-5fe4-43a0-b07b-b81fe6b2fbfa.PNG)

- 크게 네 개의 게시판과 유저 관련 게시판으로 나뉩니다.

![패키지](https://user-images.githubusercontent.com/93142964/174595236-2d3d544b-f2e7-4e93-b777-2c8aed42a357.png)

- 공동 작업에서의 충돌을 줄이기 위해, 기능(게시판)마다 패키지를 나누어 작업했습니다.



---

## 기능

---
> ### 메인화면
![image](https://user-images.githubusercontent.com/93142964/174599853-7d9c36fc-0a90-40e8-958a-bf4d7159e870.png)
>> * 스프링 시큐리티를 적용한 로그인
>> 
>
>> * 유료 혹은 무료 게시판의 조회수&추천수 베스트 작품으로 이동할 수 있음
>> 
>
>> * 캐러셀을 클릭하여 게시판에 접근 가능

---
> ### 작품 신청 게시판 CRUD
>> 작품 조회
>> ![image](https://user-images.githubusercontent.com/93142964/174600225-62ef012b-3e12-4692-b1b0-1f807b5f0c08.png)
>> * 다른 사람이 작성한 신청 폼을 조회할 수 있음
>> * 내가 이전에 작성한 폼과 결과, 관리자의 메세지를 조회 가능함.
>> 
>
>> 작품 신청 폼 작성
>> 
>
>> 신청 폼 수정
>> 
>
>> 신청 폼 삭제
>>
>
>> 관리자 승인/거부 버튼
>> ![image](https://user-images.githubusercontent.com/93142964/174599995-bdd1f02a-698a-41b3-8aba-56824e35a53b.png)
>> * 관리자 계정으로 로그인하여 'ROLE_ADMIN' 등급을 가지고 있어야 확인할 수 있는 '관리자 버튼'
>> * 관리자는 메세지와 함께 대기/거부/무료 승인을 선택할 수 있음
>> * 무료승인을 선택한 경우, 해당 작품은 바로 '무료 소설 게시판'으로 이동하고 작가는 즉시 연재 가능함.


---
> ### 무료 소설 게시판 CRUD
![image](https://user-images.githubusercontent.com/93142964/174599313-cbecd894-e453-45dd-a416-6fc741fb1a06.png)

>> 무료 소설 새로운 회차 추가   
>> 
>
>> 회차 수정
>> 
>
>> 회차 삭제
>>
>
>> 선호작, 책갈피, 추천, 댓글
![image](https://user-images.githubusercontent.com/93142964/174599431-eb9e3109-622e-4990-a729-7c0d0c1ad198.png)
![image](https://user-images.githubusercontent.com/93142964/174599510-080687d0-2fc3-44bb-96d5-799018f0aaf9.png)



---
> ### 토너먼트 게시판
>> 8강, 4강, 2강(결승), 예상 우승 작품 조회
>> 
>
>> 각 토너먼트 별 추천 버튼
>> 
>
>> 토너먼트 종료시의 변화
>> 1. 작품 & 작가 관련
>> 
>> 1-1) 작품의 컬럼인 week를 무료 게시판에서 유료 게시판으로 변경(유료 게시판에 새로 적재됨)
>> 
>> 1-2) 작가의 등급 변경(유료 작가)
>> 
>> 1-3) 무료 게시판에서 연재했던 데이터 삭제


>> 2. 대회 관련
>> 
>> 2-1) 다음 토너먼트를 위해서 날짜 데이터 업데이트
>> 
>> 2-2) 토너먼트 테이블 데이터 삭제
>> 
>> 2-3) 토너먼트 추천 기록 테이블 데이터 삭제
> 
---
> ### 유료 소설 게시판 CRUD
>> 유료 소설 새로운 회차 추가   
>> 
>
>> 회차 수정
>> 
>
>> 회차 삭제
>>
>
>> 선호작, 책갈피


---
> ### 결제
>> KG 이니시스를 사용한 결제 모듈 적용  
>

---
## 배운점

1. Ajax적용 및 작동방식 이해.
2. 깃허브에서 브랜치를 나누어 소스트리 프로그램을 사용한 협업 방식 이해
3. KG이니시스를 사용해 결제 기능을 구현
4. JUnit을 활용한 DB연결과 & 서비스로직 테스트 가능.


## 느낀점

1. 첫 번째 프로젝트보다 늘어난 DB를 계속해서 수정하고 컨트롤 하는 과정에서, 데이터베이스를 탄탄하게 만드는 것이 가장 중요하다는 것을 느꼈음.

2. 서로 다른 기능을 작업하더라도, 현재 어느정도 진행되었고 어떤 기능이 추가 되면 좋을지 등을 지속적으로 커뮤니케이션 하면서 기간 내에 작업할 수 있었음.
