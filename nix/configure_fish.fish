function setup_theme
    # Installing fisher
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
    fisher install oh-my-fish/theme-clearance
end

function setup_sdkman
    echo "Install SDKMAN and configuration for fish"
    curl -s "https://get.sdkman.io" | bash
    fisher install reitzig/sdkman-for-fish

    echo "Install Java 8 and 11"
    sed -i "s/sdkman_auto_answer=false/sdkman_auto_answer=true/g" ~/.sdkman/etc/config
end

function setup_rbenv
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
    echo 'set PATH $PATH ~/.rbenv/bin' >> ~/.config/fish/conf.d/000-conf.fish
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
    fisher install rbenv/fish-rbenv
end
