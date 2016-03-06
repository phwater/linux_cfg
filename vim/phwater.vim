" phwater's vimrc - <midsummereddy@gmail.com>
" Fork me on github : https://github.com/phwater/vimrc

" [ guifg, guibg, ctermfg, ctermbg, opts ]
" useful opts: bold, underline, reverse, italic

let g:airline#themes#phwater#palette = {}

let s:N1 = [ '#eeeeee' , '#005faf' , 255 ,  25 ]
let s:N2 = [ '#eeeeee' , '#444444' , 255 , 238 ]
let s:N3 = [ '#eeeeee' , '#1c1c1c' , 255 , 234 ]
let g:airline#themes#phwater#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#phwater#palette.normal_modified = {
      \ 'airline_c': [ '#eeeeee' , '#1c1c1c' , 255 , 234 , '' ],
      \ 'airline_x': [ '#eeeeee' , '#1c1c1c' , 255 , 234 , '' ],
      \ }

let s:I1 = [ '#eeeeee' , '#ff5f87' , 255 , 204 ]
let s:I2 = [ '#eeeeee' , '#444444' , 255 , 238 ]
let s:I3 = [ '#eeeeee' , '#1c1c1c' , 255 , 234 ]
let g:airline#themes#phwater#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#phwater#palette.insert_modified = g:airline#themes#phwater#palette.normal_modified
let g:airline#themes#phwater#palette.insert_paste = {
      \ 'airline_a': [ '#eeeeee' , '#af5fff' , 255 , 135 , '' ],
      \ 'airline_z': [ '#eeeeee' , '#af5fff' , 255 , 135 , '' ],
      \ }

let s:V1 = [ '#eeeeee' , '#00875f' , 255 ,  29 ]
let s:V2 = [ '#eeeeee' , '#444444' , 255 , 238 ]
let s:V3 = [ '#eeeeee' , '#1c1c1c' , 255 , 234 ]
let g:airline#themes#phwater#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#phwater#palette.visual_modified = g:airline#themes#phwater#palette.normal_modified

let s:R1 = [ '#eeeeee' , '#5f5fff' , 255 ,  63 ]
let s:R2 = [ '#eeeeee' , '#444444' , 255 , 238 ]
let s:R3 = [ '#eeeeee' , '#1c1c1c' , 255 , 234 ]
let g:airline#themes#phwater#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#phwater#palette.replace_modified = g:airline#themes#phwater#palette.normal_modified

let s:IA1 = [ '#767676' , '#1c1c1c' , 243 , 234 ]
let s:IA2 = [ '#767676' , '#262626' , 243 , 235 ]
let s:IA3 = [ '#767676' , '#303030' , 243 , 236 ]
let g:airline#themes#phwater#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#phwater#palette.inactive_modified = {
      \ 'airline_c': [ 'eeeeee' , ''        , 255 , ''  , '' ],
      \ }

let g:airline#themes#phwater#palette.accents = {
      \ 'red': [ '#ff0000' , '' , 160 , ''  ]
      \ }

