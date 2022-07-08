syntax on

set expandtab
set hlsearch
set ignorecase smartcase
set laststatus=2
set linebreak
set list
set listchars=tab:>-,trail:-
set nowrap
set nowrapscan
set number
set patchmode=.orig
set ruler
set shiftwidth=4
set showcmd
set showtabline=2
set tabline=%!MyTabLine()
set tabstop=4
set title
set wildmenu

if has('mouse')
  set mouse=nv
endif

" 全角スペースと不要な半角スペースをハイライトさせる
augroup HighlightSpaces
    autocmd!
    " ハイライトカラーを設定
    autocmd VimEnter,WinEnter,ColorScheme * highlight Spaces ctermbg=Red
    " 全角スペースと不要な半角スペースを正規表現で定義
    autocmd VimEnter,WinEnter * match Spaces /\(　\|\s\+$\)/
augroup END

" カレントタブをハイライト
hi TabLineSel ctermbg=2

function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " ラベルは MyTabLabel() で作成する
        let my_tab_label = '%{MyTabLabel(' . (i + 1) . ')}'
        " 強調表示グループの選択
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " タブ番号 : [ファイル名] のフォーマットになるように設定
        let s .= (i + 1) . ':[' . my_tab_label .'] '
    endfor

    " 最後のタブページの後は TabLineFill で埋め、タブページ番号をリセットする
    let s .= '%#TabLineFill#%T'

    return s
endfunction

function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return fnamemodify(bufname(buflist[winnr - 1]), ":t")
endfunction

""" [Start] ステータスラインに表示する内容の設定
set statusline=%F  "ファイル名表示
set statusline+=%m "変更チェック表示
set statusline+=%r "読み込み専用かどうか表示
set statusline+=%h "ヘルプページなら[HELP]と表示
set statusline+=%w "プレビューウインドウなら[Prevew]と表示
set statusline+=%= "これ以降は右寄せ表示
set statusline+=[Encode=%{&fileencoding}] "encode type
set statusline+=[Format=%{&fileformat}]   "改行コード
set statusline+=[Line=%l/%L] "現在行数/全行数
set statusline+=[Col=%c]     "列番号
""" [End] ステータスラインに表示する内容の設定
