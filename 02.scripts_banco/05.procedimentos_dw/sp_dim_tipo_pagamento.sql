create or alter procedure sp_dim_tipo_pagamento2(@data_carga datetime)
as
begin
	DECLARE @COD_TIPO_PAGAMENTO INT,
			@TIPO_PAGAMENTO VARCHAR(100),
			@CURRENT_TIPO_PAGAMENTO VARCHAR(100)

	DECLARE CUR CURSOR FOR
	SELECT COD_TIPO_PAGAMENTO, TIPO_PAGAMENTO FROM TB_AUX_TIPO_PAGAMENTO

	OPEN CUR
	FETCH CUR INTO @COD_TIPO_PAGAMENTO, @TIPO_PAGAMENTO

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF (EXISTS (SELECT 1 FROM DIM_TIPO_PAGAMENTO WHERE COD_TIPO_PAGAMENTO = @COD_TIPO_PAGAMENTO))
		BEGIN
			SELECT @CURRENT_TIPO_PAGAMENTO = TIPO_PAGAMENTO
			FROM DIM_TIPO_PAGAMENTO
			WHERE COD_TIPO_PAGAMENTO = @COD_TIPO_PAGAMENTO

			IF (@CURRENT_TIPO_PAGAMENTO != @TIPO_PAGAMENTO)
				UPDATE DIM_TIPO_PAGAMENTO
				SET TIPO_PAGAMENTO = @TIPO_PAGAMENTO
		END
		ELSE
		BEGIN
			INSERT INTO DIM_TIPO_PAGAMENTO
			VALUES (@COD_TIPO_PAGAMENTO, @TIPO_PAGAMENTO)
		END
		FETCH CUR INTO @COD_TIPO_PAGAMENTO, @TIPO_PAGAMENTO
	END
	CLOSE CUR
	DEALLOCATE CUR
end



-- Teste

exec sp_dim_tipo_pagamento '20230321'

select * from dim_tipo_pagamento