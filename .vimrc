syntax on

set expandtab
set hlsearch
set ignorecase smartcase
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

if has('mouse')
  set mouse=nv
endif

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