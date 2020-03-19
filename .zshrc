export N_PREFIX="$HOME/.local/share/nodejs"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
export NODE_ENV="development"
export AWS_PROFILE="shared"
export GH_TOKEN="79ce3720b72ea38a3c81d4924bda275dcd00b5b1"
export PGHOST="localhost"
export PGUSER="postgres"
export PGPASSWORD="smartcar"
export AWS_SDK_LOAD_CONFIG=1

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# git integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%f'
zstyle ':vcs_info:*' enable git

PROMPT='%F{white} %~ 
 %# '

RPROMPT='%(?.%F{green}√%f.%F{red}%?)%f $vcs_info_msg_0_ $NODE_ENV %F{yellow}$AWS_PROFILE%f %*'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
