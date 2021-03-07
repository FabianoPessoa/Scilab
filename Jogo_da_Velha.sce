x_message_modeless(['DESCRIÇÃO DO ALGORITMO MIN-MAX'
                    'O seguinte trabalho destina-se a escrever, na linguagem Scilab-3.1.1,'
                    'um programa que use a estratégia MIN-MAX para jogar o Jogo da Velha.'
                     ' '
                     'Para que, no jogo da velha, seja possível  selecionar  as opções  mais promissoras,  há' 
                     'necessidade  de uma heurística  que  permita fornecer, a cada jogada,  um  índice   que'
                     'reflita  a  vantagem  posicional  alcançada pelo movimento  escolhido.  Uma  heurística'
                     'possível  é contar,em cada situação de jogo, a diferença entre o número de alinhamentos'
                     'possíveis para cada jogador. Considerou-se uma notação análoga à utilizada em teoria de'
                     'matrizes, ou seja, a posição na i-ésima linha e j-ésima coluna é denotada (i,j).       '
                     'Para verificar os alinhamento ao longo  do jogo, atribuiu-se a  inicialização da matriz'
                     'de   posicão   elementos nulos.  Dessa forma, para a marcação  da jogada do  Computador'
                     'atribui-se  a posição da casa correspondente  o  valor +1, e  para a    posição da casa' 
                     'jogada humana  atribui-se -1. Dessa forma, um alinhamento é medido quando em uma linha,'
                     'ou coluna, ou diagonal principal, ou secundária  da matriz a soma de todos os elementos'
                     'forem iguais a +3 (Computador vence) ou -3(Humano vence).'
                     ''
                     'Implementado por Fabiano de Sousa Pessoa'
                     'Click em ""Ok"" para fechar a mensagem']);
//***********************************************************************************
answ=buttondialog("Programa Jogo da Velha\nEsse programa foi criado para implementação do algoritmo de busca MIN-MAX\nTravalho número 01 de controle Inteligente\nPara começar escolha Ok/Inicio/Computador ou Humano\nImplementado por Fabiano de Sousa Pessoa em 17/05/2006","ok");
addmenu(0,'Inicio',['&Computador';'&Humano']);
Inicio_0 = ['Computador()';'Humano()'];
matriz = zeros(3,3);
//************************************************************************************
function[]=principal2()
rect=[0,0,100,100];
plot2d(0,0,[0],'012','leg',rect);
branco();
layout2();
endfunction
//************************************************************************************
function[retorno] = principal(num,matriz)
loop = 0;
pare = 0;
while loop<5
      if num==1 then
         num = 0;
         //Computador
//**************************************************************
         //Verifica para o citerio de parada vitoria de computador
         //Soma linha
		 // Se todas as colunas de uma linha for preenchidas com um
		 // enta'o a soma delas vale 3.
         soma = 0;
         for i =1:3
			// Inicialmente matriz (deve ser um tabuleiro)recebe zeros
			// Provavelmente, cada casa recebe um.
			//Soma cada coluna de todas as linhas
             for j =1:3
                soma = matriz(i,j)+ soma;
             end
			 // soma == 3 indica uma vito'ria.
             if (soma == 3) then
				// pare == 1 o programa para.
				// pare == 0 o programa continua
                pare = 1;
             end   
             soma = 0;
         end
		 // Similar ao lac,o acima.
         //Soma colunas
         soma = 0;
         for j =1:3
             for i =1:3
                soma = matriz(i,j)+ soma;
             end
             if (soma == 3) then
                pare = 1;
             end   
             soma = 0;
         end         
         //Soma diag principal
         soma = 0;
         for i =1:3
             soma  = matriz(i,i) + soma;
         end
         if (soma == 3)  then
             pare = 1;
         end   
         //Soma diag secundaria
         soma = 0;
         j=1;
         for i=1:3
             soma = matriz(i,4-j) + soma;
             j = j+1;
         end
         if (soma == 3)  then
             pare = 1;
         end
         //Todas as casa ocupadas
		 // Isso acontece se nenhum elemento da matriz for zero
         if matriz<>0 then
            answ=buttondialog("Fim do Jogo da Velha\nFabiano de Sousa Pessoa","ok");                           
            break;
         end
		 // Dados as ana'lizes acima feitas em todas as diagonais.
         if pare==1 then
            answ=buttondialog("Fim do Jogo da Velha\nComputador Ganha\nFabiano de Sousa Pessoa","ok");                  
            break;
         end
		 
//**************************************************************                  
         posicao = entcomp(matriz);         
         printf("\n posicao:%f\n ",posicao);
         matriz = x_tabuleiro(posicao,matriz);
//**************************************************************
         //Verifica para o citerio de parada vitoria de computador
         //Soma linha
         soma = 0;
         for i =1:3
             for j =1:3
                soma = matriz(i,j)+ soma;
             end
             if (soma == 3) then
                pare = 1;
             end   
             soma = 0;
         end
         //Soma colunas
         soma = 0;
         for j =1:3
             for i =1:3
                soma = matriz(i,j)+ soma;
             end
             if (soma == 3) then
                pare = 1;
             end   
             soma = 0;
         end         
         //Soma diag principal
         soma = 0;
         for i =1:3
             soma  = matriz(i,i) + soma;
         end
         if (soma == 3) then
             pare = 1;
         end   
         //Soma diag secundaria
         soma = 0;
         j=1;
         for i=1:3
             soma = matriz(i,4-j) + soma;
             j = j+1;
         end
         if (soma == 3) then
             pare = 1;
         end
         //Todas as casa ocupadas
         if matriz<>0 then
            answ=buttondialog("Fim do Jogo da Velha\nFabiano de Sousa Pessoa","ok");                           
            break;
         end
         if pare==1 then
            answ=buttondialog("Fim do Jogo da Velha\nComputador Ganha\nFabiano de Sousa Pessoa","ok");                  
            break;
         end
//**************************************************************         
         
      end//num==1
      if num==0 then
         num = 1;
         //Humano
//**************************************************************
         // Verifica para o citerio de parada vitoria de Humano
		 // As jogas dos Humano recebe sinal negativo.
		 // Algoritmo similar ao do computador.
         // Soma linha
         soma = 0;
         for i =1:3
             for j =1:3
                soma = matriz(i,j)+ soma;
             end
             if (soma == -3) then
                pare = 1;
             end   
             soma = 0;
         end
         //Soma colunas
         soma = 0;
         for j =1:3
             for i =1:3
                soma = matriz(i,j)+ soma;
             end
             if (soma == -3) then
                pare = 1;
             end   
             soma = 0;
         end         
         //Soma diag principal
         soma = 0;
         for i =1:3
             soma  = matriz(i,i) + soma;
         end
         if (soma == -3) then
             pare = 1;
         end   
         //Soma diag secundaria
         soma = 0;
         j=1;
         for i=1:3
             soma = matriz(i,4-j) + soma;
             j = j+1;
         end
         if (soma == -3) then
             pare = 1;
         end
         if matriz<>0 then
            answ=buttondialog("Fim do Jogo da Velha\nFabiano de Sousa Pessoa","ok");          
            break;
         end
         //Todas as casa ocupadas
         if (pare==1)|(matriz<>0) then
            answ=buttondialog("Fim do Jogo da Velha\nHumano Ganha\nFabiano de Sousa Pessoa","ok");                  
            break;
         end
//**************************************************************                           
         matriz = o_tabuleiro(mouse_locate(),matriz);
//**************************************************************
         //Verifica para o citerio de parada vitoria de Humano
         //Soma linha
         soma = 0;
         for i =1:3
             for j =1:3
                soma = matriz(i,j)+ soma;
             end
             if (soma == -3) then
                pare = 1;
             end   
             soma = 0;
         end
         //Soma colunas
         soma = 0;
         for j =1:3
             for i =1:3
                soma = matriz(i,j)+ soma;
             end
             if (soma == -3) then
                pare = 1;
             end   
             soma = 0;
         end         
         //Soma diag principal
         soma = 0;
         for i =1:3
             soma  = matriz(i,i) + soma;
         end
         if (soma == -3) then
             pare = 1;
         end   
         //Soma diag secundaria
         soma = 0;
         j=1;
         for i=1:3
             soma = matriz(i,4-j) + soma;
             j = j+1;
         end
         if (soma == -3) then
             pare = 1;
         end
         if matriz<>0 then
            answ=buttondialog("Fim do Jogo da Velha\nFabiano de Sousa Pessoa","ok");          
            break;
         end
         //Todas as casa ocupadas
         if (pare==1)|(matriz<>0) then
            answ=buttondialog("Fim do Jogo da Velha\nHumano Ganha\nFabiano de Sousa Pessoa","ok");                  
            break;
         end
//**************************************************************                  
     end//num==0
     loop = loop + 1;
end//while loop=1:5
//imprimi_matriz(matriz);
retorno = matriz
endfunction
//************************************************************************************
function[]=Computador()
principal2();
principal(1,matriz);//Computador ativo o flag
endfunction
//************************************************************************************
function[]=Humano()
principal2();
principal(0,matriz);//Humano desativo o flag
endfunction
//************************************************************************************
function[]=pausa()
xpause(1E6);
endfunction
//************************************************************************************
function[retorno]=mouse_locate()
x = locate(1);
retorno = x;
endfunction
//************************************************************************************
function[retorno]=x_tabuleiro(posicao,matriz)
//condicao do mouse para a posicao 11
//if (num(1)<37.103825)&(num(1)>11.967213)&(num(2)<86.932707)&(num(2)>61.893584) then
if posicao == 11 then
   xx=[37.103825 11.967213]';
   yy=[86.932707 61.893584]';
   xfpolys(xx,yy);
   xx=[11.967213 37.103825]';
   yy=[86.932707 61.893584]';
   xfpolys(xx,yy);
   //introduz a marcação na matriz = zeros(3,3)
   matriz(1,1) = 1;
end
//condicao do mouse para a posicao 12
//if (num(1)<62.021858)&(num(1)>37.103825)&(num(2)<86.932707)&(num(2)>61.893584) then
if posicao == 12 then
   xx=[62.021858 37.103825]';
   yy=[86.932707 61.893584]';
   xfpolys(xx,yy);
   xx=[37.103825 62.021858]';
   yy=[86.932707 61.893584]';
   xfpolys(xx,yy);
   //introduz a marcação na matriz = zeros(3,3)
   matriz(1,2) = 1;   
end
//condicao do mouse para a posicao 13
//if (num(1)<86.939891)&(num(1)>61.893584)&(num(2)<86.932707)&(num(2)>61.893584) then
if posicao == 13 then
   xx=[86.939891 62.021858]';
   yy=[86.932707 61.893584]';
   xfpolys(xx,yy);
   xx=[62.021858 86.939891]';
   yy=[86.932707 61.893584]';
   xfpolys(xx,yy);
   //introduz a marcação na matriz = zeros(3,3)
   matriz(1,3) = 1;
end
//condicao do mouse para a posicao 21
//if (num(1)<37.103825)&(num(1)>11.967213)&(num(2)<61.893584)&(num(2)>36.854460) then
if posicao == 21 then
   xx=[37.103825 11.967213]';
   yy=[61.893584 36.854460]';
   xfpolys(xx,yy);
   xx=[11.967213 37.103825]';
   yy=[61.893584 36.854460]';
   xfpolys(xx,yy);
   //introduz a marcação na matriz = zeros(3,3)
   matriz(2,1) = 1;   
end
//condicao do mouse para a posicao 22
//if (num(1)<62.027858)&(num(1)>37.103825)&(num(2)<61.893584)&(num(2)>36.854460) then
if posicao == 22 then
   xx=[62.027858 37.103825]';
   yy=[61.893584 36.854460]';
   xfpolys(xx,yy);
   xx=[37.103825 62.021858]';
   yy=[61.893584 36.854460]';
   xfpolys(xx,yy);
   //introduz a marcação na matriz = zeros(3,3)
   matriz(2,2) = 1;   
end
//condicao do mouse para a posicao 23
//if (num(1)<86.939891)&(num(1)>62.021858)&(num(2)<61.893584)&(num(2)>36.854460) then
if posicao == 23 then
   xx=[86.939891 62.021858]';
   yy=[61.893584 36.854460]';
   xfpolys(xx,yy);
   xx=[62.021858 86.939891]';   
   yy=[61.893584 36.854460]';
   xfpolys(xx,yy);
   //introduz a marcação na matriz = zeros(3,3)
   matriz(2,3) = 1;      
end
//condicao do mouse para a posicao 31
//if (num(1)<37.103825)&(num(1)>11.967213)&(num(2)<36.854460)&(num(2)>12.128326) then
if posicao == 31 then
   xx=[37.103825 11.967213]';
   yy=[36.854460 12.128326]';
   xfpolys(xx,yy);
   xx=[11.967213 37.103825]';   
   yy=[36.854460 12.128326]';
   xfpolys(xx,yy);
   //introduz a marcação na matriz = zeros(3,3)
   matriz(3,1) = 1;         
end
//condicao do mouse para a posicao 32
//if (num(1)<62.021858)&(num(1)>37.103825)&(num(2)<36.854460)&(num(2)>12.128326) then
if posicao == 32 then
   xx=[62.021858 37.103825]';
   yy=[36.854460 12.128326]';
   xfpolys(xx,yy);
   xx=[37.103825 62.021858]';   
   yy=[36.854460 12.128326]';
   xfpolys(xx,yy);
   //introduz a marcação na matriz = zeros(3,3)
   matriz(3,2) = 1;           
end
//condicao do mouse para a posicao 33
//if (num(1)<86.939891)&(num(1)>62.021358)&(num(2)<36.854460)&(num(2)>12.128326) then
if posicao == 33 then
   xx=[86.939891 62.021358]';
   yy=[36.854460 12.128326]';
   xfpolys(xx,yy);
   xx=[62.021850 86.939891]';   
   yy=[36.85468 12.128326]';
   xfpolys(xx,yy);
   //introduz a marcação na matriz = zeros(3,3)
   matriz(3,3) = 1;             
end
retorno = matriz;
endfunction
//************************************************************************************
function[retorno]=o_tabuleiro(num,matriz)
//condicao do mouse para a posicao 11
if (num(1)<37.103825)&(num(1)>11.967213)&(num(2)<86.932707)&(num(2)>61.893584) then
   circulo(11.967213,86.932707);
   //introduz a marcação na matriz = zeros(3,3)   
   matriz(1,1) = -1;
end
//condicao do mouse para a posicao 12
if (num(1)<62.021858)&(num(1)>37.103825)&(num(2)<86.932707)&(num(2)>61.893584) then
   circulo(37.103825,86.932707);
   //introduz a marcação na matriz = zeros(3,3)   
   matriz(1,2) = -1;   
end
//condicao do mouse para a posicao 13
if (num(1)<86.939891)&(num(1)>61.893584)&(num(2)<86.932707)&(num(2)>61.893584) then
   circulo(62.021858,86.932707);
   //introduz a marcação na matriz = zeros(3,3)   
   matriz(1,3) = -1;   
end
//condicao do mouse para a posicao 21
if (num(1)<37.103825)&(num(1)>11.967213)&(num(2)<61.893584)&(num(2)>36.854460) then
   circulo(11.967213,61.893584);
   //introduz a marcação na matriz = zeros(3,3)   
   matriz(2,1) = -1;
end
//condicao do mouse para a posicao 22
if (num(1)<62.027858)&(num(1)>37.103825)&(num(2)<61.893584)&(num(2)>36.854460) then
   circulo(37.103825,61.893584);
   //introduz a marcação na matriz = zeros(3,3)   
   matriz(2,2) = -1;   
end
//condicao do mouse para a posicao 23
if (num(1)<86.939891)&(num(1)>62.021858)&(num(2)<61.893584)&(num(2)>36.854460) then
   circulo(62.021858,61.893584);
   //introduz a marcação na matriz = zeros(3,3)   
   matriz(2,3) = -1;   
end
//condicao do mouse para a posicao 31
if (num(1)<37.103825)&(num(1)>11.967213)&(num(2)<36.854460)&(num(2)>12.128326) then
   circulo(11.967213,36.854460);
   //introduz a marcação na matriz = zeros(3,3)   
   matriz(3,1) = -1;   
end
//condicao do mouse para a posicao 32
if (num(1)<62.021858)&(num(1)>37.103825)&(num(2)<36.854460)&(num(2)>12.128326) then
   circulo(37.103825,36.854460);
   //introduz a marcação na matriz = zeros(3,3)   
   matriz(3,2) = -1;   
end
//condicao do mouse para a posicao 33
if (num(1)<86.939891)&(num(1)>62.021358)&(num(2)<36.854460)&(num(2)>12.128326) then
   circulo(62.021358,36.854460);
   //introduz a marcação na matriz = zeros(3,3)   
   matriz(3,3) = -1;   
end
retorno = matriz;
endfunction
//************************************************************************************
function[]=branco()
rect=[0,0,100,100];
plot2d(0,0,[0],'012','leg',rect);
xclip('clipgrf');
x=[0 100 100 0   0]';
y=[0   0 100 100 0]';
fill=8*ones(1,1);
xfpolys(x,y,fill);
xclip();
endfunction
//************************************************************************************
function[]=layout2()
rect=[0,0,100,100];
plot2d(0,0,[0],'012','leg',rect);
xclip('clipgrf');
x=[0 25 25 0 0]'+ 12*ones(5,1);
y=[0 0 25 25 0]'+ 12*ones(5,1);
d=25*[1 1 1 1 1]';
xx=[];
yy=[];
i=0;
for k=1:3
    for l=1:3
        i=i+1;
        xx=[xx,(l-1)*d+x];
        yy=[yy,y+(k-1)*d];
  end
end
fill=8*ones(1,9);
xfpolys(xx,yy,fill);
xclip();
xset('font size',5);
xstring(35,90,'Jogo da Velha');
endfunction
//************************************************************************************
function[]=circulo(a,b)
//plot2d(0,0,-1,"031"," ",[-1,-1,1,1])
arcs=[ a   ;//0.0; // upper left x
       b   ;//0.0; // upper left y
       25.0; // width
       25.0; // height
       0.0; // angle 1
       360*64]; // angle 2
xarcs(arcs,[1])
endfunction
//************************************************************************************
function[retorno]=entcomp(matriz)
retorno = heuristica(matriz);
endfunction
//************************************************************************************
matriz = zeros(3,3)//definicao temporaria
//matriz(1,1) = -1//definicao temporaria humano

//******************************************************************************
function[retorno]=heuristica(matriz)
//int heuristica(void)
//{int i,j;  /*indice*/
// int k,v;  /*indice*/
// int s,t;  /*indice*/
// int cont; /*produz deslocamentos*/
// int A[3][3]; /*copia da matriz*/
// int somalin[8]; /*soma os alinhamentos*/
// int alin_c,alin_h; /*conta os alinhamentos de comp e hum*/
// int condicao,condicao_ant,condicao_atu; /* condicao para rotular a jogada*/
// int soma; /*soma a quantidade de -3 ou +3 nos alinhamentos*/
// int ent_c,ent_h;
// int saida; /* saida de heuristica */
// int joguei; /*Flagues*/
//
//matriz = zeros(3,3)//definicao temporaria
//matriz(1,1) = -1//definicao temporaria humano
//matriz(1,2) =  1//definicao temporaria comp
//
alin_c = 0;
alin_h = 0;
condicao_ant =  10;
condicao_atu =  10;
condicao = 0;
// /*Inicializa a matriz int condjogada[3][3]*/
condjogada = zeros(3,3);
for i=1:3
    for j=1:3
	      condjogada(i,j) = -10;
    end
end
condjogada;
// /*chose e a escolha se sujestao para humano ou comp*/
joguei = 1;
//
winId=progressionbar('Jogo da Velha processando');
realtimeinit(0.1);
cont_time = 0;
//
for i=1:3
//    printf("\n*** Erro i e atualizado\n");
    i;
    for j=1:3
        //alteracao tempo
        cont_time = cont_time + 4;
        realtime(j);
        for cont_time1=1:3
           progressionbar(winId);
        end   
        //alteracao
        condicao_ant =  10;
        condicao_atu =  10;
        condicao = 0;
        //alteracao
        
//        printf("\nDepois o j e atualizado\n");
        j;
   	    // Copia Matriz
//   	    printf("\n Copia Matriz\n");
  	     for k=1:3
   	        for v=1:3
		            A(k,v) = matriz(k,v);
            end
        end
        A;
     	  //---------------------------------------------------*/
      	 if joguei == 0 then
           joguei = 1;
//           printf("\n Nao atualiza o ent_c\n");
      	 else
//      	    printf("\n Atualiza ent_c\n");
  	        ent_c = i*10 + j;//*atribui ent_c*/
	         //Testa se o adversario jogou na casa//
//	         printf("\n Testa o adversario jogou na casa");
     	     //Verifica
//     	     printf("\n Verifica \n");
           select ent_c
                  case 11 then 
                       if matriz(1,1)<>0 then 
			                    joguei = 0;
			                 end  
  	               case 12 then
  	                    if matriz(1,2)<>0 then
        			               joguei = 0;
        			            end  
  	               case 13 then
  	                    if matriz(1,3)<>0 then
        			               joguei = 0;
        			            end   
  	               case 21 then
  	                    if matriz(2,1)<>0 then
       			                joguei = 0;
       			             end  
  	               case 22 then
  	                    if matriz(2,2)<>0 then
        			               joguei = 0;
        			            end   
  	               case 23 then
  	                    if matriz(2,3)<>0 then
       			                joguei = 0;
       			             end  
  	               case 31 then
  	                    if matriz(3,1)<>0 then
 			                    joguei = 0;
 			                 end  
  	               case 32 then
  	                    if matriz(3,2)<>0 then  	         
         		               joguei = 0;
         		            end   
		              case 33 then
		                   if matriz(3,3)<>0 then
      			                 joguei = 0;
      			              end
           end//select ent_c
	         //-----------------------------------------//
           if joguei==0 then
              joguei = 1;
           else
  	           if joguei==0 then
                 joguei = 1;
//                 printf("\n Nao atualiza ent_h\n")
  	           else
		          //------------------------------//
//                 printf("\nInicio da Verificacao da joga Humna\n");
  	              for k=1:3
		                 for v=1:3
  			               ///*Copia Matriz*/
//  			               printf("\nCopia Matriz\n");
			                   for s=1:3
 			                       for t=1:3
               				              A(s,t) = matriz(s,t);
                             end
                         end
                         A;
      			          ///*-----------------------*/
        			              ent_h = k*10 + v; // /*atribui ent_h*/
//			   /*Testa se o adversario jogou na casa*/
//			   /*Verifica*/
                         select ent_h
   		                           case 11 then
   		                                if matriz(1,1)<>0 then
        					                           joguei = 0;
        				                         end  
   		                           case 12 then
   		                                if matriz(1,2)<>0 then
        					                           joguei = 0;
        				                         end	  
   		                           case 13 then
   		                                if matriz(1,3)<>0 then
   					                               joguei = 0;
   					                            end
   		                           case 21 then
   		                               if matriz(2,1)<>0 then
					                              joguei = 0;
					                           end
  		                            case 22 then
  		                                 if matriz(2,2)<>0 then
					                               joguei = 0;
					                            end
   		                            case 23 then
   		                                 if matriz(2,3)<>0 then
					                               joguei = 0;
					                             end
		                              case 31 then
		                                   if matriz(3,1)<>0 then
					                                joguei = 0;
     				                              end 
   		                             case 32 then
   		                                  if matriz(3,2)<>0 then
					                                 joguei = 0;
					                              end
			                            case 33 then 
			                                 if matriz(3,3)<>0 then
					                                joguei = 0;
					                             end
                         end//select ent_h
                         //-----------------------------------------//
             			         //A jogada do humano nao deve considerar
                         //a casa que o computador esta testando//
                         if ent_c == ent_h then
//                            printf("\n ent_c == ent_h \n");
                            joguei = 0;
                         end
                         if joguei==0 then
                            joguei =1;
                         else
                            //*----------------------------------------*/
                            //introduzir o elemento k v na matriz A*/
                            A(k,v) = -1;
             			            //A[k-1][v-1] = -1;
                            //----------------------------------------*/
                            //Coloca +1:Computador
                            for s=1:3
                                for t=1:3
				                            if A(s,t)==0 then
                                       A(s,t)=+1;
                                   end
                                end
                            end
                            A;
                            //-------------------------//
                            //Soma todos os alinnhamentos,coloca casa soma em somalin[8]
                            //zera soma somalin[8]
             			            for s=1:8
				                         somalin(s) = 0;
				                    end
				                    somalin;
			                       //--------------------*/
            			             cont = 1; //produz deslocamentos
            			             soma = 0; //soma os alinhamentos
            			             // soma todas as linhas e coloca nas tres posicoes
            			             for s=1:3
                                for t=1:3
                                    soma = soma + A(s,t);
                                end
                   				         somalin(cont)= soma;
                   				         cont = cont + 1;
                   				         soma = 0;
                   		       end
                   		       somalin;
            			             //*----------------------------//
                            //soma todas as colunas e coloca em tres posicoes//
                            soma = 0; //soma os alinhamentos
            			             for s=1:3
                                for t=1:3
				                             soma = soma + A(t,s);
				                         end    
                    				        somalin(cont) = soma;
                     			        cont = cont + 1;
                    				        soma = 0;
                            end
                            somalin;
                            //------------------------//
            			             //soma todas as duas diagonais e coloca em duas posicoes
            			             soma = 0;
                            //diagonal principal
                            for s=1:3                     
                                soma = soma + A(s,s);
                            end    
                            somalin(cont) = soma;
             		             cont = cont + 1;
             		             somalin;
                            //--------------------//
                            //Diagonal Secundaria//
			                      soma = 0;
            			             for s=0:2
                                soma = soma + A(s+1,3-s);//[s][2-s];
                            end
                            somalin(cont) = soma;
            			             cont = cont + 1;
            			             somalin;
            			             //--------------------
                            //------------------------------------
                            //Conta quantos +3 existem alinhamentos do comp
            			             cont = 0;
            			             for s=1:8
                                if somalin(s)==+3 then
                                   cont = cont + 1;
                                end
                            end    
            			             alin_c = cont;
                            //--------------------------*/
                            //Copia Matriz
                            for s=1:3
                                for t=1:3
				                             A(s,t) = matriz(s,t);
				                         end    
				                     end
				                     A;
                            //----------------------------
                            //Coloca -1:Humano, exceto na casa considerada do comp
                            for s=1:3
                                for t=1:3
                                    if A(s,t)==0 then
				                               if (s==i) & (t==j) then
				                               //sem acao
				                               else
					                                A(s,t)=-1;
					                             end
					                          end
					                       end
					                   end
					                   A;
			                       //---------------------------//
                             //Soma todos os alinnhamentos,coloca casa soma em somalin[8]*/
                             //zera soma somalin[8]
                             for s=1:8
                                 somalin(s) = 0;
                             end
                             somalin;
                             //--------------------//
          			                cont = 1; //produz deslocamentos//
                             soma = 0; //soma os alinhamentos//
                             //soma todas as linhas e coloca nas tres posicoes
                             for s=1:3
                                 for t=1:3
                                     soma = soma + A(s,t);
                                 end
                 				            somalin(cont) = soma;
                 				            cont = cont + 1;
                 				            soma = 0;
                 		          end
                 		          somalin;
                             //----------------------------//
                             //soma todas as colunas e coloca em tres posicoes*/
            			              soma = 0; //soma os alinhamentos//
                             for s=1:3
                                 for t=1:3
                                     soma = soma + A(s,t);
                                 end   
                   				          somalin(cont) = soma;
                   				          cont = cont + 1;
                   				          soma = 0;
                             end
                             somalin;
                            //----------------------------------------------*/
                            //soma todas as duas diagonais e coloca em duas posicoes*/
                            soma = 0;
                            //diagonal principal
                            for s=1:3;
                                soma = soma + A(s,s);
                            end
                            somalin(cont) = soma;
          			               cont = cont + 1;
          			               somalin;
                            //--------------------//
                            //Diagonal Secundaria*/
                            soma = 0;
                            for t=0:2
                                soma = soma + A(t+1,3-t);
                            end
                            somalin(cont) = soma;
            		              cont = cont + 1;
            		              somalin;
                            //--------------------//
                            //--------------------------------------------------//
                            //Conta quantos -3 existem alinhamentos do hum//
                            cont = 0;
                            for s=1:8
                   				         if somalin(s)==-3 then
                                   cont = cont + 1;
                				            end
                            end
                            alin_h = (-1)*cont
                            //condicao para rotular a jogada//
                            alin_h
                            alin_c
                            condicao_atu = alin_h + alin_c
                            condicao_ant
                            condicao
                            if condicao_atu<condicao_ant then
                               condicao = condicao_atu
         		                 else
         			                   condicao = condicao_ant
                            end
                            condicao_ant = condicao; //BUG do prog Turbo C 2.01
                            condicao                          
                         end//if joguei==0 then
                         //---------------------------------------------*/
                         //condicao para rotular a jogada//
//                         condicao_atu = alin_h + alin_c
//                         condicao_ant
//                         condicao
//                         if condicao_atu<condicao_ant then
//                            condicao = condicao_atu
//         		              else
//         			                condicao = condicao_ant
//                         end
//                         condicao_ant = condicao; //BUG do prog Turbo C 2.01
//                         condicao
                   end // for v=1:3
                 end //for k=1:3
//                 condjogada(i-1,j-1) = condicao;
                 condjogada((i+1)-1,(j+1)-1) = condicao
              end//if joguei==0 then
           end//if joguei==0 then
        end//if joguei == 0 then
    end//for j=1:3
end// for i=1:3
retorno  = maximo(condjogada);
endfunction
//********************************************************************************
function[retorno]=maximo(condjogada)
//int maximo()
//{int i,j; /*indices*/
// int max_ant,max_atu,max; /*variavel para maximo*/
 max_ant = -10;
 max_atu = 0;
 max_ = 0;
 for i=1:3
     for j=1:3
         max_atu = condjogada(i,j);
   	     if max_atu>max_ant then
            max_ = (i)*10 + (j);
            max_ant = max_atu;
         end
     end
 end   
retorno = max_;
//
winclose(winId);
//
endfunction
//********************************************************************************


//************************************************************************************
function[]=imprimi_matriz(matriz)
printf("\nMatriz:funcao principal2()\n");
for i =1:size(matriz,1)
   for j =1:size(matriz,2)
       printf("%f",matriz(i,j));
   end
   printf("\n");
end
endfunction


