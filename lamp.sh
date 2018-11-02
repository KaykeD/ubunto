#!/bin/bash
# Autor: Robson Vaamonde
# Site: www.procedimentosemti.com.br
# Facebook: facebook.com/ProcedimentosEmTI
# Facebook: facebook.com/BoraParaPratica
# YouTube: youtube.com/BoraParaPratica
# Data de criação: 01/11/2018
# Data de atualização: 01/11/2018
# Versão: 0.1
# Testado e homologado para a versão do Ubuntu Server 16.04.x LTS x64
# Kernel >= 4.4.x
#
# APACHE (Apache HTTP Server) -Servidor de Hospedagem de Páginas web
# MYSQL (SGBD) - Sistemas de Gerenciamento de Banco de Dados
# PHP (Personal Home Page - PHP: Hypertext Preprocessor) - Linguagem de Programação Dinâmica para Web
# PERL - Linguagem de programação multiplataforma
# PYTHON - Linguagem de programação de alto nível
# PhpMyAdmin - Aplicativo desenvolvido em PHP para administração do MySQL pela Internet
#
# Configuração do MySQL
#	será solicitado a senha do ROOT do MySQL
#
# Configuração do PhpMyAdmin
#	será solicitado o tipo do servidor web, escolha: apache2
#	será solicitado para configurar a base de dados do PhpMyAdmin, escolha: yes
#	será solicitado a senha do PhpMyAdmin, digite uma senha
#
# Utilizar o comando: sudo -i para executar o script
#
# Variável da Data Inicial para calcular tempo de execução do Script
DATAINICIAL=`date +%s`
#
# Validando o ambiente, verificando se o usuário e "root"
USUARIO=`id -u`
UBUNTU=`lsb_release -rs`
KERNEL=`uname -r | cut -d'.' -f1,2`

if [ "$USUARIO" == "0" ]
then
	if [ "$UBUNTU" == "16.04" ]
		then
			if [ "$KERNEL" == "4.4" ]
				then		
					 clear
					 # Variáveis de configuração do MySQL
					 PASSWORD="123@senac"
					 AGAIN="123@senac"
					 USER="root"
					 # Variáveis de configuração do PhpMyAdmin
					 APP_PASSWORD="123@senac"
					 ADMIN_PASS="123@senac"
					 APP_PASS="123@senac"
					 WEBSERVER="apache2"
					 ADMINUSER="root"
					 # Exportando o recurso de Noninteractive do Debconf
					 export DEBIAN_FRONTEND="noninteractive"
					 #
					 echo -e "Usuário é `whoami`, continuando a executar o script"
					 echo
					 echo -e "Instalando os software para o Sistema de Gestão ERP"
					 echo
					 echo -e "APACHE (Apache HTTP Server) -Servidor de Hospedagem de Páginas web"
					 echo -e "Após a instalação do Apache2 acessar a URL: http://`hostname -I`/"
					 echo -e "MYSQL (SGBD) - Sistemas de Gerenciamento de Banco de Dados"
					 echo -e "PHP (Personal Home Page - PHP: Hypertext Preprocessor) - Linguagem de Programação Dinâmica para Web"
					 echo -e "PERL - Linguagem de programação multi-plataforma"
					 echo -e "PYTHON - Linguagem de programação de alto nível"
					 echo -e "PhpMyAdmin - Aplicativo desenvolvido em PHP para administração do MySQL pela Internet"
					 echo -e "Após a instalação do PhpMyAdmin acessar a URL: http://`hostname -I`/phpmyadmin"
					 echo -e "Aguarde..."
					 echo
					 #
					 echo -e "Atualizando as Listas do Apt-Get, aguarde..."
					 apt update
					 echo -e "Listas Atualizadas com Sucesso!!!, continuando o script..."
					 echo
					 #
					 echo -e "Atualizando o Sistema, aguarde..."
					 apt -y upgrade
					 echo -e "Sistema Atualizado com Sucesso!!!, continuando o script..."
					 echo
					 #
					 echo -e "Instalando o LAMP-SERVER, aguarde..."
					 echo
					 #
					 echo -e "Configurando as variáveis do MySQL para o apt, aguarde..."
					 echo "mysql-server-5.7 mysql-server/root_password password $PASSWORD" |  debconf-set-selections
					 echo "mysql-server-5.7 mysql-server/root_password_again password $AGAIN" |  debconf-set-selections
					 echo -e "Variáveis configuradas com sucesso!!!, continuando o script..."
					 sleep 5
					 echo
					 #
					 echo -e "Instalando o LAMP Server, aguarde..."
					 apt -y install lamp-server^ perl python links2
					 echo -e "Instalação do LAMP-SERVER Feito com Sucesso!!!, continuando o script..."
					 echo
					 sleep 5
					 #
					 echo -e "Instalando o PhpMyAdmin, aguarde..."
					 echo
					 #
					 echo -e "Configurando as váriaveis do PhpMyAdmin para o apt-get, aguarde..."
					 echo "phpmyadmin phpmyadmin/internal/skip-preseed boolean true" |  debconf-set-selections
					 echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" |  debconf-set-selections
					 echo "phpmyadmin phpmyadmin/app-password-confirm password $APP_PASSWORD" |  debconf-set-selections
					 echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect $WEBSERVER" |  debconf-set-selections
					 echo "phpmyadmin phpmyadmin/mysql/admin-user string $ADMINUSER" |  debconf-set-selections
					 echo "phpmyadmin phpmyadmin/mysql/admin-pass password $ADMIN_PASS" |  debconf-set-selections
					 echo "phpmyadmin phpmyadmin/mysql/app-pass password $APP_PASS" |  debconf-set-selections
					 echo -e "Variáveis configuradas com sucesso!!!, continuando o script..."
					 sleep 5
					 echo
					 #
					 echo -e "Instalando o PhpMyAdmin, aguarde..."
					 apt -y install phpmyadmin php-mbstring php-gettext
					 echo -e "Instalação do PhpMyAdmin feita com sucesso!!!, continuando o script..."
					 sleep 5
					 echo
					 #				 
					 echo -e "Atualizando as Dependências do PHP para o PhpMyAdmin, aguarde..."
					 phpenmod mcrypt
					 phpenmod mbstring
					 echo -e "Atualização feita com sucesso!!!, continuando o script..."
					 sleep 5
					 echo
					 #
					 echo -e "Reinicializando os serviços do Apache2, aguarde..."
					 sudo service apache2 restart
					 echo -e "Serviço reinicializado com sucesso!!!, continuando o script..."
					 sleep 5
					 echo
					 #
					 echo -e "Serviços instalando com sucesso!!!, pressione <Enter> para continuar com o script"
					 read
					 sleep 5
					 clear
					 #
					 echo
					 echo -e "Instalação do LAMP-SERVER Feito com Sucesso!!!!!"
					 echo
						DATAFINAL=`date +%s`
						SOMA=`expr $DATAFINAL - $DATAINICIAL`
						RESULTADO=`expr 10800 + $SOMA`
						TEMPO=`date -d @$RESULTADO +%H:%M:%S`
					 echo -e "Tempo gasto para execução do script: $TEMPO"
					 echo -e "Pressione <Enter> para concluir o processo."
					 read
					 else
						 echo -e "Versão do Kernel: $KERNEL não homologada para esse script, versão: >= 4.4 "
						 echo -e "Pressione <Enter> para finalizar o script"
					 read
			fi					
		else
			 echo -e "Distribuição GNU/Linux: `lsb_release -is` não homologada para esse script, versão: $UBUNTU"
			 echo -e "Pressione <Enter> para finalizar o script"
			read
		fi
else
	 echo -e "Usuário não é ROOT, execute o comando com a opção: sudo -i <Enter> depois digite a senha do usuário `whoami`"
	 echo -e "Pressione <Enter> para finalizar o script"
	read
fi
