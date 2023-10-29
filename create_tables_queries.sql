CREATE TABLE KATHGORIA (
    KODIKOS CHAR(3) UNIQUE NOT NULL,
    ONOMA VARCHAR(15) NOT NULL,
    THLEFONO VARCHAR(10) NOT NULL,
    PRIMARY KEY (KODIKOS)
);
 
CREATE TABLE OXHMA (
    PLAISIO CHAR(17) UNIQUE NOT NULL,
    VAROS INT(4) NOT NULL,
    XRWMA VARCHAR(12) NOT NULL,
    TIMH FLOAT NOT NULL,
    KATHGORIA_KODIKOS CHAR(3) UNIQUE NOT NULL,
    PRIMARY KEY (PLAISIO),
    FOREIGN KEY (KATHGORIA_KODIKOS) REFERENCES KATHGORIA(KODIKOS)
);
 
CREATE TABLE PELATHS (
    TAYTOTHTA INT(9) UNIQUE NOT NULL,
    ONOMA VARCHAR(45) NOT NULL,
    HMEROMHNIA_EGGRAFHS DATE NOT NULL,
    PRIMARY KEY (TAYTOTHTA)
);
 
CREATE TABLE AGORA (
    OXHMA_PLAISIO CHAR(17) NOT NULL,
    PELATHS_TAYTOTHTA INT(9) NOT NULL,
    HMEROMHNIA DATE NOT NULL,
    PRIMARY KEY (OXHMA_PLAISIO, PELATHS_TAYTOTHTA),
    FOREIGN KEY (OXHMA_PLAISIO) REFERENCES OXHMA(PLAISIO),
    FOREIGN KEY (PELATHS_TAYTOTHTA) REFERENCES PELATHS(TAYTOTHTA)
);
 
CREATE TABLE ANTALAKTIKA(
    ID INT PRIMARY KEY,
    ONOMA VARCHAR(255) NOT NULL,
    PERIGRAFH TEXT,
    TIMH DECIMAL(10, 2) NOT NULL,
    OXHMA_ID CHAR(17),
    FOREIGN KEY (OXHMA_ID) REFERENCES OXHMA(PLAISIO)
);
 
CREATE TABLE DIANOMEIS(
    ID INT PRIMARY KEY,
    ONOMA VARCHAR(100) NOT NULL,
    PERIOXH VARCHAR(50) NOT NULL
    
)
 
 
CREATE TABLE AFTOKINHTADIANOMEIS(
  DIANOMEAS INT(15) NOT NULL,
  OXHMA char(17) NOT NULL,
  FOREIGN KEY (DIANOMEAS) REFERENCES DIANOMEIS(ID),
  FOREIGN KEY (OXHMA) REFERENCES OXHMA(PLAISIO),
  UNIQUE (Dianomeas, Oxhma)
  );
 
CREATE TABLE XRHSTES (
    XRHSTHS_ID INT AUTO_INCREMENT PRIMARY KEY,
    USERNAME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL UNIQUE,
    PASSWORD VARCHAR(255) NOT NULL,
    ONOMATEPONYMO VARCHAR(100),
    HMEROMHNIA_GENISHS DATE,
    HMEROMHNIA_EGGRAFHS TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
 
CREATE TABLE YPEYTHINOS(
  ONOMA VARCHAR(100) NOT NULL,
  KATHGORIA = char(3) UNIQUE FOREIGN KEY REFERENCES KATHGORIA (KODIKOS),
  XRHSTHS = INT ,
  FOREIGN KEY(XRHSTHS) REFERENCES XRHSTES(XRHSTHS_ID)
)