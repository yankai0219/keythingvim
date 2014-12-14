Desc:
    This is used to setup an vimrc file using vundle.
****   One Setup method ***************
    You can use the following steps to setup it.
        Step1: git clone this project
            $ git clone https://github.com/yankai0219/keythingvim.git
        Step2: enter into keythingvim directory
            $ cd keythingvim
        Step3: execute its automatically_build.sh
            $ sh automatically_build.sh
    Now you complete this setup.
****   Another Setup method ***************
    If you wanna easy method, you can copy the following line to one shell script, 
    and execute this shell scripte.

        # install.sh
        vimPath=/tmp/keythingvim
        git clone https://github.com/yankai0219/keythingvim.git $vimPath
        cd $vimPath
        sh automatically_build.sh

