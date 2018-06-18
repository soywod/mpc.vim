let s:mpc = 'mpc'

if exists('g:mpc_host')
  let host = substitute(shellescape(g:mpc_host), "'", '"', 'g')
  let s:mpc .= ' --host=' . host
endif

if exists('g:mpc_port')
  let port = substitute(shellescape(g:mpc_port), "'", '"', 'g')
  let s:mpc .= ' --port=' . port
endif

if exists('g:mpc_password')
  let password = substitute(shellescape(g:mpc_password), "'", '"', 'g')
  let s:mpc .= ' --password=' . password
endif

function! mpc#Command(args)
  execute '!' . s:mpc . ' ' . a:args
endfunction

function! mpc#ShowPlaylist()
	let playlist = s:GetPlaylist()
  let header   = [s:DisplayLine(['Artist', 'Title'])]
  let tracks   = map(copy(playlist), 's:DisplayLine(v:val)')

  silent! bdelete Playlist
  silent! edit    Playlist

  call append(0, header + tracks)
  normal! ddgg

  setlocal filetype=mpc
endfunction

function! mpc#PlayByPosition(pos)
	call system(s:mpc . ' play ' . shellescape(a:pos))
endfunction

function! s:GetPlaylist()
	let cmd = s:mpc . ' --format "%artist%%title%" playlist'
	let playlist = map(systemlist(cmd), 'split(v:val, "")')

  return playlist
endfunction

function! s:DisplayLine(track)
  let [artist, title] = a:track
  let amaxlen = 20
  let tmaxlen = 61

  let artistlen = 1 + strdisplaywidth(artist[:amaxlen])
  let titlelen  = 1 + strdisplaywidth(title[:tmaxlen])

  let artiststr = artist[:amaxlen] . repeat(' ', amaxlen - artistlen) . '|'
  let titlestr  = title[:tmaxlen]  . repeat(' ', tmaxlen - titlelen)
  let trackstr  = artiststr . titlestr

  return trackstr
endfunction

