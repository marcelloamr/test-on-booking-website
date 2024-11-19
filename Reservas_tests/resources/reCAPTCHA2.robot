*** Settings ***
Library        SeleniumLibrary
Resource       ../variables/common_variables.robot

*** Keywords ***
Aguarda Verificação de Robo
    [Documentation]    O reCAPTCHA é frequentemente carregado dentro de um iFrame,
    ...                o que exige que você o selecione antes de tentar interagir 
    ...                com os elementos dentro dele.

    Select Frame    xpath=//iframe[contains(@src, "recaptcha")]
    Wait Until Element Is Visible    xpath=//*[@id="recaptcha-anchor"]
    Click Element    xpath=//*[@id="recaptcha-anchor"]
    Unselect Frame
    #clicar fora do robô normalmente faz a validação correta
    Click Element    //*[@id="root"]/main/div/div[2]/div[1]/div/div[4]/div/div/div/div[1]/div/div[3]/div/input
    
    Sleep    3s
    
