# My Personal NeoVim config

This is my personal development environment (PDE) for everyday use.

## Install

This config is installed by running one of the following commands in your terminal. You can install this via the command-line with either `curl` or `wget`.

### Via Curl

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/satrionugroho/nvim-config/main/bin/install.sh)"
```

### Via Curl

```bash
bash -c "$(wget https://raw.githubusercontent.com/satrionugroho/nvim-config/main/bin/install.sh -O -)"
```

This command remove current nvim config and replace with a new one.

## Keystroke

Available Keystroke

| Keystroke | Description                                         |
| --------- | --------------------------------------------------- |
| \g        | Show the nvim-tree                                  |
| \s        | Enter NeoGit panel                                  |
| \r        | Run the curl request when filetype is `\*.http`     |
| \tb       | Telescope search buffer                             |
| \tc       | Telescope search available commands in nvim         |
| \tg       | Telescope search git files                          |
| \tf       | Telescope find files based on filename              |
| \tl       | Telescope live grep mode search on cwd              |
| \ts       | Telescope grep string (string contains in files)    |
| \tt       | Telescope file browser                              |
| \<space>u | Unfold current buffer                               |
| \<space>f | Fold current buffer                                 |
| \<space>g | Preview git changes on current buffer               |
| gO        | Add blank line before current line (normal mode)    |
| go        | Add blank line below current line (normal mode)     |
| zm        | Fold text by adding fold level by 1                 |
| zr        | Unfold text by decreasing foldlevel by 1            |
