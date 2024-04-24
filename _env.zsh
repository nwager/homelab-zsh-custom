# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export TEGRA="$(find ~/nvidia -maxdepth 1 -type d -name "r36*" | sort -r | head -1)/Linux_for_Tegra"
