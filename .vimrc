"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Owner:	Tiny - http://www.tinyxd.me
" Modified: 2013-01-24 22:11:09

" set runtimepath=~/vim,$VIMRUNTIME
" source ~/vim/vimrc

" Get out of VI's compatible mode..
set backspace=2

"用浅色高亮当前行
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
"
set smartindent "智能对齐
"
set autoindent "自动对齐
"
set confirm "在处理未保存或只读文件的时候，弹出确认框
"
set tabstop=4 "tab键的宽度
set softtabstop=4
set shiftwidth=4 "统一缩进为4
set expandtab "不要用空格替代制表符
"
set number "显示行号
set history=50  "历史纪录数
set hlsearch
set incsearch "搜素高亮,搜索逐渐高亮

"""""""""""""""""""""""""""""""""""""""
"vimwiki设置
"""""""""""""""""""""""""""""""""""""""
map <S-F4> :VimwikiAll2HTML<cr>  
map <F4> :Vimwiki2HTML<cr> 

imap <C-l> <br/><CR>　　
" calendar  
map <C-F8> :Calendar<cr>  

" 打开语法高亮
syntax enable
syntax on

" 打开对文件类型插件的支持
filetype indent on
filetype plugin on
filetype plugin indent on

" 去掉有关vi的一致性模式，避免以前版本的一些bug和局限
set nocompatible

" ######### VimWiki 写作助手 ######### "
"
" 自动换行
" let g:vimwiki_list_ignore_newline = 0

" 使用鼠标映射
let g:vimwiki_use_mouse = 1

" 不要将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0

" 标记为完成的 checklist 项目会有特别的颜色  
let g:vimwiki_hl_cb_checked = 1  
    
" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义  
let g:vimwiki_menu = ''  
       
" 是否开启按语法折叠  会让文件比较慢  
let g:vimwiki_folding = 1  
          
" 是否在计算字串长度时用特别考虑中文字符  
let g:vimwiki_CJK_length = 1  

let g:vimwiki_list = [{
\ 'path': '~/vimwiki/',
   \ 'template_path': '~/.vim/autoload/vimwiki/',
    \ 'template_default': 'default',
    \ 'template_ext': '.tpl', 
\ 'path_html': '~/vimwiki/',
\ 'auto_export': 0,},
\{
\'path': '~/vimwiki',
   \ 'template_path': '~/.vim/autoload/vimwiki/',
    \ 'template_default': 'myindex',
    \ 'template_ext': '.tpl',
\ 'path_html': '~/vimwiki/',
\ 'auto_export': 0,}] 

