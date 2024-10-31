```yml
- hosts: all                          # Specifies that the playbook should run on all hosts in the inventory.
  become: true                        # Indicates that tasks should be run with elevated privileges (using sudo).
  tasks:                              # Defines the list of tasks to be executed on the specified hosts.

    - name: Update packages           # Task to update all installed packages to their latest versions.
      yum:                            # Uses the 'yum' module, which is for managing packages on RPM-based distributions.
        name: '*'                     # Specifies that all packages should be updated.
        state: latest                 # Ensures that all packages are installed at the latest version available.
      become: true                    # Runs this task with elevated privileges.

    - name: Install Docker            # Task to install Docker.
      yum:                            # Again, uses the 'yum' module for package management.
        name: docker                  # Specifies the package name to install, which is 'docker'.
        state: present                # Ensures that Docker is installed; if it's already installed, no action is taken.
      become: true                    # Runs this task with elevated privileges.

    - name: Start Docker service      # Task to ensure that the Docker service is running.
      service:                        # Uses the 'service' module to manage services.
        name: docker                  # Specifies the service name, which is 'docker'.
        state: started                # Ensures that the Docker service is started.
      become: true                    # Runs this task with elevated privileges.

    - name: Add ec2-user to docker group  # Task to add the 'ec2-user' to the 'docker' group.
      user:                           # Uses the 'user' module to manage user accounts.
        name: ec2-user                # Specifies the user to be modified.
        groups: docker                 # Adds the user to the 'docker' group, allowing it to run Docker commands without sudo.
        append: yes                   # Ensures that this user is added to the group without removing them from other groups.

    - name: Install Docker Compose    # Task to install Docker Compose.
      shell: |                        # Uses the 'shell' module to run shell commands.
        curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
      args:                           # Specifies additional arguments for the task.
        executable: /bin/bash         # Indicates that the commands should be run in a bash shell.
      become: true                    # Runs this task with elevated privileges.

    - name: Check Docker Compose version  # Task to check the installed version of Docker Compose.
      command:                        # Uses the 'command' module to run commands without a shell.
        docker-compose version        # The command to check the Docker Compose version.
```