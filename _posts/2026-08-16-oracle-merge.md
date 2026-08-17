---
title: "Oracle MERGE를 사용할 때 확인할 것들"
category: Oracle
read_time: 6 min read
---
`MERGE`는 INSERT와 UPDATE를 한 문장에 처리할 수 있어 인터페이스나 동기화 업무에서 유용합니다.

하지만 `ON` 조건이 유일하지 않거나 서브쿼리에서 여러 행이 반환되면 예상치 못한 오류가 발생할 수 있습니다.

## 체크 포인트
1. ON 조건이 대상 행을 유일하게 식별하는가
2. 서브쿼리가 단일 행을 반환하는가
3. NULL 비교가 의도대로 처리되는가
4. 실행 전 SELECT로 대상 건수를 검증했는가
