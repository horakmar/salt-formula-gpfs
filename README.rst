
=============
GPFS Formula
=============

IBM Spectrum Scale (GPFS) is a shared filesystem.

Sample Pillars
==============

Gitlab server setup

.. code-block:: yaml

    gpfs:
      client:
        enabled: true
      system_user:
        qpgpfs

More Information
================

* https://en.wikipedia.org/wiki/IBM_Spectrum_Scale
* https://www.ibm.com/support/knowledgecenter/en/STXKQY_5.0.1/ibmspectrumscale501_welcome.html

Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-nginx/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-nginx

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
