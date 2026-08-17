[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
chcp 65001 | Out-Null

$ErrorActionPreference = "Stop"

# ==========================================
# KimHungGi.github.io 자동 배포 스크립트
# ==========================================

$ProjectPath = "C:\Users\sana\Documents\KimHungGi.github.io"
$DeployPath  = "C:\Users\sana\Documents\KimHungGi-pages"

Write-Host ""
Write-Host "========================================="
Write-Host " KimHungGi.github.io Deploy"
Write-Host "========================================="
Write-Host ""


# ------------------------------------------
# 1. 프로젝트 폴더 이동
# ------------------------------------------

Write-Host "[1/6] 프로젝트 확인..."

Set-Location $ProjectPath


# ------------------------------------------
# 2. main 브랜치에 원본 저장
# ------------------------------------------

Write-Host ""
Write-Host "[2/6] main 브랜치 업데이트..."

git add .

$changes = git status --porcelain

if ($changes) {

    $date = Get-Date -Format "yyyy-MM-dd HH:mm"

    git commit -m "Update portfolio $date"

    if ($LASTEXITCODE -ne 0) {
        throw "Git commit 실패"
    }

    git push origin main

    if ($LASTEXITCODE -ne 0) {
        throw "main 브랜치 Push 실패"
    }

}
else {

    Write-Host "변경된 원본 파일 없음 - main commit 생략"

}


# ------------------------------------------
# 3. Jekyll 빌드
# ------------------------------------------

Write-Host ""
Write-Host "[3/6] Jekyll 사이트 빌드..."

bundle exec jekyll build

if ($LASTEXITCODE -ne 0) {
    throw "Jekyll 빌드 실패"
}


# ------------------------------------------
# 4. 배포 폴더 확인
# ------------------------------------------

Write-Host ""
Write-Host "[4/6] 배포 폴더 준비..."

if (-not (Test-Path $DeployPath)) {

    throw @"
배포 폴더가 없습니다.

$DeployPath

gh-pages 배포 폴더를 먼저 생성해야 합니다.
"@

}


# ------------------------------------------
# 5. 기존 배포 파일 삭제 후 새 빌드 복사
# ------------------------------------------

Write-Host ""
Write-Host "[5/6] 최신 사이트 파일 복사..."

Get-ChildItem $DeployPath -Force |
Where-Object {
    $_.Name -ne ".git"
} |
Remove-Item -Recurse -Force


Copy-Item `
    "$ProjectPath\_site\*" `
    $DeployPath `
    -Recurse `
    -Force


# GitHub가 Jekyll을 다시 처리하지 않도록 설정

New-Item `
    "$DeployPath\.nojekyll" `
    -ItemType File `
    -Force |
Out-Null


# ------------------------------------------
# 6. gh-pages 배포
# ------------------------------------------

Write-Host ""
Write-Host "[6/6] GitHub Pages 배포..."

Set-Location $DeployPath

git add -A

$deployChanges = git status --porcelain

if ($deployChanges) {

    $date = Get-Date -Format "yyyy-MM-dd HH:mm"

    git commit -m "Deploy $date"

    if ($LASTEXITCODE -ne 0) {
        throw "gh-pages commit 실패"
    }

    git push origin gh-pages

    if ($LASTEXITCODE -ne 0) {
        throw "gh-pages Push 실패"
    }

}
else {

    Write-Host "배포할 변경사항 없음"

}



# ------------------------------------------
# 완료
# ------------------------------------------

Set-Location $ProjectPath

Write-Host ""
Write-Host "========================================="
Write-Host " DEPLOY COMPLETE"
Write-Host "========================================="
Write-Host ""
Write-Host "Site:"
Write-Host "https://KimHungGi.github.io"
Write-Host ""