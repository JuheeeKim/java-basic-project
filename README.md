## 📝프로젝트 정보
**[프로젝트 명]** 게시판 프로젝트 </br>
**[프로젝트 기간]** 2024/5/20 ~ 2024/5/30 </br>
**[개발 환경]** Java, SpringBoot, InteliJ </br>
**[기본 기능]** 게시글과 댓글 확인, 생성, 수정, 삭제 기능</br>
**[참고]** [유튜브 강의](https://www.youtube.com/channel/UCpW1MaTjw4X-2Y6MwAVptcQ) </br>
</br>

## 💻실행 화면
#### 게시판 메인 화면
<img src="https://github.com/JuheeeKim/spring-basic-project/assets/123529128/9b33368a-b53b-453e-aef8-aa7d9105dfb6"  width="850" height="330"/> </br>
</br>

## ✏️프로젝트에 활용한 이론 정리
### 📖모델, 뷰, 컨트롤러
#### 1 뷰 템플릿과 MVC 패턴 </br>
* **View Templates** </br>
  - 보통 사이트에 로그인을 하면, _"{닉네임}님, 반갑습니다!"_ 라는 문구가 출력된다. </br>
  - 뷰템플릿을 사용하면 하나의 페이지에서 변수값에 따라 다른 문구가 출력되도록 할 수 있다. </br>
  - **Mustache**가 이런 View 템플릿을 만드는 도구이다. </br>
* **MVC 패턴**</br>
  - 화면을 담당하는 뷰템플릿에게 **C**ontroller와 **M**odel이라는 두 동료가 있다. </br>
  - Contoller는 처리 과정을 담당하고, Model은 데이터를 담당한다. </br>
  - 처리, 데이터 분야를 담당자별로 나누는 기법이다. </br>

#### 2 MVC의 역할과 실행흐름 </br>
* 사용자가 **Controller**를 조작하면, </br>
* Controller는 **Model**을 통해서 데이터를 가져오고, </br>
* 그 정보를 바탕으로 시각적인 표현을 담당하는 **View**를 제어해서 사용자에게 전달하게 된다. </br>

#### 3 뷰 템플릿과 레이아웃
* **레이아웃**: 화면의 요소 배치로, header, content, footer가 기본 구성이다. </br>
  - **Header**란, 사이트 안내를 위한 Navigation 역할을 한다.  </br>
  - **Content**란, 말 그래로 화면의 핵심 내용이 들어간다.  </br>
  - **Footer**란, 사이트에 대한 정보 Infomation 역할을 한다. </br>

</br>

### 📖게시글 CRUD
#### 4 폼 데이터 주고 받기 </br>
폼 데이터를 컨트롤러에서 받을 때 DTO 객체를 이용해서 받는다. </br>
```java
public class ArticleForm {

    private String title;
    private String content;

    public ArticleForm(String title, String content) {
        this.title = title;
        this.content = content;
    }
```

컨트롤러에서 DTO 데이터를 받아오기 위해서는 파라미터로 DTO를 받아줘야 한다. 
```java
 @PostMapping("/articles/create")
    public String createArticle(ArticleForm form) {
        ...
        return "";
    }
```

#### 5 데이터 생성 with JPA
#### 6 DB 테이블과 SQL
#### 7 데이터 조회하기
#### 8 데이터 목록조회
#### 9 링크와 리다이렉트
#### 10 수정 폼 만들기
#### 11 데이터 수정하기
#### 12 데이터 삭제하기
#### 13 데이터 CRUD와 SQL 쿼리
</br>

### 📖REST API와 테스트 
#### 14 REST API와 JSON
#### 15 HTTP와 RestController
#### 16 서비스와 트랜잭션
#### 17 테스트 코드 작성하기
</br>

### 📖댓글 CRUD
#### 18 댓글 엔티티와 리파지터리
#### 19 댓글 서비스와 컨트롤러
#### 20 댓글 목록 뷰 만들기
#### 21 댓글 등록 with JS
#### 22 댓글 수정 with JS
#### 23 댓글 삭제 with JS
</br>

### 📖더 나아가기
#### 24 DB 연동하기
#### 25 IoC와 DI
#### 26 AOP, 관점지향 프로그래밍
#### 27 ObjectMapper, JSON 변환
</br>
