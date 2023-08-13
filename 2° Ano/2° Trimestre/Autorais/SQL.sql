Create table Empresa(
Localizacao VARCHAR (20) NOT NULL, 
id_empresa_PK VARCHAR (10) NOT NULL, 
CNPJ VARCHAR (11) NOT NULL, 
Nome VARCHAR (15) NOT NULL,   
PRIMARY KEY (id_empresa_PK) 
) 
Create table funcionario( 
id_empresa_FK VARCHAR (10) NOT NULL, 
CPF_PK VARCHAR (11) NOT NULL, 
area_FK VARCHAR (20) NOT NULL,   
PRIMARY KEY (CPF_PK),
FOREIGN KEY (id_empresa_FK) REFERENCES Empresa (id_empresa_PK),
FOREIGN KEY (area_FK) REFERENCES Funcao (area_PK)  
) 
Create table Funcao(
area_PK VARCHAR (20) NOT NULL, 
funcionarios varchar (11) NOT NULL, 
PRIMARY KEY (area_PK)                                 
) 
Create table credenciais(
nome VARCHAR (20) NOT NULL, 
CPF_FK VARCHAR (10) NOT NULL, 
telefone VARCHAR (11) NOT NULL, 
RG_PK VARCHAR (15) NOT NULL,   
PRIMARY KEY (RG_PK), 
FOREIGN KEY (CPF_FK) REFERENCES funcionario (CPF_PK)   
) 
                                 



