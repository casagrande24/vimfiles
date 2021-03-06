# vimfiles


## PURPOSE

vim 環境を、Linux/Mac/Cygwin/Windows で共有します。

下記を前提としています。
 - Linux, Mac および Cygwin はコンソール版の vim を利用する
 - Windows は [KaoriYa](http://www.kaoriya.net/software/vim) さんの gvim (GUI版) を利用する
 - git がインストールしてある

## INSTALL

### For Linux(vim)
      $ cd
      $ git clone git://github.com/casagrande24/vimfiles.git .vim
      $ cp .vim/sample/.vimrc .

      $ cd .vim
      $ git submodule init
      $ git submodule update


### For Cygwin(vim) and Windows(gvim)
      $ cd <HOME on Windows>
      $ git clone git://github.com/casagrande24/vimfiles.git

      $ cp vimfiles/sample/_vimrc .
      $ cp vimfiles/sample/_gvimrc .

      $ cd vimfiles
      $ git submodule init
      $ git submodule update

      $ cd <HOME on Cygwin>
      $ ln -s <path to clone> .vim
      $ cp .vim/sample/.vimrc .

      create a temporary directory for undo
      $ cd /usr/local/var
      $ ln -s /cygdrive/c/Users/Default/AppData/Local/Temp tmp
