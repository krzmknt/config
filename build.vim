command! Build call BuildFunc()
command! AccSubmit call AccSubmitFunc()

function! BuildFunc()
	let ext = expand("%:e")
	let filename = expand("%:r")
	let filefullpath = expand("%:p")

	"""""""""""""""""""""""""
	" acc
	"""""""""""""""""""""""""
	if expand("%:p") =~ "^/Users/krzmknt/Workspace/atcoder"
		echo acc
		call AccTestFunc()
		return
	endif

	"""""""""""""""""""""""""
	" Python
	"""""""""""""""""""""""""
	if ext == "py"
		echo system('python'.filefullpath)
		return
	endif

	"""""""""""""""""""""""""
	" C++
	"""""""""""""""""""""""""
	if ext == "cpp"
		echo system('g++ -o '.filename.' '.filefullpath.'&& ./'.filename)
		return
	endif

endfunction

function! AccTestFunc()
	!make --file="../../makefile"
	return
endfunction

function! AccSubmitFunc()
	!make --file="../../makefile" submit
	return
endfunction
