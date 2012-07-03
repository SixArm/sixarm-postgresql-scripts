# SixArm.com » PostgreSQL » scripts for databases


Server:

* <code>postgres-start</code>: Start Postgres running on the data file in the default directory for the operating system.
* <code>postgres-stop</code>: Stop Postgres running on the data file in the default directory for the operating system.


Diagnostics:

* <code>postgres-status</code>: Show Postgres status of running servers.
* <code>postgres-ps</code>: Show Postgress processes using ps aux | grep.


Maintenance:

* <code>postgres-change-password</code>: Cheatsheet to change password.
* <code>postgres-history</code>: Show Postgres history of commands for the current user.
* <code>postgres-unix-socket-directory</code>: If Postgres main conf file has a custom socket, show it.


Configuration abstractions for Debian and Mac:

* <code>postgres-ctl</code>: Print the typical location of the pg_ctl binary.
* <code>postgres-data</code>: Print the typical location of postgres data file.
* <code>postgres-log</code>: Print the typical location of postgres log file. 
* <code>postgres-user</code>: Print the typical user name of the postgres user.
* <code>postgres-init</code>: Initialize a Postgres data file in the default directory.



## Troubleshooting

Error: 

    Is the server running locally and accepting connections
    on Unix domain socket "/tmp/.s.PGSQL.5432"?

Diagnosis: It's probably a PATH issue due to more than one <code>psql</code> command; to see your psql default and alternatives:

    which psql
    find / -name psql

Treatment: edit your .bash_profile or .profile, or whichever shell you're using and prepend the path you want: 

    export PATH=/usr/local/bin:$PATH

Source it:

    source ~/.bash_profile (or whatever file you use)

