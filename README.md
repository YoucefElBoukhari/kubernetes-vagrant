# Kuberant
## K8s in Vagrant format

Kuberant is a project build to create and deploy a testing Kubernetes Cluster on Virtual Machine using Vagrnat with VirtualBox

## Features

- K8s cluster ready for testing.
- low spec needs (2C, 2GiB) for Master VM, (1C, 1GiB) for each Worker VM

## Usage

Download the Vagrantfile to a directory of your choosing.
> Note:  ```Must have vagrant and virtualbox already installed on your system```
> Info: Naviagte to the Vagrantfile location before running the following commands. 
#
#
#
Shows the current status of the VMs defined in the Vagrantfile.
```sh
# vagrant status
```
Starts creating the VMs defined in the Vagrantfile.
```sh
# vagrant Up
```
Destroys (delete) all VMs created by the Vagrantfile. 

```sh
# vagrant destroy 
```

## More Info

[Vagrant](https://developer.hashicorp.com/vagrant/intro)
[VirtualBox](https://www.virtualbox.org/)


## License

Available for Learning and Testing purposes. 


