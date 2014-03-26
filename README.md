incron
======

This incron module allows you to define incron jobs just like you would cronjobs using a resource type.

Package installation is possible by including the incron class, but not mandatory. This is to accomodate the various ways organisations manage installing packages.

As opposed to the cron resource type, incron resource names must be unique system wide.

Usage Example
-------------

    include incron # Not needed if the package was installed through other means.

    incron {'test1':
      user    => 'www-data',
      command => 'touch /tmp/1',
      path    => '/home/wleese/',
      mask    => ['IN_CREATE'],
    }

Valid values for the mask parameter are:

    IN_ACCESS
    IN_MODIFY
    IN_ATTRIB
    IN_CLOSE_WRITE
    IN_CLOSE_NOWRITE
    IN_OPEN
    IN_MOVED_FROM
    IN_MOVED_TO
    IN_CREATE
    IN_DELETE
    IN_DELETE_SELF
    IN_UNMOUNT
    IN_Q_OVERFLOW
    IN_IGNORED
    IN_CLOSE
    IN_MOVE
    IN_ISDIR
    IN_ONESHOT
    IN_ALL_EVENT
    IN_NO_LOOP

Support
-------

Feel free to suggest improvements!
