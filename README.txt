                   BitNami JRubyStack Stack 1.7.5-0
                  =============================

1. OVERVIEW

The BitNami Project was created to help spread the adoption of freely
available, high quality, open source web applications. BitNami aims to make
it easier than ever to discover, download and install open source software
such as document and content management systems, wikis and blogging
software.

You can learn more about BitNami at http://bitnami.com

JRuby is a 100% Java implementation of the Ruby programming language. It is
Ruby for the JVM. JRuby provides a complete set of core "builtin" classes and
syntax for the Ruby language, as well as most of the Ruby Standard Libraries.

You can learn more about JRuby at http://www.jruby.org/

Ruby is a dynamic, open source programming language with a focus on simplicity 
and productivity. It has an elegant syntax that is natural to read and easy to 
write.

You can learn more about Ruby at http://www.ruby-lang.org

Ruby on Rails is a full-stack MVC framework for database-backed web applications 
that is optimized for programmer happiness and sustainable productivity. It lets 
you write beautiful code by favoring convention over configuration.

You can learn more about Ruby at http://www.rubyonrails.org

The BitNami JRubyStack is an installer that greatly simplifies the installation
of JRuby and its runtime dependencies. It includes ready-to-run versions of
JRuby, Rails, Java, Tomcat, MySQL and Subversion. JRubyStack is
distributed for free under the Apache 2.0 license and has been packaged using
BitRock's multiplatform installer.

You can learn more about BitNami Stacks at http://bitnami.com/stacks/

2. FEATURES

- Easy to Install

BitNami Stacks are built with one goal in mind: to make it as easy as
possible to install open source software. Our installers completely automate
the process of installing and configuring all of the software included in
each Stack, so you can have everything up and running in just a few clicks.

- Independent

BitNami Stacks are completely self-contained, and therefore do not interfere
with any software already installed on your system. For example, you can
upgrade your system's MySQL or Apache without fear of 'breaking' your
BitNami Stack.

- Integrated

By the time you click the 'finish' button on the installer, the whole stack
will be integrated, configured and ready to go. 

- Relocatable

BitNami Stacks can be installed in any directory. This allows you to have
multiple instances of the same stack, without them interfering with each other. 

3. COMPONENTS

BitNami JRubyStack ships with the following:

  - JRuby 1.7.5
  - Rails 3.2.14
  - Warbler gem 1.3.2
  - Apache Tomcat 7.0.42
  - Subversion 1.8.3
  - SQLite 3.7.15.1
  - MySQL 5.5.32
 
On Linux and Windows the stack bundles JDK 1.7.0_40.
On OS X, it is required that you have Java 1.6 or later installed in 
your system. It can be downloaded from 
http://www.apple.com/macosx/features/java/

4. REQUIREMENTS

To install BitNami JRubyStack you will need:

    - Intel x86 or compatible processor
    - Minimum of 512 MB RAM 
    - Minimum of 150 MB hard drive space
    - TCP/IP protocol support
    - Compatible operantig systems:
      - An x86 or x64 Linux operating system.
      - A Windows operating system such as Windows 2000, XP, Vista, 7, 
      Windows Server 2008 or Windows Server 2003.
      - An OS X operating system.


5. INSTALLATION

The BitNami JRubyStack is distributed as a binary executable installer.
It can be downloaded from:

http://bitnami.com/stacks/

The downloaded file will be named something similar to:

bitnami-jrubystack-1.7.5-0-windows-installer.exe on Windows or
bitnami-jrubystack-1.7.5-0-linux-installer.run on Linux or 
bitnami-jrubystack-1.7.5-0-linux-x64-installer.run on Linux 64 bit or 
bitnami-jrubystack-1.7.5-0-osx-x86-nojdk-installer.dmg on OS X x86.

Double click the file and follow the on-screen instructions.

If you receive an error message during installation, please refer to
the Troubleshooting section.

5. STARTING AND STOPPING BITNAMI JRUBYSTACK

You can start and stop BitNami JRubyStack on Windows using the shortcuts created
in the Start Menu, under Programs -> BitNami -> BitNami Service on Windows.

To start/stop/restart application on Linux or OS X you can use the ctlscript.sh
utility:

       ./ctlscript.sh (start|stop|restart)
       ./ctlscript.sh (start|stop|restart) mysql
       ./ctlscript.sh (start|stop|restart) tomcat
       ./ctlscript.sh (start|stop|restart) subversion

  start      - start the service(s)
  stop       - stop  the service(s)
  restart    - restart or start the service(s)


 
6. DIRECTORY STRUCTURE

The installation process will create several subfolders under the main
installation directory:

	apache-tomcat/: Apache Tomcat Web server.
	img/: Additional image files.
	java/: Java SE Development Kit.
	jruby/: JRuby and RubyGems. 
	license/: License files.
	mysql/: MySQL Database.
	subversion/: Subversion revision control system.
	scripts/: Simple scripts for launching rails applications.
	sqlite/: SQLite files.

8. TROUBLESHOOTING

This version of the BitNami JRubyStack is a preview version, and as
such, may contain a number of bugs and be a little bit rough around the
edges. We are working on the next release, which will contain several
improvements along with expanded documentation. In addition to the resources
provided below, we encourage you to post your questions and suggestions at:

http://community.bitnami.com/

We also encourage you to sign up for our newsletter, which we'll use to
announce new releases and new stacks. To do so, just register at:
http://bitnami.com/newsletter.  

8.1 Installer

# Installer Payload Error 

If you get the following error while trying to run the installer from the
command line:

"Installer payload initialization failed. This is likely due to an
incomplete or corrupt downloaded file" 

The installer binary is not complete, likely because the file was
not downloaded correctly. You will need to download the file and
repeat the installation process. 

8.2 MySQL

The following are some common problems: 

# Access denied when trying to connect to MySQL. 

If you get an Access Denied message while trying to connect to
MySQL, make sure you are using the correct username and password. 

# "Can't connect to server" message. 

Make sure that the MySQL daemon is up and running. Remember also that if
during installation you selected a different listening port for MySQL, you
may need to pass that as an extra command line option.

For help in troubleshooting MySQL errors, you may want to reference the
"Problems and Common Errors" section of the MySQL manual, which you will
find at http://dev.mysql.com/doc/

8.3 Apache Tomcat

If you find any problem starting Apache Tomcat, the first place you
should look at is the error log file that will be created at
roller-1.7.5-0/apache-tomcat/logs/catalina.out. There you will
likely find useful information to determine what the problem is. For issues
not covered in this Quick Start guide, please refer to the BitNami forums
and to the Apache Tomcat documentation, which is located at
http://tomcat.apache.org/tomcat-5.5-doc/index.html.

8.4 JRuby

For any problem related to JRuby, please visit
http://wiki.jruby.org/

9. LICENSES

Apache Tomcat is distributed under the Apache License v2.0, which
is located at http://www.apache.org/licenses/LICENSE-2.0

MySQL is distributed under the GNU General Public License v2, which is
located at http://www.gnu.org/licenses/old-licenses/gpl-2.0.html

JRuby is released under a tri CPL/GPL/LGPL license. You can use it,
redistribute it and/or modify it under the terms of the:
CPL - see jruby/COPYING.CPL file
GPL - see jruby/COPYING.GPL file 
GPL - see jruby/COPYING.LGPL file

Java and related libraries are distributed under the Common Development 
and Distribution License (CDDL), Version 1.0 and the Sun Microsystems, Inc. 
("Sun") Software License Agreement, wich are located at
http://java.sun.com/j2se/1.5.0/docs/relnotes/license.html

Ruby is released under the Ruby License and GPL, wich is located at
http://www.ruby-lang.org/en/LICENSE.txt

Rails is released under the MIT license, which is located 
http://www.opensource.org/licenses/mit-license.php

Subversion is released under Subversion License / released under the 
terms of the Apache License, which is located at
http://subversion.tigris.org/license-1.html

RubyGems is released under the Ruby License, which is located at
http://www.ruby-lang.org/en/LICENSE.txt

Rake is released under the Ruby License, which is located at
http://www.ruby-lang.org/en/LICENSE.txt

SQLite is released under the Public Domain license, which is located at
http://en.wikipedia.org/wiki/Public_Domain

OpenSSL is released under the terms of the Apache License, which is
located at http://www.openssl.org/source/license.html

Zlib is released under the zlib License (a free software license/compatible 
with GPL), which is located at http://www.gzip.org/zlib/zlib_license.html

Libiconv is released under the LGPL license, which is located at
http://www.gnu.org/licenses/lgpl.html

