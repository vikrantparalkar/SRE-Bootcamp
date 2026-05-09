Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/jammy64"

  config.vm.network "forwarded_port", guest: 8080, host: 8080
# we exposed/opened the internal port 8080 of the VM 

  config.vm.provision "shell", path: "scripts/install.sh"

  config.vm.synced_folder ".", "/home/vagrant/project",
  type: "rsync",
  rsync__exclude: [
    ".git/",
    "__pycache__/",
    ".pytest_cache/",
    "venv/",
    ".github/",
    "actions-runner/",
    "scripts",
    "*.dockerignore",
    "*.gitignore",
    "*README.md"
  ]

end 
