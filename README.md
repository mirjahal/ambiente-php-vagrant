## Ambiente de desenvolvimento PHP construído com Vagrant

### Introdução
Esse projeto automatiza a criação de um ambiente para desenvolvimento com PHP.
Fique à vontade para expandir essas configurações de acordo com suas necessidades.

### Requisitos
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)

### O que tem na VM?
* Ubuntu 14.04
* PHP 5.5
* Apache
* MySQL
	* usuário: root
	* obs: esse usuário não possui senha.
* Postgres
	* usuário: postgres
	* obs: esse usuário não possui senha (na verdade a senha pode ser qualquer coisa).
* Git
* Composer
* cURL
* MCrypt
* ImageMagick

### Iniciando sua máquina virtual
* Clone o repositório do projeto;
* No terminal, acesse o diretório raiz do projeto clonado e execute o comando "vagrant up";
* Aguarde o Vagrant finalizar a construção da máquina virtual. A VM será provisionada com o [Puppet](https://puppetlabs.com).