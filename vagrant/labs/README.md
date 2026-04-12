# Fix check file vagrant-vbguest plugin
https://github.com/hashicorp/vagrant/issues/13553#issuecomment-2526671058

''However, you might be able to patch the plugin to work correctly. The error message shows the file and line number where the File.exists? method is used. To try patching the plugin, open the file /home/leond95/.vagrant.d/gems/3.3.6/gems/vagrant-vbguest-0.32.0/lib/vagrant-vbguest/hosts/virtualbox.rb in a text editor. On line 84 of the file, change File.exists? to File.exist?.''

