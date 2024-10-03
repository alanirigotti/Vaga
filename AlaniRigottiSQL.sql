CREATE TABLE ESTADO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    codigo VARCHAR(2) 
);


CREATE TABLE tipoTelefone (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(30)
);

CREATE TABLE CLIENTE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(30),
    estado_id INT,
    FOREIGN KEY (estado_id) REFERENCES ESTADO(id)
);

CREATE TABLE TELEFONE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    tipoTelefone_id INT,
    telefone VARCHAR(15),
    ddd INT,
    FOREIGN KEY (cliente_id) REFERENCES CLIENTE(id),
    FOREIGN KEY (tipoTelefone_id) REFERENCES tipoTelefone(id)
);

SELECT   
    c.id,     
    c.razao_social,  
    t.ddd, 
    t.telefone
FROM 
    CLIENTE c
JOIN 
    ESTADO e ON c.estado_id = e.id
LEFT JOIN 
    TELEFONE t ON c.id = t.cliente_id
WHERE 
    e.codigo  = 'SP';

 
 