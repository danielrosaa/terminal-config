#!/usr/bin/env bash
if [ ! -d  "$NVM_DIR" ]; then
    # wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash # Automatic installation
    (
        git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
        cd "$NVM_DIR"
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && \. "$NVM_DIR/nvm.sh"

    nvm install stable
else
    (
        cd "$NVM_DIR"
        git fetch --tags origin
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && \. "$NVM_DIR/nvm.sh"

    nvm install stable --reinstall-packages-from=current
    nvm alias default
fi
