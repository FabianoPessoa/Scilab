//Trabalho 04 de Controle Inteligente 
//function[] = ANFIS_fabiano()
//Entradas
//x = erro; y = variacao_erro;
//--------------------------------------------------------------------------------------------------//
function[quinta] = ANFIS_fabiano()
z = 1;
Px = [2 1.5 -10;
      2 1.5 -4.8;
      2 1.5 4.8;
      2 1.5 10];
      
Py = [2 1.5 -10;
      2 1.5 -4.8;
      2 1.5 4.8;
      2 1.5 10];      
      
//Camada 1: Os parametros da camda 1 foram colocados em Px e Py
//a = largura da funcao bell
//b = inclinacao da curva
//c = vertice
//mA:erro
//Parametro da quarta camada funcoes sugeno
Fsugp = ones(4,4);
Fsugq = ones(4,4);
Fsugr = ones(4,4);
//mA:erro
x = 10;
for j=1:size(Px,1)
    mA(j) = 1/( 1 + (abs( (x(1)-Px(j,3))/Px(j,1) ))^(2*Px(j,2)) );
end
//mB:variacao do erro
y = 10;
for j=1:size(Py,1)
    mB(j) = 1/( 1 + (abs( (y(1)-Py(j,3))/Py(j,1) ))^(2*Py(j,2)) );
end
//Camada 2: As saídas foram obtidas fazendo o produto do vetor
W = mB*mA';
//Camada 3:
for i=1:size(W,1)
    for j=1:size(W,2)
        N(i,j) = W(i,j)/sum(W);
    end
end
N
//Camada 4:
quarta = N.*((x(1)*Fsugp)+(y(1)*Fsugq)+Fsugr);
//Camada 5:
//quinta(cont_x,cont_y) = sum(quarta)
quinta(1,1) = sum(quarta);
//----------------------------------RETROPROPAGACAO-------------------------------------------------//
//derivacao erro_quinta
erro = -2*(z(1) - quinta(1,1));
//derivacao quinta_quarta

endfunction
//--------------------------------------------------------------------------------------------------//
function[retorno] = norma_RBF2(diferenca)
soma = zeros(size(diferenca,2),1);
for j=1:size(diferenca,2)
    for i=1:size(diferenca,1)    
        soma(j) = soma(j) + diferenca(i,j)^2;  
    end
end
retorno = zeros(length(soma),1);
for j=1:length(retorno)
    retorno(j) = soma(j)^(1/2);
end
endfunction
//--------------------------------------------------------------------------------------------//
function[saida]=funcao01b()
x1 = -10:0.9:10;
x2 = -10:0.9:10;
f = zeros(length(x1),length(x2));
//entrada
entrada = [];
saida = [];
for i =1:length(x1)
    for j =1:length(x2)
        x = [x1(i);x2(j)];
        entrada = [entrada,x];
        if %pi*norma_RBF2(x)==0 then
           f(i,j) = ( sin(%pi*norma_RBF2(x)) )/( 0.00001 );
           saida = [saida,f];
        else
           f(i,j) = ( sin(%pi*norma_RBF2(x)) )/( %pi*norma_RBF2(x) );
           saida = [saida,f(i,j)];
        end
    end
end
plot3d(x1,x2,f);
printf("\n *** Descricao das variaveis de entrada da rede *** \n")
printf("\nEntrada :%d , %d\n",size(entrada,1),size(entrada,2));
printf("\nSaida :%d , %d\n",size(saida,1),size(saida,2));
//--------------------------------------------------------------------------------------------------//
endfunction




