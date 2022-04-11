
" Go to diff for files from diff for dirs output. Acronym to DoDiff.
" - Filter out items starting with '-' on current line.
" - On current line, look for 'diff ' or 'Only in ...' and start a side-by-side
"   diff.
command -nargs=0 DD exec
      \ substitute(
      \  join(filter(split(getline(line("."))), 'v:val !~ "^-"')),
      \  '\v\C^(diff (left/.+) (right/.+))|(Only in (left.*|right.*): (.*))|(.*)$',
      \  '\='
      \   .'len(submatch(1)) ? "tabnew ".submatch(3)." '
      \   .'| vertical leftabove diffsplit ".submatch(2)." '
      \   .'| nmap <buffer> q :bd<CR>:bd<CR>'
      \   .'| wincmd l '
      \   .'| nmap <buffer> q :bd<CR>:bd<CR>'
      \   .'| echon \"Close current tab with q\"" '
      \   .': '
      \   .'len(submatch(4)) ? "tabnew ".submatch(5)."/".submatch(6)." '
      \   .'| nmap <buffer> q :bd<CR>'
      \   .'| echon \"Close current tab with q\"" '
      \   .': '
      \   .'"echo \"Not a diff command under cursor or could not find file\""',
      \  ''
      \ )

" Side-by-side diff in a new tab.
nmap <buffer> <leader>d :DD<CR>

" Next change
nmap <buffer> ]c :echo search("^diff")<CR>
nmap <buffer> [c :echo search("^diff", "b")<CR>

" Next section
nmap <buffer> ]] :echo search("^diff")<CR>
nmap <buffer> [[ :echo search("^diff", "b")<CR>

" Next paragraph
nmap <buffer> } :echo search('\v^diff\|^[@0-9]')<CR>
nmap <buffer> { :echo search('\v^diff\|^[@0-9]', "b")<CR>

setlocal foldmethod=syntax
set diffopt+=algorithm:histogram,followwrap
