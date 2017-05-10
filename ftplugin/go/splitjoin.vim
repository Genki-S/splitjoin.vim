let b:splitjoin_split_callbacks = [
      \ 'sj#go#SplitImports',
      \ 'sj#go#SplitVars',
      \ 'sj#go#SplitStruct',
      \ 'sj#go#SplitFunc',
      \ ]

let b:splitjoin_join_callbacks = [
      \ 'sj#go#JoinImports',
      \ 'sj#go#JoinVars',
      \ 'sj#go#JoinStruct',
      \ 'sj#go#JoinFunc',
      \ ]
