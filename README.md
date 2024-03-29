# neovimrc

My personal Neovim configuration focusing on Rust development.

## Plugins used

- cellular-automaton - _just for fun_
- colorscheme - _contains installed colorschemes, and sets a default one._
- format-on-save
- harpoon - _for jumping between files_
- lsp - _handles all LSP related setup_
- nvim-tree - _an alternative to the netrw directory experience_
- rustaceanvim - _automagical setup and conf for Rust development_
- telescope - _great fuzzy finder_
- treesitter - _for parsing syntax_
- undotree - _undo history tool_
- vim-be-good - _a handful of educational games for practicing vim motions_
- vim-fugitive - _Git integration_

## Tips and tricks

Make your neovim config more accessible in bash using a `.bashrc` alias: 

```bash
alias vc="nvim ~/.config/nvim"
```

or in PowerShell by editing the $profile file:

```powershell
function configureNvim {
    nvim C:\Users\nilsi\AppData\Local\nvim
}

Set-Alias v nvim
Set-Alias vc configureNvim
```



## Gotchas

TODO...
