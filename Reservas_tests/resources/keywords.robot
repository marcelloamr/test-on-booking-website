*** Settings ***
Library        SeleniumLibrary
Resource       ../variables/common_variables.robot
Resource       reCAPTCHA.robot
#Coloquei somente a validação do reCAPTCHA separada porque estava deixando o código muito sujo
#Favor considerar tirar essa validação do ambiente de testes

*** Keywords ***
Abrir Página Inicial
    Open Browser    ${BASE_URL}    chrome
    Verifica se a página inicial abriu corretamente

Dado que o usuário acessa o site de reservas
    Verifica se a página inicial abriu corretamente
Verifica se a página inicial abriu corretamente
    Maximize Browser Window
    Wait Until Page Contains Element    //*[@id="calendar"]   timeout=60

Fechar Navegador
    Close Browser

Clicar em Verificar Disponibilidade
    Click Element    //*[@id="root"]/main/div/div[2]/div[1]/div/div[4]/div/div/div/div[2]/div/div[2]/div/button


Quando Selecionar Período de Estadia 1-3
    Click Element    //*[@id="calendar"]/div[2]/div[2]/table[2]/tbody/tr[1]/td[1]/div
    Click Element    //*[@id="calendar"]/div[2]/div[2]/table[2]/tbody/tr[1]/td[3]/div
    Adicionar Hóspedes
    Aguarda Verificação de Robo
    Clicar em Verificar Disponibilidade

Quando Selecionar Período de Estadia 3-5
    Click Element    //*[@id="calendar"]/div[2]/div[2]/table[2]/tbody/tr[1]/td[3]/div
    Click Element    //*[@id="calendar"]/div[2]/div[2]/table[2]/tbody/tr[1]/td[5]/div
    Adicionar Hóspedes
    Aguarda Verificação de Robo
    Clicar em Verificar Disponibilidade
        

Quando Selecionar Período de Estadia 6-8
    Click Element    //*[@id="calendar"]/div[2]/div[2]/table[2]/tbody/tr[1]/td[6]/div
    Click Element    //*[@id="calendar"]/div[2]/div[2]/table[2]/tbody/tr[2]/td[1]/div
    Adicionar Hóspedes
    Aguarda Verificação de Robo
    Clicar em Verificar Disponibilidade

Então o sistema deve exibir os quartos disponíveis para reserva
    Wait Until Element Is Visible    //*[@id="root"]/main/div/div[1]/div/div[4]/div/div[1]/div[2]/div[3]/div/div/div/div/div/div[1]/div/div[4]/div[3]/button/span    
    Go To    https://reservas.desbravador.com.br/hotel-app/hotel-1111
    Verifica se a página inicial abriu corretamente

Então o sistema deve exibir os quartos disponíveis para reservar o Quarto STANDARD ST1
    Wait Until Element Is Visible    //*[@id="root"]/main/div/div[1]/div/div[4]/div/div[1]/div[2]/div[3]/div/div/div/div/div/div[1]/div/div[4]/div[3]/button/span    timeout=30  


Adicionar Hóspedes
    #   2 adultos e 3 crianças
    Input Text    //*[@id="root"]/main/div/div[2]/div[1]/div/div[4]/div/div/div/div[1]/div/div[1]/div/input    2
    Click Element    //*[@id="root"]/main/div/div[2]/div[1]/div/div[4]/div/div/div/div[1]/div/div[2]/div/div/div/button[1]
    Input Text    //*[@id="faixa1"]    3

Dado que o usuário adiciona o quarto disponível
    Wait Until Element Is Visible    //*[@id="root"]/main/div/div[1]/div/div[4]/div/div[1]/div[2]/div[3]/div/div/div/div/div/div[1]/div/div[4]/div[3]/button
    Click Element                    //*[@id="root"]/main/div/div[1]/div/div[4]/div/div[1]/div[2]/div[3]/div/div/div/div/div/div[1]/div/div[4]/div[3]/button

Quando o usuário clica em Continuar
    Wait Until Element Is Visible    //*[@id="root"]/main/div/div/div/div[4]/div/div[2]/div/div[1]/div[2]/div[3]/div/div/button
    Click Element    //*[@id="root"]/main/div/div/div/div[4]/div/div[2]/div/div[1]/div[2]/div[3]/div/div/button
E adiciona o serviço de acomodação “Cama Casal, Cama Solteiro, Berço”
    Wait Until Element Is Visible    //*[@id="root"]/main/div/div/div[3]/div[1]/div[1]/div/div/div/div/div[2]/div/div[2]/div/div/div[2]/input
    Click Element                    //*[@id="root"]/main/div/div/div[3]/div[1]/div[1]/div/div/div/div/div[2]/div/div[2]/div/div/div[2]/input

E Clica em Continuar novamente
    Click Element    //*[@id="root"]/main/div/div/div[3]/div[2]/div/div/div[2]/div[3]/div/div/button

Então fica disponível a opção de pagamento 
    Wait Until Element Is Visible    //*[@id="root"]/main/div/div/div[3]/div/div[2]/form/div[1]/div[2]/div/div[2]/div[1]/div/label


Dado que o usuário retificou a informação para 2 adultos e 1 criança à reserva
    Go To    https://reservas.desbravador.com.br/hotel-app/hotel-1111
    Verifica se a página inicial abriu corretamente
    Dado que o usuário acessa o site de reservas    
    Quando Selecionar Período de Estadia 6-8
    Então o sistema deve exibir os quartos disponíveis para reservar o Quarto STANDARD ST1
    Click Element    //*[@id="root"]/main/div/div[1]/div/div[4]/div/div[1]/div[2]/div[3]/div/div/div/div/div/div[1]/div/div[4]/div[2]/div/div/button[2]
    Input Text    //*[@id="faixa1"]    1
    Dado que o usuário adiciona o quarto disponível

E adiciona o serviço de acomodação “Cama Casal, Berço”
    Click Element    //*[@id="root"]/main/div/div/div[3]/div[1]/div[1]/div/div/div/div/div[2]/div/div[2]/div/div/div[1]/input


Dado que o usuário confirmou os detalhes da reserva e inseriu seus dados
    Input Text    //*[@id="root"]/main/div/div/div[3]/div/div[2]/form/div[1]/div[1]/div/div/div/div[1]/div/div/div[1]/div/input    email@email.com
Quando o usuário preenche os dados do cartão de crédito
    Input Text    //*[@id="root"]/main/div/div/div[3]/div/div[2]/form/div[1]/div[2]/div/div[3]/div[2]/div/div/input    4000000000000044
    Input Text    //*[@id="root"]/main/div/div/div[3]/div/div[2]/form/div[1]/div[2]/div/div[3]/div[3]/div/input        DESBRAVADOR SOFTWARE
    Input Text    //*[@id="root"]/main/div/div/div[3]/div/div[2]/form/div[1]/div[2]/div/div[3]/div[4]/div/input        1225
    Input Text    //*[@id="root"]/main/div/div/div[3]/div/div[2]/form/div[1]/div[2]/div/div[3]/div[5]/div/input        123
    Click Element    //*[@id="root"]/main/div/div/div[3]/div/div[2]/form/div[3]/div[2]/div/div[1]/div/div/input
    Aguarda Verificação de Robo

E confirma o pagamento
    Click Element    //*[@id="root"]/main/div/div/div[3]/div/div[2]/form/div[5]/div/div/button

Então o sistema deve exibir a mensagem de confirmação da reserva
    Wait Until Element Is Visible    //*[@id="root"]/main/div/div/p[1]
