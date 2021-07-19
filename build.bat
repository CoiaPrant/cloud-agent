@echo off
set UserName=CoiaPrant
set Name=cloud-agent
set Version=1.0.0

if exist dist (
    del /F /S /Q dist > NUL
    rd /S /Q dist > NUL
)

if not exist .git (
    git init
    git config --global core.autocrlf true
    git config --global credential.helper store
    git remote add origin https://github.com/%UserName%/%Name%.git
)
git add --all
git commit -m "v%Version%"
git push -u origin master -f
git tag -a v%Version% -m "release v%Version%"
git push origin v%Version%
goreleaser
pause