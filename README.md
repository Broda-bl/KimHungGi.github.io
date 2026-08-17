# KHG.dev Jekyll Theme

개발자 경력 + 포트폴리오 + 기술 블로그 + Contact를 한 사이트에서 운영하기 위한 Jekyll 스타터입니다.

## Local
```bash
bundle install
bundle exec jekyll serve
```

http://127.0.0.1:4000

## Customize
- `_config.yml`: 이름/직무/이메일/GitHub 주소
- `career.md`: 경력
- `_projects/*.md`: 포트폴리오
- `_posts/YYYY-MM-DD-title.md`: 블로그 글
- `assets/css/main.css`: 디자인

## Windows note
이 프로젝트에는 `wdm`이 없습니다. 기존 Gemfile에서 wdm 설치 오류가 나던 환경에서도 새 폴더에서 이 프로젝트 자체의 Gemfile로 설치하세요.
