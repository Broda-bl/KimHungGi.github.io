---
title: "Spring MVC 요청 흐름을 실무 기준으로 보기"
category: Spring
read_time: 5 min read
---
Spring MVC를 공부할 때 Controller, Service, DAO를 각각 외우기보다 하나의 요청이 어떻게 이동하는지 보는 것이 이해하기 쉽습니다.

화면 입력 → Controller → Service → Mapper/DAO → DB → 응답의 순서로 추적하면 오류가 어느 구간에서 발생했는지 빠르게 좁힐 수 있습니다.
