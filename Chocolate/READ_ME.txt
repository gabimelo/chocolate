SISTEMA CHOCOLATE
-----------------------------

Arquivos que compoem o sistema:

Chocolate.WAR 				|	arquivo para dar deploy no sistema
Pasta Chocolate/web 		|	contem as páginas jsp (HTML com código Java)
Pasta Chocolate/src/Java 	|	contem os arquivos com as classes Java das classes
								de modelo, DAO e de conexão com BD
Pasta Interface 			| 	contem os arquivos da Interface estática (que não 
								chegaram a ser integrados com o site dinâmico)

TODOS OS ARQUIVOS PODEM SER BAIXADOS NO ENDEREÇO github.com/gabimelo/chocolate

Banco de dados localizado em "labsoft.pcs.usp.br", nome do banco = "chocolate", 
nome de usuario = "chocolate", senha = "chocolate"

-----------------------------
Para rodar o sistema:

Utilizar o computador LABSOFT 14 ou qualquer máquina que possua o servidor Apache Tomcat 8,
 e que se tenha o nome de usuario e senha do usuario administrador do servidor.

Para visualizar a interface estática: double click no arquivo index.html dentro da pasta Interface

-----------------------------
1 - Baixar o arquivo "chocolate.war" (disponível no github)

2 - Inicializar o servidor. Na máquina LABSOFT 14 isso é feito da seguinte maneira:
	1 - Estar logado no computador com nome de usuário "cursos" e senha "eppece"
	2 - Abir o Explorador de Arquivos do Windows e navegar até a pasta D:\apache-tomcat-8.0.36/bin
	3 - Double click em startup.bat (Arquivo de nome "startup" e tipo Windows Batch File)

3 - Abrir uma página no Google Chrome com o endereço "localhost:8080"

4 - Clicar em "Manager App" (botão do meio, do lado direito, dentro do quadro verde)

5 - Descer até a seção de "Deploy"

6 - Dentro da seção "WAR file to deploy", clicar em "Choose File" e selecionar o arquivo "Chocolate.war"

7 - Clicar em deploy

8 - Acessar o sistema pelo endereço "localhost:8080/Chocolate"

9 - 
	Para logar como cliente: criar novo cadastro de cliente
	Para logar como administrador: username = "admin" senha = "admin"