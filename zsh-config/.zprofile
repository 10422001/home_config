# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

export LANG=en_US.UTF-8
eval "$(lua /Users/dominikocsofszki/Dev/git_downloads/z.lua/z.lua --init zsh)"

export MY=$HOME/.cache/MY/my_cache.mycache





alias cpdd='cp $HOME/Downloads/"$(ls $HOME/Downloads/| fzf)" $HOME/Uni/univim/downloads'
alias cpD='cp "$(_fcpD)"  $HOME/Uni/univim/downloads'
alias _fcpD="fd .pdf$ $HOME/Downloads/ | fzf  --preview-window 'right:60%' --preview ' pdftotext -layout -f 1  {} -'"

alias fH='nvim $HOME/.config/home_config/$(ls -a $HOME/.config/home_config/ | fzf --height=50% --reverse )'
alias fh='nvim $HOME/.config/home_config/$(ls -a $HOME/.config/home_config/ | fzf --height=50% --reverse --preview "bat {}")'

alias S=' source $HOME_CONFIG/.zprofile; source  $HOME_CONFIG/.zshrc source  $HOME_CONFIG/.zsh_myscript'
alias fp="fzf  --preview-window 'right:60%' --preview 'pdftotext -layout -f 1 {} -'"
alias fzpdf="fd .pdf$ . | fzf  --preview-window 'right:60%' --preview ' pdftotext -layout -f 1  {} -'"
alias .="nvim ."
alias n='nvim $(fz)'
alias searchPDF="rg . $HOME/Uni/univim/downloads/.pdftext/  | fzf | gcut -s -f 1 -d $':' | sd ' ' '\\ ' | xargs open"

go () {
    # open "http://google.com/search?q=$1+$2+$3"
    open "http://google.com/search?q=$(echo \"$@\" | sd ' ' '+' | sd '"' '')"
    # open "http://google.com/search?q=${search}"
}

Alias () {
    # $(alias | fzf | col | gcut -s -f 1 -d $'=' | sd ' ' '')
    alias | fzf | col | gcut -s -f 1 -d '=' | sd ' ' ''

}
alias findFiles="fd --type file  |  fzf --margin 5% --padding 5% --border --preview 'bat {}' --color bg:#222222,preview-bg:#333333"
alias findA="fd --type file  |  fzf --margin 5% --padding 5% --border --preview 'bat {}' --color bg:#222222,preview-bg:#333333 --bind 'S:preview:cat {} | /Users/dominikocsofszki/Uni/univim/bin/imgcat.sh' --bind 'Q:preview: cat {} |  /Users/dominikocsofszki/Uni/univim/bin/imgcat.sh | cat'"
alias browse="fd | fzf --preview 'bat {}' --bind '0:preview:open {}' --bind 'enter:execute(nvim {})'"
alias fzfP="fzf --margin 5% --padding 5% --border --preview 'bat {}' --color bg:#222222,preview-bg:#333333"
alias fzfP="fzf --margin 1% --padding 5% --border --preview 'bat {}' --color bg:#222222,preview-bg:#333333"

alias xx="ls -a |fzf -q '.sh$' --height=~5% --border=bold --preview 'cat {}' --bind '?:preview(ls {})' --border-label='  ctrl-c:quit    ' --bind '~:execute(zsh {})'"
alias X=' echo "enter for execution"; zsh $(xx); echo "executed"'
alias sA="alias | nvim -R  -"
alias Ali="alias | fzf | col  | gcut -s -f 2- -d '=' | sd ' ' ''|xargs echo"
alias Ali="alias | fzf  | gcut  -f 2- -d '=' | cat  " 
alias fAli="Ali | gcut -c 1- | rev"


alias showdownloads='ls $HOME/Downloads/| fzf --preview "cat $HOME/Downloads/{}"'
alias ali="Ali | xargs | zsh "

# myupdate () {
#         echo 'updating /.cache/MY/my_cache.mycache'
#         MY=$HOME/.cache/MY/my_cache.mycache
#         echo "\$MY: $MY"
#         echo "exporting \$MY"
#         fd '\.my$' $HOME > $MY
#         export MY
#         echo "found files:"
#         cat $MY
#         date +%s > $1
#         myopen
# }
#
# myopen () {
#     cat $MY | xargs cat| fzf | xargs open
# }
# my () {
#     maxDif=$((3*60*60))
# lastupdated=$HOME/.cache/MY/lastupdated.mycache
# last=$(cat $lastupdated)
# todate=$(date +%s)
# dif=$(($todate - $last))
# echo " time since last update: $dif / $maxDif to update now, call: myupdate"
# if [ $dif -ge $maxDif ];
# then
#     echo 'updating:'
#     myupdate $lastupdated
# else
#     myopen
# fi
# }
#
linksFrom () {
cat $1 | grep -o 'href="[^"]*"' | grep -o '"[^"]*"' | grep http | gcut -d '"' -f 2
}

allLinksFrom () {

for  arg in $* 
do
    # print $arg
    linksFrom $arg
done

}

openAllEntries () {

# cat DELETEME | while IFS= read -r filename; do open "$filename"; done
cat $1 | while IFS= read -r filename; do open "$filename"; done
}



alias  cphere='cp $HOME/Downloads/"$(ls $HOME/Downloads/| fzf)" $(pwd)'  
