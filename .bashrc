

# export CAPACITOR_ANDROID_STUDIO_PATH="/snap/android-studio/current/android-studio/bin/studio.sh"
export CAPACITOR_ANDROID_STUDIO_PATH="~/android-studio-4.1/bin/studio.sh"

# Python and Pyenv
#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init --path)"
#eval "$(pyenv virtualenv-init -)"

# Docker Aux alias
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

# Personal utilities
alias space_usage='du -h --max-depth=1| sort -h -r'
