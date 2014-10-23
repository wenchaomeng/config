"set tags=/vagrant/Dengine/tags,/usr/src/linux-source-3.11.0/tags
set ts=4
set cindent
set hlsearch
set nu
set autochdir

"CSCOPE
cs add /vagrant/Dengine/cscope.out /vagrant/Dengine/
"cs add /usr/src/linux-source-3.11.0/cscope.out /usr/src/linux-source-3.11.0/

"
set completeopt=longest,menu
filetype plugin indent on

"super tab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"fold
set foldmethod=syntax
set foldlevel=100  " 启动vim时不要自动折叠代码

"禁止自动改变当前Vim窗口的大小 
let Tlist_Inc_Winwidth=0 
"把方法列表放在屏幕的右侧 
let Tlist_Use_Right_Window=1 
"让当前不被编辑的文件的方法列表自动折叠起来， 这样可以节约一些屏幕空间 
let Tlist_File_Fold_Auto_Close=1

"映射F3为功能键调出winmanager的文件浏览器 
"映射双击F3调出Taglist的符号浏览器 
"let g:winManagerWindowLayout = 'FileExplorer,BufExplorer|TagList'
let g:winManagerWindowLayout = 'FileExplorer,BufExplorer'
"let g:winManagerWidth = 30
"let g:defaultExplorer = 0
map <F3> :WMToggle<cr> 
map <F3><F3> :TlistToggle<cr> 
"将系统已经生成的tags导入 
"

map <F5> :!gcc % && ./a.out<cr>
