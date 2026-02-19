If you are using this rc file over ssh and want yank to copy to clipboard, add this

```bash
Plug 'ojroques/vim-oscyank', {'branch': 'main'}


" <leader>c will copy to local system clipboard via OSC52
nmap <leader>c <Plug>OSCYankOperator
nmap <leader>cc <leader>c_
vmap <leader>c <Plug>OSCYankVisual
```

After opening vim, run

```bash
:PlugInstall

:CocInstall coc-pyright    " Python (your main lang)
:CocInstall coc-json coc-html coc-css    " Web dev
:CocInstall coc-clangd    " C/C++ (for your GPU/kernel work)
```

Then open the config using 

```bash
:CocConfig
```

And add this

```json
{
    "inlayHint.enable": false
}
```
