# Created by newuser for 5.9

# ===== ヒストリー設定 =====
HISTSIZE=10000              # メモリに保持するコマンド履歴の数
SAVEHIST=10000              # ファイルに保存するコマンド履歴の数
HISTFILE=~/.zsh_history     # 履歴を保存するファイルの場所
setopt share_history        # 複数ターミナル間で履歴を共有
setopt hist_ignore_dups     # 連続する同じコマンドを重複記録しない
setopt hist_ignore_space    # スペースで始めたコマンドは履歴に残さない

# ===== 基本オプション =====
setopt auto_cd              # ディレクトリ名だけで移動できる（cdを省略可）
setopt no_beep              # ビープ音を鳴らさない

# ===== 補完（タブキーで候補を出す機能） =====
autoload -Uz compinit       # 補完システムを読み込む
compinit                    # 補完を有効化
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 小文字で打っても大文字にマッチ

# ===== ls カラー設定 =====
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="${LS_COLORS}ow=01;33:tw=01;35:"
    ls() { command ls --color=auto "$@" }
fi

# ===== パス設定 =====
export PATH="$HOME/.local/bin:$PATH"

# ===== chpwd =====
chpwd() {
  ls -la
}

. "$HOME/.deno/env"
# ===== zeno.zsh =====
export ZENO_DISABLE_SOCK=1
export ZENO_GIT_CAT="cat"
export ZENO_GIT_TREE="tree"

# ===== sheldon（プラグインマネージャー） =====
eval "$(sheldon source)"

# ===== Starship（プロンプトテーマ） =====
eval "$(starship init zsh)"


if [[ -n $ZENO_LOADED ]]; then
  bindkey ' '  zeno-auto-snippet           # スペースでスニペット展開
  bindkey '^m' zeno-auto-snippet-and-accept-line  # Enterでスニペット展開+実行
  bindkey '^i' zeno-completion             # Tabでfzf補完
  bindkey '^x^s' zeno-insert-snippet       # Ctrl+x → Ctrl+s でスニペット一覧
  bindkey '^r' zeno-history-selection       # Ctrl+r でヒストリー検索
fi
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
