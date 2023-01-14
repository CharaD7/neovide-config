<h1 align="center"> Neovide [The no-nonsense IDE] </h1>

This is my custom configuration for Neovide which comes with a nice ColorScheme from Raphael's beautiful [zephyr](https://github.com/glepnir/zephyr-nvim) theme. If you wish to customize Neovide even more, you can visit the [Neovide config page](https://neovide.dev/configuration.html) here, if you wish to install Neovide, you should visit the [Neovide homepage](https://neovide.dev/) to get a download for your preferred OS environment.

Installation may seem difficult sometimes so it is easier to follor the [step-by-step installation guide](https://neovide.dev/installation.html) to get things rolling.

<sub><i>This configuration is inspired by<a href="https://github.com/ChristianChiarulli" title="Christian Chiarulli: The builder of LunarVim, Zap and Node-Tech"> @Christian Chiarulli</a> </i> | Be sure to check him out, he is simply awesome!</sub>

---

**NB:** Because of the ColorScheme, my configs will look weird if you just want to use it on neovim, especially for the bufferline and comment highlights.

<details>
  <summary>The below is an example of what the config looks like on raw neovim.</summary>

  ![Screenshot from 2023-01-14 08-46-12](https://user-images.githubusercontent.com/9804780/212464072-26e8fc16-e3b4-4045-9dc5-f5d983937e4f.png)
</details>

<details>
  <summary>This is how it looks on Neovide.</summary>

  ![Screenshot from 2023-01-14 08-47-23](https://user-images.githubusercontent.com/9804780/212464125-c328d688-7106-4778-a7ae-2ab923212425.png)
</details>


## Important Notices

- Font used: [FiraCode iScript](https://github.com/kencrocken/FiraCodeiScript).
- Font ligatures and icons capability: [NerdFonts](https://github.com/ryanoasis/nerd-fonts).
- Plugin manager used: [Packer](https://github.com/wbthomason/packer.nvim).
- [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) version: v0.9.0-dev-176+g1fe31651b
- [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) Build Type: RelWithDebInfo
- LuaJit version: 2.1.0-beta3
- This config runs neovide in fullscreen mode.

## List of Plugins Used

Below is a list of the plugins used and their references (where you can find them on GitHub)
| Plugin Name                           | Author(s)                                    | Plugin Name and Repository                            |
|:--------------------------------------|:---------------------------------------------|:------------------------------------------------------|
| Packer                                | [Wil Thomason](https://github.com/wbthomason)  | [packer.nvim](https://github.com/wbthomason/packer.nvim) |
| Telescope                             | [TJ DeVries](https://github.com/tjdevries), [Simon Hauser](https://github.com/Conni2461), [Fabian David Schmidt](https://github.com/fdschmidt93), [Dicha Zelianivan Arkana](https://github.com/elianiva), [Raphael](https://github.com/glepnir), [kkharji](https://github.com/kkharji), [Dave Lage](https://github.com/rockerBOO) | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) |
| Popup                                 | [TJ DeVries](https://github.com/tjdevries)   | [popup.nvim](https://github.com/nvim-lua/popup.nvim)  |
| Plenary                               | [TJ DeVries](https://github.com/tjdevries)   | [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) |
| Zephyr                                | [Raphael](https://github.com/glepnir)        | [zephyr-nvim](https://github.com/glepnir/zephyr-nvim) |
| Treesitter                            | [Kiyan](https://github.com/kyazdani42), [ObserverOfTime](https://github.com/ObserverOfTime), [Santos Gallegos](https://github.com/stsewd), [Stephan Seitz](https://github.com/theHamsta), [Thomas Vigouroux](https://github.com/vigoux) | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| Treesitter TextObjects                | [Kiyan](https://github.com/kyazdani42), [ObserverOfTime](https://github.com/ObserverOfTime), [Santos Gallegos](https://github.com/stsewd), [Stephan Seitz](https://github.com/theHamsta), [Thomas Vigouroux](https://github.com/vigoux) | [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) |
| Treesitter Refactor                   | [Kiyan](https://github.com/kyazdani42), [ObserverOfTime](https://github.com/ObserverOfTime), [Santos Gallegos](https://github.com/stsewd), [Stephan Seitz](https://github.com/theHamsta), [Thomas Vigouroux](https://github.com/vigoux) | [nvim-treesitter-refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor) |
| Treesitter Context                    | [Kiyan](https://github.com/kyazdani42), [ObserverOfTime](https://github.com/ObserverOfTime), [Santos Gallegos](https://github.com/stsewd), [Stephan Seitz](https://github.com/theHamsta), [Thomas Vigouroux](https://github.com/vigoux) | [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) |
| Treesitter Commonlisp                 | [Stephan Seitz](https://github.com/theHamsta) | [nvim-treesitter-commonlisp](https://github.com/theHamsta/nvim-treesitter-commonlisp) |
| Treesitter Playground                 | [Kiyan](https://github.com/kyazdani42), [ObserverOfTime](https://github.com/ObserverOfTime), [Santos Gallegos](https://github.com/stsewd), [Stephan Seitz](https://github.com/theHamsta), [Thomas Vigouroux](https://github.com/vigoux) | [playground](https://github.com/nvim-treesitter/playground) |
| Undotree                              | [Ming, Bai](https://github.com/mbbill)         | [undotree](https://github.com/mbbill/undotree)         |
| Vim Reach                             | [Eric Lau](https://github.com/ericglau)        | [Vim/Neovim Reach](https://github.com/ericglau/vim-reach) |
| Dap UI                                | [Rónán Carrigan](https://github.com/rcarriga)  | [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) |
| FZF                                   | [Junegunn Choi](https://github.com/junegunn)   | [fzf](https://github.com/junegunn/fzf)                       |
| FD                                    | [David Peter](https://github.com/sharkdp)      | [fd](https://github.com/sharkdp/fd)                         |
| VPolyglot                             | [Adam Stankiewicz](https://github.com/sheerun) | [vim-polyglot](https://github.com/sheerun/vim-polyglot)       |
| Filetype                              | [Nathan Thomas](https://github.com/nathom)     | [filetype.nvim](https://github.com/nathom/filetype.nvim)      |
| Signify                               | [Marco Hinz](https://github.com/mhinz)         | [vim-signify](https://github.com/mhinz/vim-signify)          |
| Prettier                              | [Munif Tanjim](https://github.com/MunifTanjim)  | [prettier.nvim](https://github.com/MunifTanjim/prettier.nvim) |
| Code Runner                           | [Diego Aguilar](https://github.com/CRAG666)    | [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim) |
| Comment                               | [NumToStr](https://github.com/numToStr)         | [Comment.nvim](https://github.com/numToStr/Comment.nvim)       |
| Nvim Navic                            | [Smitesh Patil](https://github.com/SmiteshP)    | [nvim-navic](https://github.com/SmiteshP/nvim-navic)          |
| Vim Devicons                          | [Ryan L McIntyre](https://github.com/ryanoasis) | [vim-devicons](https://github.com/ryanoasis/vim-devicons)      |
| Bufferline                            | [Akin](https://github.com/akinsho)              | [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)  |
| NvimTree                              | [Alexander Courtis](https://github.com/alex-courtis), [Kiyan](https://github.com/kyazdani42) | [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) |
| Nvim WebDevicons                      | [Alexander Courtis](https://github.com/alex-courtis), [Kiyan](https://github.com/kyazdani42) | [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) |
| VS Code ES7+ React/Redux/React-Native/JS snippets | [ults-io](https://github.com/ults-io) | [vscode-react-javascript-snippets](https://github.com/ults-io/vscode-react-javascript-snippets) |
| Git Conflict                          | [Akin](https://github.com/akinsho)              | [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim) |
| Dashboard                             | [Raphael](https://github.com/glepnir)           | [dashboard.nvim](https://github.com/glepnir/dashboard-nvim)       |
| Auto-session                          | [Ronnie Magatti](https://github.com/rmagatti)   | [auto-session](https://github.com/rmagatti/auto-session)          |
| Session-lens                          | [Ronnie Magatti](https://github.com/rmagatti)   | [session-lens](https://github.com/rmagatti/session-lens)          |
| Gitsigns                              | [Lewis Russell](https://github.com/lewis6991)   | [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)       |
| Vim Repeat                            | [Tim Pope](https://github.com/tpope)           | [vim-repeat](https://github.com/tpope/vim-repeat)                 |
| Vim Teal                              | [euclidianAce](https://github.com/euclidianAce), [Hisham Muhammad](https://github.com/hishamhm), [Patrick Desaulniers](https://github.com/pdesaulniers) | [vim-teal](https://github.com/teal-language/vim-teal) |
| Vim Endwise                           | [Tim Pope](https://github.com/tpope)           | [vim-endwise](https://github.com/tpope/vim-endwise)               |
| Git Blame                             | [Arshak Aghakaryan](https://github.com/f-person) | [git-blame.nvim](https://github.com/f-person/git-blame.nvim)     |
| Vim matchup                           | [Andy Massimino](https://github.com/andymass)   | [vim-matchup](https://github.com/andymass/vim-matchup)            |
| Focus                                 | [Beau](https://github.com/beauwilliams)          | [focus.nvim](https://github.com/beauwilliams/focus.nvim)          |
| Scrollbar                             | [Xuyuan Pang](https://github.com/Xuyuanp)       | [scrollbar.nvim](https://github.com/Xuyuanp/scrollbar.nvim)       |
| Nvim Colorizer                        | [Ashkan Kiani](https://github.com/norcalli)      | [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) |
| 



---
