create or alter procedure sp_oltp_produto2(@data_carga datetime)
as
begin
	DELETE FROM TB_AUX_PRODUTO
	WHERE @data_carga = DATA_CARGA

	INSERT INTO TB_AUX_PRODUTO
	SELECT @data_carga, P.COD_PRODUTO, P.PRODUTO, C.COD_CATEGORIA, C.CATEGORIA
	FROM TB_PRODUTO P INNER JOIN TB_CATEGORIA C
	ON (P.COD_CATEGORIA = C.COD_CATEGORIA)
end


-- Teste

exec sp_oltp_produto2 '20230321'

select * from tb_aux_produto