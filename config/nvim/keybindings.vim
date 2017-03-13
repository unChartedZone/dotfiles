" #################### Custom Key bindings ##########################
"Sets neocomplete on and lets tab work for selecting suggestions
inoremap <expr><Tab>        pumvisible() ? "\<C-n>" : "\<Tab>"
"CtrlP Keybindings
nmap <C-n> :CtrlPTag<CR>
nmap <C-m> :CtrlPBufTagAll<CR>
nmap ∂ :CtrlPBufTagAll<CR>
nmap ¥ :CtrlP<CR>

"Nerdtree Keybinding(s)
" nmap <C-t> :NERDTreeToggle<CR>
nmap ∫ :NERDTreeToggle<CR>

"Tagbar settings
nmap <F8> :TagbarToggle<CR>

"Little shorcut to create pdf file from a latex file in vim
command C !pdflatex %
nmap <C-i> :C<CR>

"Shortcut command to stage whole repo while in vim
command A !git add .

"Remap escape key
inoremap <C-c> <esc>

" Lets me use shift enter to go to end of line, only works in iterm
inoremap ✠ <C-o>A

" ###################################################################
