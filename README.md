## 📝프로젝트 정보
**[프로젝트 명]** 게시판 프로젝트 </br>
**[프로젝트 기간]** 2024/5/20 ~ 2024/5/30 </br>
**[개발 환경]** Java, SpringBoot, InteliJ </br>
**[기본 기능]** 게시글과 댓글 CRUD(조회, 생성, 수정, 삭제) 기능</br>
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
폼 데이터를 컨트롤러에서 받을 때 DTO 객체(: 폼 데이터를 받는 객체)를 이용해서 받는다. </br>
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
* **JPA**란, 자바 언어를 DB가 이해할 수 있게 하고, 데이터 관리에 편리한 여러 기능들을 제공한다. JPA의 핵심 도구로, Entity와 Repository가 있다. </br>
* **Entity**란, 자바 객체를 DB가 잘 이해할 수 있게 규격화한 데이터이다. </br>
* Entity는 **Repository**라는 일꾼을 통해 DB에 전달된다. </br>

```java
@PostMapping("/articles/create")
public String createArticle(ArticleForm form) {

        // 1. DTO -> Entity 변환
        Article article = form.toEntity();
        
        // 2. Repository 에게 Entity를 DB안에 저장하게 함
        Article saved = articleRepository.save(article);
        return "";
}
```

#### 6 DB 테이블과 SQL
* **CRUD**는 **SQL** 문법에서 **insert**(삽입), **select**(조회), **update**(수정), **delete**(삭제)로 사용된다. </br>
* 데이터베이스(DB)는 데이터를 테이블 형태로 관리한다. 테이블은 행과 열 형태로 구성된다. </br>

#### 7 데이터 조회하기
사용자 데이터 요청 -> Controller가 Repository에게 요청 전달 -> DB에게 요청 </br>
-> Entity로 반환 -> Model을 통해 ViewTemplates으로 전달 -> 결과 페이지 완성 </br>
```java
@GetMapping("/articles/{id}")
public String show(@PathVariable("id") Long id, Model model) {

        // 1: id로 데이터를 엔티티로 가져옴!
        Article articeEntity = articleRepository.findById(id).orElse(null);

        // 2: 가져온 데이터를 모델에 등록, 뷰로 전달!
        model.addAttribute("article", articeEntity);

        // 3: 보여줄 페이지를 설정!
        return "articles/show";
}
```

#### 8 데이터 목록조회
사용자 데이터 요청 -> Controller가 Repository에게 요청 전달 -> DB에게 요청 </br>
-> Entity묶음(List) 반환 -> Model을 통해 ViewTemplates으로 전달 -> 결과 페이지 완성 </br>
```java
@GetMapping("/articles")
public String index(Model model) {
        // 1: 모든 Article을 엔티티 묶음으로 가져옴!
        List<Article> articleEntityList = articleRepository.findAll();

        // 2: 가져온 Article 묶음을 모델에 등록, 뷰로 전달!
        model.addAttribute("articleList", articleEntityList);

        // 3: 뷰 페이지를 설정!
        return "articles/index"; // articles/index.mustache
}
```

#### 9 링크와 리다이렉트
* **Link**는 **요청**을 위함이다. </br>
* **Redirect**는 **응답**을 위함이다. 클라이언트에게 재요청을 지시한다. 재요청을 받은 클라이언트는 주소에 따라 다시 요청을 보낸다. </br>
* Link와 Redirect를 통해 페이지를 연결할 수 있다. </br>

#### 10 수정 폼 만들기
```java
@GetMapping("/articles/{id}/edit")
public String edit(@PathVariable("id") Long id, Model model) {
        // 수정할 데이터를 가져오기!
        Article articleEntity = articleRepository.findById(id).orElse(null);

        // 모델에 데이터를 등록!
        model.addAttribute("article", articleEntity);

        // 뷰 페이지 설정!
        return "articles/edit";
}
```

#### 11 데이터 수정하기
사용자 데이터 수정 -> 정보가 DTO에 담겨 전달 -> Controller가 Entity로 바꾸어 Repository에게 전달 -> DB를 갱신 </br>
```java
@PostMapping("/articles/update")
public String update(ArticleForm form) {

        // 1: DTO를 엔티티로 변환한다!
        Article articleEntity = form.toEntity();

        // 2: 엔티티를 DB로 저장한다!
        // 2-1: DB에서 기존 데이터를 가져온다!
        Article target = articleRepository.findById(articleEntity.getId()).orElse(null);
        // 2-2: 기존 데이터가 있다면! 값을 갱신한다!
        if (target != null) {
            articleRepository.save(articleEntity); // 엔티티가 DB로 갱신!
        }

        // 3: 수정 결과 페이지로 리다이렉트 한다!
        return "redirect:/articles/" + articleEntity.getId();
}
```

data.sql에 기본 데이터 삽입
```sql
INSERT INTO article(title, content) VALUES ('test 글쓰기1', '댓글 달아주세요1~');
INSERT INTO article(title, content) VALUES ('test 글쓰기2', '댓글 달아주세요2~');
INSERT INTO article(title, content) VALUES ('test 글쓰기3', '댓글 달아주세요3~');
```

#### 12 데이터 삭제하기
사용자 데이터 삭제-> Controller가 Repository를 통해 -> DB 데이터 삭제 -> 결과 페이지로 리다이렉트 </br>
```java
@GetMapping("/articles/{id}/delete")
public String delete(@PathVariable("id") Long id, RedirectAttributes rttr) {
        log.info("삭제 요청이 들어왔습니다!!");

        // 1: 삭제 대상을 가져온다!
        Article target = articleRepository.findById(id).orElse(null);

        // 2: 대상을 삭제 한다!
        if (target != null) {
            articleRepository.delete(target);
            rttr.addFlashAttribute("msg", "삭제가 완료되었습니다!");
        }

        // 3: 결과 페이지로 리다이렉트 한다!
        return "redirect:/articles";
}
```

#### 13 데이터 CRUD와 SQL 쿼리
* SQL **Create** 문법 </br>
```sql
INSERT INTO article VALUES (1, 'createtitle', 'createcontent')
```
* SQL **Read** 문법 </br>
```sql
SELECT * FROM article
```
* SQL **Update** 문법 </br>
```sql
UPDATE article SET name = 'createtitle' WHERE id = 4
```
* SQL **Delete** 문법 </br>
```sql
DELETE FROM article WHERE id=2
```
</br>

### 📖REST API와 테스트 
#### 14 REST API와 JSON
* **REST API**는 웹 서버의 자원을 클라이언트에 구애받지 않고 사용할 수 있게 하는 기술이다. </br>
* **XML**은 일종의 사용자 정의형 HTML이다. </br>
* **JSON**은 자바스크립트 방식을 차용한 객체 표현식이다. XML보다 JSON을 사용한다. </br>

`Talend API Tester`를 통해 GET, POST, PATCH, DELETE 요청에 대한 JSON 응답을 확인할 수 있다. </br>

#### 15 HTTP와 RestController
* `@Controller`와 `@RestController`의 차이점 </br>
* `@Controller`는 Model 객체를 만들어 데이터를 담고 View를 찾는다. </br>
* `@RestController`는 RestAPI용 컨트롤러이다. 단순히 객체만을 반환하고 JSON 또는 XML 형식으로 HTTP 응답에 담아서 전송한다. </br>

#### 16 서비스와 트랜잭션
* `Service`란 Controller와 Repository 사이에 위치하는 계층으로서, 처리 업무의 순서를 총괄한다. </br>
* `Transaction`이란 모두 성공되어야 하는 일련의 과정을 뜻한다. 일련의 과정 중 실패시 초기 단계로 돌아가는 것을 `Rollback`이라 한다. </br>

#### 17 테스트 코드 작성하기
Given, When, Then으로 명확하게 작성해야 한다. </br>
* `Given`부분에서 테스트를 진행할 행위를 위해 준비한다. (예상) </br>
* `When`부분에서 테스트를 진행한다. (실제) </br>
* `Then`부분에서 테스트를 진행한 행위에 대한 결과를 검증한다. (비교) </br>

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
