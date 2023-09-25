==================
The Matem Buildout
==================

.. image:: https://travis-ci.org/starzel/buildout.svg?branch=master
    :target: https://travis-ci.org/starzel/buildout

This is a standard Plone-buildout base on  `Plone Simple Buildout <https://github.com/plone/simple-plone-buildout>`_ and `The Starzel Buildout <https://github.com/starzel/buildout>`_.

.. contents::


Quickstart
----------

.. code-block:: bash

    git clone https://github.com/imatem/plone-buildout SOME_PROJECT
    cd SOME_PROJECT

Remove all files that are not needed for a project but are only used for the buildout itself.

.. code-block:: bash

    rm -rf linkto README.rst .travis.yml CHANGES.rst

If you're not developing the buildout itself you want to create a new git repo.

.. code-block:: bash

    rm -rf .git && git init

Add a file that contains a passwort. Do **not** use ``admin`` as a password in production!

.. code-block:: bash

    echo -e "[buildout]\nlogin = admin\npassword = admin" > secret.cfg

Symlink to the file that best fits you local environment. At first that is usually development. Later you can use production or test. This buildout only uses ``local.cfg`` and ignores all ``profiles/local_*.cfg``.

.. code-block:: bash

    ln -s profiles/local_develop.cfg local.cfg

setup a virtual environment

.. code-block:: bash

    pyenv virtualenv 3.11.5 dev6
    pyenv local dev6

Build Plone

.. code-block:: bash

    pip install -r requirements.txt
    buildout

if buildout fails installing Pillow due to zlib error (Mac OS Ventura)

.. code-block:: bash

    export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"
    export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"

be carefull with homebrewpath

.. code-block:: bash
    
    export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

rerun buildout or install  with pip

.. code-block:: bash

    pip install Pillow==4.3.0
