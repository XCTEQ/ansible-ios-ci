Ansible Provisioning of iOS Continuous Integration
=========

This role can be used to setup iOS Continuous Integration Service on macOS. This role should have all the tools required for the iOS Developers like fastlane, carthage, cocoapods and lot's of homebrew packages. Xcode installation is still manual but installing simulators and command line tools is covered by this role. This role is fully tested for

* macOS Seirra
* Xcode 8.3 beta xip

This should work from Xcode 8 onward as `xip` format is supported from Xcode 8 onwards.   

Requirements
------------

Downloading Xcode needs Apple Developer account and it's hard to automate Xcode Installation process. You need to have Xcode installed manually or for this playbook, you need to get XIP file and put it inside `~/Documents/` directory.

It's not ideal but Xcode is proprietary software so only requirement is to put `xcode.xip` it inside `~/Documents/` directory.

What's in this role:
--------------
This role comes with following softwares packages to provision iOS Continuous Integration Server.

* Homebrew
* Homebrew packages like git, carthage, cmake, rbenv, curl, wget etc etc
* Homebrew Cask package Java (Just in case )
* RVM and Preinstalled Ruby 2.4.0 (You can change version anytime)
* Pre-installed Gems like bundler, fastlane, Cocoapods, xcpretty
* Xcode 8 + Installation Script when xip is in the `~/Documents/` directory
* Install Comand Line Tools for the Xcode
* Install Xcode Simulator (9.2 but you can change anytime)

It's recommend use this as playbook than role so that you can customise iOS CI setup as per your need.

How to use this Playbook:
--------------

Imagine, you have fresh Mac with fresh macOS installed.

* Download the playbook by visiting [Github-Repo](https://github.com/Shashikant86/ansible-ios-ci)
 Or Clone it

            $ git clone https://github.com/Shashikant86/ansible-ios-ci

* Install Ansible using pip
Ansible is python library so we can install using pipefail

           $ easy_install pip
           $ pip install ansible

* Change directory and go inside `ansible-ios-ci` directory.
Get the rdependency roles downloaded by

           $ ansible-galaxy install -r requirements.yml

  This will download related roles.

* Download Xcode.xip file from Apple developer account and put it inside `~/Documents/` directory.

*  To run it inside local macOS use following command

           $ ansible-playbook playbook.yml -i inventory -K  

The file `config.yml` is list of all the packages and you can override the file. You can add/remove as needed.



Dependencies
------------

This role has dependency on `geerlingguy.homebrew` to install all the homebrew packages.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: all
      roles:
         - { role: Shashikant86.ansible-ios-ci }

License
-------

MIT

Author Information
------------------

Shashikant Jagtap
