*** Variables ***
${BASE_URL}            https://reservas.desbravador.com.br/1111
${DATA_INICIAL}        2023-12-01
${DATA_FINAL}          2023-12-04
${CHECK_reCAPTCHA}    //*[@id="recaptcha-anchor"]/div[1]
${DIA_ATUAL}=    Get Current Date    result_format=%d

