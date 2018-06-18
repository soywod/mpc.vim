syntax region MPCArtist start=/\%1c/  end=/\%20c/
syntax region MPCTitle  start=/\%21c/ end=/\%80c/

syntax match MPCSeparator /|/
syntax match MPCHead /.*\%1l/ contains=MPCSeparator

highlight default link MPCArtist    Identifier
highlight default link MPCTitle     String
highlight default link MPCSeparator VertSplit

highlight MPCHead term=bold,underline cterm=bold,underline

