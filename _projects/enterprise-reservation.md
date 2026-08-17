---
title: "기업 예약 관리 시스템"
type: "Enterprise Web"
description: "예약 등록부터 월/일/시간별 제한 검증까지 업무 규칙을 구현한 사내 웹 시스템."
tech: [Java, Spring MVC, MyBatis, Oracle, JSP]
featured: true
order: 1
---
## Overview
기업 고객의 예약을 등록·수정·조회하고 계약 조건에 따라 예약 가능 수량을 검증하는 업무 시스템입니다.

## My Role
- Controller / Service / DAO / SQL 전 구간 기능 구현
- 월별/시간대별 예약 제한 로직 구현
- JSP 폼 검증 및 체크박스 데이터 처리
- 운영 데이터 확인 및 오류 분석

## Key Point
업무 규칙을 단순 화면 검증에 의존하지 않고 서버와 데이터 조회 로직에서 함께 검증하도록 구성해 데이터 정합성을 높였습니다.
