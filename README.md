# vimfiles


## PURPOSE

vim 環境を、Linux/Cygwin/Windows で共有します。

下記を前提としています。
 - Linux および Cygwin はコンソール版の vim を利用する
 - Windows は [KaoriYa](http://www.kaoriya.net/software/vim) さんの gvim (GUI版) を利用する

## INSTALL

### For Linux(vim)
      $ cd
      $ git clone git://github.com/casagrande24/vimfiles.git .vim
      $ cp .vim/sample/.vimrc .

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

