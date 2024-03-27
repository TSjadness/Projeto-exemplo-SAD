create or alter procedure sp_oltp_loja2(@data_carga datetime)
as
begin
	DELETE FROM TB_AUX_LOJA
	WHERE @data_carga = DATA_CARGA

	INSERT INTO TB_AUX_LOJA
	SELECT @data_carga, L.COD_LOJA, L.NM_LOJA, C.CIDADE, E.ESTADO, E.SIGLA 
	FROM TB_LOJA L INNER JOIN TB_CIDADE C
	ON (L.COD_CIDADE = C.COD_CIDADE) INNER JOIN TB_ESTADO E
	ON (C.COD_ESTADO = E.COD_ESTADO)
end



-- Teste

exec sp_oltp_loja2 '20230321'

select * from tb_aux_loja
