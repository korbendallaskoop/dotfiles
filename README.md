# dotfiles

Bare git repo as shown by Derek DistroTube https://www.youtube.com/watch?v=tBoLDpTWVOM

>Using git bare repositories, there is no more moving files into an initialized git repository and then creating symlinks.  Now, I just add, commit and then push.

### barely
> You can push to and fetch from development and bare repositories equally...
>...git push command does not check out files in the receiving repository. It simply transfers objects from the source repository to the receiving repository and then updates the corresponding refs on the receiving end.
> In a bare repository, this behavior is all that can be expected, because there is no working directory that might be updated by checked-out files.
https://www.oreilly.com/library/view/version-control-with/9780596158187/ch11s07.html

Method sourced from https://news.ycombinator.com/item?id=11071754 and guide blogged by https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo, my notes below are based on that.

I'm using two bare repos atm with one of them private for private dots. It's working fine and has been a good git exercise but tools like https://yadm.io are probably simpler and better for this purpose and includes features like alternate files for diff. OS and GPG encryption. Was recommended by a DistroTube viewer, others mentioned that:
- drawback of method is no access to `diff` of dotfiles locally. Only possible after commit and push to remote
- gitignore every file with "*" and then use git add -f <file> with each tracked file. Undo ignored file or directory in .gitignore by starting the line with a '!'. fx for .config add after '*':
- Use GNU stow. It's like a package manager for symlinks. stow -t ~ /path/to/dotfiles and you're done - with none of that painful setup or aliases. It does smart things with folding symlinks and also makes it easy to uninstall. The killer feature for me is that you can split up your dotfiles into modules (e.g. bash, vim, etc.) and only install the dotfiles for the module you want. That's really good if you share your dotfiles on Github since people can easily pick and choose which dotfiles they want to install.﻿

## bare with me

The bare repo is empty on the local disk. Any file within its $HOME work-tree can be added to it. All added files are pushed to the remote.

init a git bare repo folder to track the backup files

	git init --bare $HOME/.cfg_bckp

create an alias to use instead of the regular git to interact with repo

	alias cfg='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME'

hide untracked files from cfg status and other commands

	cfg config --local status.showUntrackedFiles no

any file within the $HOME folder can be versioned with normal git commands, replacing git with the alias

	cfg status

	cfg add .bashrc
	cfg commit -m "added bashrc"

remove a file from repo with rm --cached

	cfg rm .bashrc --cached

or a folder with -r

	cfg rm .config/folder -r --cached

## push the bare

add remote branch before first push

  cfg remote add origin git@githu.com:korbendallaskoop/dotfiles

	cfg push --set-upstream origin master

	cfg add .anotherfile
	cfg commit -m "on it goes"

## rebarable

git dem dots a new home  

		sudo apt install git
		sudo eopkg install git

download dotfiles and just copy locally what's needed:

		    git clone https://github.com/korbendallaskoop/dotfiles

or rsync all of them to new $HOME by --separate-git-dir as https://github.com/Siilwyn/my-dotfiles/tree/master/.my-dotfiles

or git checkout all dotfiles and folder structure 1:1 from cloned bare repo to new $HOME:

		mkdir ~/.cfg_bckp

alias cfg git again and git up $HOME

    alias cfg='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME'

source repo to ignore the folder where it's cloned to avoid recursions:

    echo ".cfg_bckp" >> .gitignore

bare repo clone

    cfg clone --bare https://github.com/korbendallaskoop/dotfiles $HOME/.cfg_bckp

checkout actual content from the bare repo to new $HOME:

    cfg checkout

might fail with a message like:

    error: The following untracked working tree files would be overwritten by checkout:
          .bashrc
          .gitignore
      Please move or remove....

$HOME folder might already have config files which would be overwritten by git with -f

	cfg checkout -f

or move them to a backup folder:

	mkdir -p .config-backup && \
	cfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
	xargs -I{} mv {} .config-backup/{}

Re-run checkout

    cfg checkout

hide untracked files from cfg status and other commands

    cfg config --local status.showUntrackedFiles no

## bothwaysbare

To update the bare repo from the clone push to origin

	cfg push --set-upstream origin master

or create a new branch

done!

### What not to share in a public git repo

>Anything that is a security risk, like files in your .ssh/ folder....double-check before publishing them online and triple-check that no API tokens are in your files.
https://opensource.com/article/19/3/move-your-dotfiles-version-control

- gitconfig
- file paths with identifiable folder names, /myNextcloud_provider/my_username
- same for launcher and search index dbs
- IRC configs and logs

### Why not back by any other sync/cloud method?

>git index work-tree in $HOME path preserves filesystem hierarchy which makes restore and migration as simple as re-imaging by disk. Adding files to the index on the fly is trivial. Cloud services may have limits or obscure settings for small file sizes. Github can be SSH'd.

### bare borders

>We recommend repositories be kept under 1GB each.

>In addition, we place a strict limit of files exceeding 100 MB in size.

>Git is not adequately designed to serve as a backup tool.

And there's a 100MB max per file limit

https://help.github.com/en/articles/what-is-my-disk-quota#file-and-repository-size-limitations

### .bashrc aliases

	alias cfg='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME'

	# add a file or folder to repo:
	alias cfga='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME add'
	# or remove:
	alias cfgr='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME rm -r --cached'

	# stage and commit status:
	alias cfgs='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME status'
	# show textual staged edits to be committed and changes in the working tree that have not yet been staged:
	alias cfgsv='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME status -v -v'
	# list all repo'd files:
	alias cfgl='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME ls-tree -tr --name-only --full-name --full-tree master'
	# add -d to list folders only
	# list all repo'd files and grep <string>
	alias cfgg='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME ls-tree -tr --name-only --full-name --full-tree master | grep'

	# commit
	alias cfgc='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME commit -a'
	# push
	alias cfgp='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME push'
