incron

This is the incron module which allows you to define incron jobs just like you would cronjobs
using a defined type.

For example:

    incron {'test1':
      user    => 'www-data',
      command => 'touch /tmp/1',
      path    => '/home/wleese/',
      mask    => ['IN_CREATE'],
    }

Support
-------

Feel free to suggest improvements!
