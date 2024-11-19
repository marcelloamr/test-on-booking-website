*** Settings ***
Library            SeleniumLibrary
Resource           ../variables/common_variables.robot
Resource           ../resources/keywords.robot
Suite Setup        Abrir Página Inicial
Suite Teardown     Fechar Navegador

*** Test Cases ***
#Verificar disponibilidade para o período solicitado precisou de 3 casos de testes para cobrir a semana
#Comentei os dois primeiros para não tomar muito tempo na validação de reCAPTCHA, que deve ser manual

#Verificar disponibilidade para o período solicitado 
...    Dado que o usuário acessa o site de reservas 
...    Quando Selecionar Período de Estadia 1-3    
...    Então o sistema deve exibir os quartos disponíveis para reserva

#Verificar disponibilidade para o período solicitado 2
...    Dado que o usuário acessa o site de reservas
...    Quando Selecionar Período de Estadia 3-5
...    Então o sistema deve exibir os quartos disponíveis para reserva

Verificar disponibilidade para o período solicitado 3
    Dado que o usuário acessa o site de reservas    
    Quando Selecionar Período de Estadia 6-8
    Então o sistema deve exibir os quartos disponíveis para reservar o Quarto STANDARD ST1

Reservar Quarto STANDARD ST1
    Dado que o usuário adiciona o quarto disponível
    Quando o usuário clica em Continuar
    E adiciona o serviço de acomodação “Cama Casal, Cama Solteiro, Berço”
    E Clica em Continuar novamente
    Então fica disponível a opção de pagamento 

Informar novos os dados dos hóspedes
    Dado que o usuário retificou a informação para 2 adultos e 1 criança à reserva
    Quando o usuário clica em Continuar
    E adiciona o serviço de acomodação “Cama Casal, Berço”
    E Clica em Continuar novamente
    Então fica disponível a opção de pagamento 

Efetuar pagamento com cartão de crédito
    Dado que o usuário confirmou os detalhes da reserva e inseriu seus dados
    Quando o usuário preenche os dados do cartão de crédito
    E confirma o pagamento
    Então o sistema deve exibir a mensagem de confirmação da reserva
