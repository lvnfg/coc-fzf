" test other plugins availability

if exists('g:fzf_preview_window') && !len(g:fzf_preview_window)
  let g:coc_fzf_preview_available = 0
else
  let g:coc_fzf_preview_available = 1
  try
    call fzf#vim#with_preview()
  catch
    let g:coc_fzf_preview_available = 0
  endtry
endif

augroup CocFzfLocation
  autocmd!
  let g:coc_enable_locationlist = 0
  autocmd User CocLocationsChange nested call coc_fzf#location#fzf_run()
augroup END
