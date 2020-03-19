# NZT

This Vim plugin intends to improve personal experience with [Zettelkasten](https://zettelkasten.de/) approach for notekeeping.

Here's the list of articles which might be helpful in researching Zettelkasten:

* https://www.seanlawson.net/2018/02/use-zettelkasten-method-scientific-note-taking/
* https://trms.me/some-thoughts-on-how-to-keep-a-zettelkasten/

## Usage

In order to use the plugin you would need to create `~/zettelkasten/` directory at your `$HOME`. Lame, I know. I'm working on it.

`:Nzt %zettel-name%` command creates new zettel within `~/zettelkasten/` directory. New zettel is a markdown file with timestamp in it's name, which allows to sort zettels chronologically if needed. Example:

```vim
" creates new file: '~/zettelkasten/202003202320-zettel-example.md'
:Nzt zettel-example
```

`:NztRefer` allows to include links to other zettels (which is one of the core concepts of Zettelkasten). Calling `:NztRefer` will invoke `fzf` search, resulting in chosen file to be inserted at cursor position in the current zettel. To navigate to newly created link you can use `gf` in normal mode. To return to the previous buffer – `<C-o>`.

## Setup

This project is not suited for standalone use in it's current state, thus I will describe my personal approach to handle Zettelkasten with support of this plugin and other tools.

### Tools and Dependencies

[Ag](https://github.com/ggreer/the_silver_searcher) is used to search through the Zettelkasten. Vim support for `Ag` is provided via [fzf.vim](https://github.com/junegunn/fzf.vim). Search for `#language` tag occurance (vim command):

```vim
:Ag #language
```

Note: you have to install `Ag` separately in order to use `:Ag [PATTERN]` vim command. `fzf` does not install `Ag`.

---

[Pandoc](https://pandoc.org/MANUAL.html) is used to convert markdown to PDF and render KaTeX during the process. Example:

```bash
pandoc --from=markdown --to=pdf -o result.pdf README.md
```

---

[markdown-preview](https://github.com/iamcco/markdown-preview.nvim) is used to preview notes synchronously. This is a great plugin, it includes [KaTeX](https://katex.org/) renderer out of the box, thus allowing to inject TeX to the notes and render it with ease.

