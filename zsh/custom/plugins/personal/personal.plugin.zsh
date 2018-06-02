# Export
export PATH=$PATH:/usr/local/Cellar/python/2.7.14/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/lib/:$HOME/Library/
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/:$HOME/Library/

# Fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Python tests
function pytest () {
    python setup.py test -q
    python3 setup.py test -q
}
