# 발견 문제
## 1.run 했을 시 dependency error 발생
**원인** :
>  WriteDAO.xml에서 resultType 잘못 작성

**수정** :
```xml
<select id="selectByUid" resultType="com.lec.spring.WriteDTO"> 
-> 
<select id="selectByUid" resultType="com.lec.spring.domain.WriteDTO">
```

## 2. run시 connection 문제 발생 (mydb, myuser를 찾을 수 없음)

**원인** : 
>resource의 application.properties setting 문제

**수정** :

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/mydb?useSSL=false&serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true
spring.datasource.username=myuser
->
spring.datasource.url=jdbc:mysql://localhost:3306/mydb720?useSSL=false&serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true
spring.datasource.username=myuser720
```

## 3. 수정을 한 다음 수정(버튼) 클릭하면 error 발생
**원인** :
>  updateOk.jsp에서 uid parameter 잘못 넘겨줌

**수정** :
```jsp
location.href = "view.do?uid=${uid}";
-> 
location.href = "view.do?uid=${param.uid}"
```

## 4. 삭제하면 SQL Syntax Error 발생
**원인** :
>  updateOk.jsp에서 uid 잘못 넘겨줌

**수정** :
```sql
DELETE FROM test_write WHERE uid = #{uid}
-> 
DELETE FROM test_write WHERE wr_uid = #{uid}
```

## 5. 신규입력 하면 '작성자(name)'가 입력되지 않았음에도 작성이 완료됨
**원인** :
> write.jsp에서 작성자가 입력되지 않았을 경우에 대한 return값 부여하지 않음

**수정** :
```jsp
if(name == ""){
		alert("작성자 란은 반드시 입력해야 합니다");
		frm['name'].focus();
		
	}
->
	if(name == ""){
		alert("작성자 란은 반드시 입력해야 합니다");
		frm['name'].focus();
		return false;
	}
```