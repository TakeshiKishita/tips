### ----------------------------
### 1. プロンプト強化（Gitブランチ + 色付き）
### ----------------------------

## ---- Hostname shorten ----
# bioentavancier → bio など、最初の3文字だけにする
SHORT_HOST=$(hostname | cut -c1-3)

### ---- Git branch ----
parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}

## ---- Directory shorten ----
# 上位階層は "…" に省略（好きな数字に調整可能）
export PROMPT_DIRTRIM=2

## ---- PS1 ----
export PS1="\[\e[32m\]\u@${SHORT_HOST}:\[\e[33m\]\W\[\e[36m\]\$(parse_git_branch)\[\e[0m\]\$ "

### ----------------------------
### 2. alias（作業効率爆上げ）
### ----------------------------
alias ll='ls -alF --color=auto'
alias la='ls -A'
alias l='ls -CF'

alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gb='git branch'

alias dc='docker ps -a'
alias di='docker images'
alias dstop='docker stop $(docker ps -q)'
alias drm='docker rm $(docker ps -aq)'

alias mux='tmux attach || tmux new'

alias py='python3'
alias pip='pip3'

### ----------------------------
### 3. 安全対策（誤削除防止）
### ----------------------------
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

### ----------------------------
### 4. 履歴強化（検索しやすく & 多く残す）
### ----------------------------
export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:cd:exit"

shopt -s histappend

### Ctrl-r を強化（インクリメンタル検索）
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

### ----------------------------
### 5. cd を賢くする（オート補完・フォルダ検索）
### ----------------------------
shopt -s autocd
shopt -s cdspell
shopt -s dirspell

### ----------------------------
### 6. Python と PATH まわり整備
### ----------------------------
export PATH="$HOME/.local/bin:$PATH"

### ----------------------------
### 7. GPU/CPU 負荷系（tmuxと併用推奨）
### ----------------------------
alias watchgpu='watch -n 1 nvidia-smi'
alias watchcpu='watch -n 1 ps -eo pid,pcpu,pmem,comm --sort=-pcpu | head'

### ----------------------------
### 8. Docker ストレージ監視
### ----------------------------
alias ddf='docker system df'
alias dbdu='docker buildx du'
