#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>
using namespace std;

int menu(){
    int opcao;
    system("cls");
    cout << "Infome qual arquivo deseja ver: " << endl;
    do{
        for(int i=1; i <= 4; i++)
            cout << "Trabalho [" << i << "] \n";
        cout << "5 - Sair\n";
        cin >> opcao;
    }while(opcao < 1 || opcao > 5);
    return opcao;
}
void Pattern(string (&npattern)[32], string (&instruc)[32], int& ninstrucoe){
    string file = "./ROM/Pattern.txt";
    fstream patternFile;
    patternFile.open(file, ios::in);
    if (patternFile.is_open()){
        int item = 0;
        string line;
        while(getline(patternFile, line)){
            string aux = "";
            for(int i = 0; i < 6; i++){
                aux += line.at(i);
                npattern[item] = aux;
            }
            aux = "";
            for (int i=6; i < line.size(); i++){
                aux += line.at(i);
                instruc[item] = aux;
            }
            item++;
        }
        ninstrucoe = item;
    }
}

void contador(int ni,int contadorInst[32], string instruc[32], int& totalInst){
    for(int i=0; i < ni; i++){
        if(contadorInst[i] > 0){
            cout << contadorInst[i] << instruc[i] << endl;
            totalInst +=  contadorInst[i];
        }
    }
    cout << "Total de instrucoes: " << totalInst <<endl;
}
void ciclos(int ni,int contadorInst[32], string instruc[32], int& totalCInst){
    int nciclos[32] = {4,4,4,4,4,4,4,4,4,4,5,4,4};
    for(int i=0; i < ni; i++){
        if(contadorInst[i] > 0){
            cout << contadorInst[i] * nciclos[i] << instruc[i] << endl;
            totalCInst +=  contadorInst[i] * nciclos[i];
        }
    }
    cout << "Total de instrucoes: " << totalCInst <<endl;
}


int Arquivos(int i, int ni, string npattern[32],string instruc[32]){
    system("cls");
    string file = "./ROM/P" + to_string(i) + ".txt";
    fstream newFile;
    newFile.open(file, ios::in);
    cout << "Trabalho [" << i << "] \n";
    if(newFile.is_open()){
        string tp, ind[500];
        int linha = 1,contadorInst[32]={};
        while(getline(newFile, tp)){
            int nZero = 0;
            for(int l=0; l < 6; l++){
                ind[linha] = ind[linha] + tp.at(l);
                if(tp.at(l) == '0'){
                    nZero++;
                }
            }
            if(nZero < 6){
                for(i=0; i <= ni; i++){
                    if(ind[linha] == npattern[i]){
                        tp += instruc[i];
                        contadorInst[i]++;
                    }
                }
            } else {
                ind[linha] = "";
                for(int i= tp.size()-6; i < tp.size(); i++){
                  ind[linha] = ind[linha] + tp.at(i);
                }
                for(i=0; i <= ni; i++){
                    if(ind[linha] == npattern[i]){
                        tp += instruc[i] + "*";
                        contadorInst[i]++;
                    }
                }
            }
            cout << "\nLinha"<< linha << ": " << tp << endl;

            linha++;
        }
        int totalCiclos = 0, totalInst = 0;
        cout << "\nNumero de instrucoes usadas: " << endl;
        contador(ni,contadorInst,instruc,totalInst);
        cout << "\nNumero de ciclos por instrucao: " << endl;
        ciclos(ni,contadorInst,instruc,totalCiclos);
        cout << "\nCPI (Total de ciclos/Total de instrucoes): " << totalCiclos/totalInst << endl;

    }
    system("pause");
}

int main()
{
    int ninstrucoes;
    bool sair = false;
    string npattern[32], instruc[32];
    Pattern(npattern,instruc,ninstrucoes);
    do{
        int opcao = menu();
        (opcao == 5) ? sair = true : Arquivos(opcao,ninstrucoes,npattern,instruc);
    }while(sair == false);
    return 0;
}
