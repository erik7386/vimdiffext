# vimdiffext.vim

This vim plugin is based on vim script
[5309](https://www.vim.org/scripts/script.php?script_id=5309) by
[Yuriy Ershov](https://www.vim.org/account/profile.php?user_id=17533).

## Howto use

General command-line format:

```bash
diff -r -u <left_dir> <right_dir> | vim -R -
```

A folded read-only patch file is presented in vim which you may unfold and fold
again according to normal vim commands (e.i, `zo` and `zc`).
Two levels of folding is used

1. For each individual file section,
2. For each diff block within one file section.

If you want to open a side-by-side diff of a single file in a new vim tab, then
place the cursor on first line of that file section and press `<leader>d`. To
close the side-by-side diff press `q`.

## Key mappings

All key mappings set by this plugin script are local to buffer.

Dir view

```txt
<leader>d Open a side-by-side diff if cursor is on a line starting with "diff " or "Only in "
]]        Jump to next file section
[[        Jump to previous, or top line of current, file section
}         Jump to next file section or diff block
{         Jump to previous file section or diff block
```

Side-by-side file view

```txt
q         Close current tab
```

## Setup git to use vimdiffext as difftool

```bash
git config --global difftool.vimdiffext.cmd '[ -d "${LOCAL}" ] && cd "${LOCAL%/*/}" && diff -r -u left right | vim -R --not-a-term - || echo "Not a directory!"'
git config --global alias.dd difftool --tool vimdiffext --dir-diff
```

Now you can do a diff like

```txt
git dd [<ref> [<ref>]]
```

## Install

Install using your favorite package manager, or use Vim's built-in package
support:

```bash
mkdir -p ~/.vim/pack/erik7386/start
cd ~/.vim/pack/erik7386/start
git clone https://github.com/erik7386/vimdiffext.git
```

## License

Same license as the original script.
