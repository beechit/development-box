# Default Apache virtualhost template

<VirtualHost *:80>

        VirtualDocumentRoot "{{ apache.docroot }}typo3/%-4/Web/"
        ServerName {{ apache.servername }}
	ServerAlias *.local.beech.it
	ServerAlias *.intern1.beech.it
	ServerAlias *.intern2.beech.it
	ServerAlias *.intern3.beech.it

        <Directory {{ apache.docroot }}/typo3/>
                Options -Indexes +FollowSymLinks +MultiViews

                AllowOverride All
                Order deny,allow

                php_admin_value post_max_size 200M
                php_admin_value upload_max_filesize 200M
                php_admin_flag display_errors 1
                php_admin_value memory_limit 1280M
        </Directory>

    ServerAdmin webmaster@localhost

    <Directory {{ apache.docroot }}>
        AllowOverride All
        Options -Indexes FollowSymLinks
        Order allow,deny
        Allow from all
    </Directory>
</VirtualHost>
