" Run with ith Input File
function! RunFile(f1)
  execute "AsyncRun -mode=term -pos=right -focus=0 -cols=45 ./%:r < %:r_" . string(a:f1 - 48) . ".in"
endfunction

" Run with ith Input File and Output File
function! OutputFile(f1)
  execute "AsyncRun -mode=term -pos=right -focus=0 -cols=45 ./%:r < %:r_" . string(a:f1 - 48) .".in  > %:r_" . string(a:f1 - 48) . ".out"
endfunction

" Open ith Input File
function! OpenInput(f1)
  execute "15sp %:r_" . string(a:f1 - 48) . ".in"
endfunction

" Open ith Output File 
function! OpenOutput(f1)
  execute "15sp %:r_" . string(a:f1 - 48) .".out"
endfunction

"Remove Hidden Buffers
if !exists("*DeleteHiddenBuffers") " Clear all hidden buffers when running 
	function DeleteHiddenBuffers() " Vim with the 'hidden' option
		let tpbl=[]
		call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
		for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
			silent execute 'bwipeout!' buf
		endfor
	endfunction
endif
command! DeleteHiddenBuffers call DeleteHiddenBuffers()

autocmd filetype cpp nnoremap <silent> <leader>i :call OpenInput(getchar())<CR>
autocmd filetype cpp nnoremap <silent> <leader>m :call OutputFile(getchar())<CR>
autocmd filetype cpp nnoremap <silent> <leader>o :call OpenOutput(getchar())<CR>
autocmd filetype cpp nnoremap <silent> <leader>r :call RunFile(getchar())<CR>
autocmd filetype cpp nnoremap <silent> <leader>t :AsyncRun -post=DeleteHiddenBuffers -mode=term -pos=right -focus=0 -cols=45 samplerunner.sh %:r<CR>
autocmd filetype cpp nnoremap <silent> <leader>s :AsyncRun -post=DeleteHiddenBuffers -mode=term -pos=right -focus=0 -cols=45 samplerunner.sh %:r val<CR>

" Make ith Input File
autocmd filetype cpp nnoremap <silent> <A-0> :15sp %:r_0.in<CR>
autocmd filetype cpp nnoremap <silent> <A-1> :15sp %:r_1.in<bar>:%d<bar>:normal "+gP<CR><bar>:wq<CR>
autocmd filetype cpp nnoremap <silent> <A-2> :15sp %:r_2.in<bar>:%d<bar>:normal "+gP<CR><bar>:wq<CR>
autocmd filetype cpp nnoremap <silent> <A-3> :15sp %:r_3.in<bar>:%d<bar>:normal "+gP<CR><bar>:wq<CR>
autocmd filetype cpp nnoremap <silent> <A-4> :15sp %:r_4.in<bar>:%d<bar>:normal "+gP<CR><bar>:wq<CR>
autocmd filetype cpp nnoremap <silent> <A-5> :15sp %:r_5.in<bar>:%d<bar>:normal "+gP<CR><bar>:wq<CR>
autocmd filetype cpp nnoremap <silent> <A-6> :15sp %:r_6.in<bar>:%d<bar>:normal "+gP<CR><bar>:wq<CR>
autocmd filetype cpp nnoremap <silent> <A-7> :15sp %:r_7.in<bar>:%d<bar>:normal "+gP<CR><bar>:wq<CR>
autocmd filetype cpp nnoremap <silent> <A-8> :15sp %:r_8.in<bar>:%d<bar>:normal "+gP<CR><bar>:wq<CR>
autocmd filetype cpp nnoremap <silent> <A-9> :15sp %:r_9.in<bar>:%d<bar>:normal "+gP<CR><bar>:wq<CR>

" Compile
autocmd filetype cpp nnoremap <F3> :w <bar> 
      \ AsyncRun -mode=term -pos=right -focus=0 -cols=45 
      \ g++ -Wall -Wextra -std=c++17 -O2 % -o %:r<CR>

autocmd filetype cpp nnoremap <F4> :w <bar> 
      \ AsyncRun -post=DeleteHiddenBuffers -mode=term -pos=right -focus=0 -cols=45 
      \ g++ -Wall -Wextra -Wshadow -Wfloat-equal -Wlogical-op -Wduplicated-cond -Wshift-overflow=2 -DGLOCAL -std=c++17 -D_GLIBCXX_ASSERTIONS 
      \ -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -O2 % -o %:r<CR><CR>

autocmd filetype cpp nnoremap <F5> :w <bar> 
      \ AsyncRun -post=DeleteHiddenBuffers -mode=term -pos=right -focus=0 -cols=45 
      \ g++ -Wall -Wextra -Wshadow -Wfloat-equal -Wlogical-op -Wduplicated-cond -Wshift-overflow=2 -DGLOCAL -std=c++17 -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fsanitize=address -fsanitize=undefined -fno-sanitize-recover
      \ -O2 % -o %:r<CR><CR>

autocmd filetype cpp nnoremap <F6> :w <bar> AsyncRun gnome-terminal --window-with-profile=Output -- ./%:r<CR>
autocmd filetype cpp nnoremap <F7> :w <bar> AsyncRun -post=DeleteHiddenBuffers -mode=term -pos=right -focus=0 -cols=45 ./%:r < 

autocmd filetype cpp imap <F3> <ESC><F3>
autocmd filetype cpp imap <F4> <ESC><F4>
autocmd filetype cpp imap <F5> <ESC><F5>
autocmd filetype cpp imap <F6> <ESC><F6>
autocmd filetype cpp imap <F7> <ESC><F7>
