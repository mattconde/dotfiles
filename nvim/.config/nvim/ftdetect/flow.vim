au BufNewFile,BufRead *.js if getline(1) =~ '//\s*@flow' | set filetype=flowtype | endif

