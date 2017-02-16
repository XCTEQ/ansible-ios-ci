Role Name
=========

This role can be used to setup iOS Continuous Integration Service on macOS. This role should have all the tools required for the iOS Developers like fastlane, carthage, cocoapods and lot's of homebrew packages. Xcode installtion is still manual but installing simulators and command line tools is covered by this role.  

Requirements
------------

You need to have Xcode installed manually. You can get Xcode using Apple developer account. You need to have ansible installed on macOS.


Role Variables
--------------

This role has `homebrew_installed_packages` and `homebrew-taps` variables to install packages and tap the formulae.

Dependencies
------------

This role has dependency on `geerlingguy.homebrew` to install all the homebrew packages.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: all
      roles:
         - { role: shashikant86.ios-ci }

License
-------

BSD

Author Information
------------------

Shashikant Jagtap [ iOS Automation Engineer]
