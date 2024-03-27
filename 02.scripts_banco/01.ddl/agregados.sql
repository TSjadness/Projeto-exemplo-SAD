CREATE TABLE FATO_VENDA_LOJA_MENSAL (
	ID_TEMPO BIGINT NOT NULL,
	ID_LOJA INT NOT NULL,
	VOLUME NUMERIC(10,2) NOT NULL,
	VALOR NUMERIC(10,2) NOT NULL,
	QUANTIDADE INT NOT NULL,
	CONSTRAINT FK_DIM_LOJA1 FOREIGN KEY (ID_LOJA) REFERENCES DIM_LOJA (ID_LOJA),
	CONSTRAINT FK_TEMPO1 FOREIGN KEY (ID_TEMPO) REFERENCES DIM_TEMPO (ID_TEMPO),
)


CREATE INDEX IX_FATO_VENDA_MENSAL_TEMPO ON FATO_VENDA_LOJA_MENSAL (ID_TEMPO)
CREATE INDEX IX_FATO_VENDA_MENSAL_LOJA ON FATO_VENDA_LOJA_MENSAL(ID_LOJA)