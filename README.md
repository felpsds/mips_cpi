Visão Geral

```mermaid

  graph TD
    subgraph Arq.exe
        direction RL
        main{main} --> |"Carrega"| Pattern --> |"Carrega"| menu["Menu"]
        menu --> |"Escolhe a opcao"| Opcao["Opcao"]
        Opcao --x FIM1["SAIR"] 
        Opcao --> |"Ler arquivo"| Arquivo["Arquivo"]
        Arquivo --> NLinha{{"Posição da Linha < Total de linhas?"}} 
        NLinha --> |"Sim"| Seis{{"Primeiro 6 digitos = 0?"}}
        Seis --> |"Sim"| Ultimos{{Ler os seis ultimos}} --> Inst["Intruções"]
        Seis --> |"Não"| Inst["Atribui as Intruções"] --> Calcular{Calcular CP/CPI}
        Calcular --> NLinha
        NLinha -----> |"Não"| Infos["Mostra Infos"]
        Infos --> |"Retorna ao menu"| menu

    end
    subgraph Projeto  
        mips_cpi["mips_cpi"] ---> ROM["ROM"]
        MIPS[/"MIPS"\] ---> |"Converte para binário"| ROM 
        ROM --> |"Instruções"| Patter["Pattern"]
        ROM --> |"Binário"| BTXT["P{i}.txt"]
        Patter & BTXT --> exe["Arq.exe"] --> smain{main}
    end
```
Alguns links que podem ajudar caso for usar o projeto:

Opcodes das instruções em MIPS: https://opencores.org/projects/plasma/opcodes

Imagem com o número de ciclos das Instruções: (para o calculo do CPI)
![64490915-defe-4041-83ae-617d661811a9](https://user-images.githubusercontent.com/84294217/188188854-6a9fd026-ef6f-49a8-acce-b2db3aadc790.jpg)

Se precisar de ajuda, me chama no linkedIn: https://www.linkedin.com/in/felpsds/
