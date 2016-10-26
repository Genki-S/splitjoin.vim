function! sj#java#SplitFunction()
  if getline('.') !~ '\w\+\s*(\([^,]*,\)\+.*)\(\w\|\s\)*{'
    return 0
  endif

  let indent_level = strchars(matchstr(getline('.'), '^\s*')) / &shiftwidth
  let [from, to] = sj#LocateBracesOnLine('(', ')')
  let items = sj#ParseJsonObjectBody(from + 1, to - 1)

  let indent_char = repeat((&expandtab ? ' ' : "\t"), &shiftwidth)
  let split_args = join(map(items, 'repeat(indent_char, indent_level + 2) . v:val'), ",\n")
  let body = '(' . "\n" . split_args . "\n" . repeat(indent_char, indent_level) . ')'
  " FIXME: Don't pollute z register
  call setreg('z', body, 'v')
  silent normal! Va("zp

  return 1
endfunction
