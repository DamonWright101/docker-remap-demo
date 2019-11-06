# Docker remap Demo

This demo requires both ansible and molecule to run. Both can be found in the links below.

## Install
[How to install ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

[How to install molecule](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

[How to install vagrant](https://www.vagrantup.com/docs/installation/)


## Build without remap
To build the project without remap run the following command
```
molecule converge
```


## Build with remap
Edit molecule/default/playbook.yml so that 
`docker_remap: false` -> `docker_remap: true`

Then run
```
molecule converge
```

## Cleanup
Remove the leftover instance by running
```
molecule destroy
```
