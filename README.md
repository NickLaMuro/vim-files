Vim Files
=========

This is a collection of custom files that I used for vim that aren't really
tied to any one plugin.  Feel free to use them for your own personal use and
modify them freely.

Colors
------

For a dark color scheme, I have really started to like twilight, but every
version of the twilight colorscheme I have found was just a bit off from what I
liked in textmate.  When I found twilight256 (included in the colors
directory), it was pretty close to textmate, and it also had one method for
inputing colors via a grey code function.  I combined that file with the
twilight-vim file, which had a bunch of filetype specific colors (also
included), and came up with `NVL_twilight` (yes, I tossed my initials on it, but
I figured it was the most unique modifier I could add).

I also took that same file and inverted the colors, so if I need to invert the
colors because I am starting at a white background for a extended period of
time, I could turn on that syntax, and still view vim normaly.

I also found a version of the mac classic colorscheme that I have converted to
grey code as well, which is nice if I am in a bright place and my glossy laptop
screem makes it hard to see.

**NOTE** These schemes do not work on all versions of vim (for some reason,
ubuntu plus tmux screws them up), so I will probably upload some other versions
that work well for terminal vim.

**EDIT** There is a fix if you are having trouble with tmux.  Add the following
to your .bashrc:

```bash
  [ -n "TMUX" ] && export TERM="screen-256color"
```

and this should fix the issue for you.

Snippets for SnipMate
---------------------

I like snipmate, and the extra plugins from scrooloose have been quite helpful,
but I have found that I prefer to have the files in a single .snippet file.

So I have done just that.

I have taken all of .snippet files and combined them into a single file for
each directory.  So when I forget a snippet, I just have to look in one file
(not 50) to figure out which one to use.  

The Scrooloose snipmate-snippets are also meant to overwrite the current
snipmate snippets (and there is no good way with pathogen to do that), so I
started to remove the duplicates that conflict with the default ones from
snipmate.
