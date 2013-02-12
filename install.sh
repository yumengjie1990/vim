echo "Step1: Build vim from source"
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
cd ~/software
hg clone https://code.google.com/p/vim/
cd vim
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-perlinterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim73
sudo make install

echo "Step2: Install vundle"
cd ~
mkdir .vim/bundle/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Step3: Get vimrc from git"
git clone https://github.com/yumengjie1990/vim.git ~/vim_yumengjie1990/
ln -s ~/vim_yumengjie1990/vimrc ~/.vimrc
vim -c "BundleInstall|q|q" .vimrc

echo "Step4: Get clang binaries"
cd ~/software 
tar -xvf clang+llvm-3.2-x86-linux-ubuntu-12.04.tar.gz
mkdir ycm_build

echo "Step5: Build YCM"
sudo apt-get install cmake
cd ~/software/ycm_build
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/software/clang+llvm-3.2-x86-linux-ubuntu-12.04 . ~/.vim/bundle/YouCompleteMe/cpp
make ycm_core
cp ~/software/clang+llvm-3.2-x86-linux-ubuntu-12.04/lib/libclang.so ~/.vim/bundle/YouCompleteMe/python

echo "Step6: Install Command-T"
cd ~/.vim/bundle/Command-T/ruby/command-t/
ruby extconf.rb
make

echo "Step7: Get powerline fonts"
cd ~
mkdir .fonts
cd ~/.vim/bundle/powerline/font/
./fontpatcher.py ~/.vim/bundle/powerline-fonts/DejaVuSansMono/DejaVuSansMono.ttf
cp ~/.vim/bundle/powerline-fonts/*/*.otf ~/.fonts/
fc-cache -vf ~/.fonts
