---
title: "WMS 배송 인터페이스 개선"
type: "Backend / Data"
description: "Oracle 기반 배송 스케줄 인터페이스의 데이터 병합, 상태 처리, 오류 분석을 개선한 프로젝트."
tech: [Java, Oracle, PL/SQL, MERGE, SQL]
featured: true
order: 2
---
## Problem
외부 인터페이스 파일의 배송 상태를 기존 데이터와 안정적으로 동기화해야 했습니다.

## What I did
- `MERGE INTO` 기반 UPSERT 쿼리 구성
- 복수 행 서브쿼리, 바인딩 오류 등 운영 장애 분석
- `EXISTS`, Window Function을 활용해 중복/상태 로직 정리
- 인터페이스 처리 단위별 오류 추적성 개선
