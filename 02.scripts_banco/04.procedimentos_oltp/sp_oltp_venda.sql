create or alter procedure sp_oltp_venda2 (@data_carga datetime, @data_inicial datetime, @data_final datetime)
as
begin
	DELETE FROM TB_AUX_VENDA
	WHERE @data_carga = DATA_CARGA

	INSERT INTO TB_AUX_VENDA
	SELECT @data_carga, V.DATA_VENDA, V.COD_LOJA, V.COD_PRODUTO, V.COD_TIPO_PAGAMENTO, V.COD_VENDA, V.VOLUME, V.VALOR
	FROM TB_VENDA V
	WHERE @data_inicial <= DATA_VENDA AND
		  @data_final >= DATA_VENDA
end



-- Teste

exec sp_oltp_venda2 '20230321', '20230101', '20230701'

select * from tb_aux_venda