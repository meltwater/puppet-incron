incron
======

This is the incron module which allows you to define incron jobs just like you would cronjobs
using a defined type.

Usage Example
-------------

    include incron # install the incron package. Not necessary if installed through other means.
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

Support
-------

Feel free to suggest improvements!
