//**********************************************************************************
//Botoes de dialogo na caixa de  dialogo
answ=buttondialog("Programa Algoritmo de Busca A*\nEsse programa foi criado para implementação do algoritmo de busca A*\nTravalho número 01 de controle Inteligente\nPara começar leia a tela de mansagem e escolha o tipo de entrada\nImplementado por Fabiano de Sousa Pessoa em 19/05/2006","ok");
//**********************************************************************************

//**********************************************************************************
//Esplicações sobre o programa
x_message_modeless(['DESCRIÇÃO DO ALGORITMO DE BUSCA A*'
                    'O seguinte trabalho destina-se a escrever, na linguagem Scilab-3.1.1,'
                    'um programa que use a estratégia de busca A*.'
                     ' '
                     'O algoritmo A*  consiste  no caminho de menor custo  do nó de partida até o nó objetivo' 
                     'considerando  obstáculos entre  os dois nós.  Dessa forma,  este algoritmo é  aplicável'
                     'quando  se dispõe  de uma  função e  avaliação heurística do custo, denotada de   f(.).'
                     'Nessa aplicação, o custo incorrido ao percorrer, a partir de S, um certo  caminho até o'
                     'nó N, pode ser calculado  através de  uma função  g(.). Se  for disponível  uma  função'
                     'heurística  h(.) que  permite  estimar o  custo para  percorrer  a árvore de N até o nó'
                     'objetivo G(goal), então, f(N)= g(N)+h(N).'
                     ''
                     'Essa algoritmo possui duas entrada possíveis. Pelo arquivo em bloco de  notas  txt.  ou' 
                     'através das caixas de diálogo que serão apresentadas na sequência do programa'
                     ''
                     ''
                     ''
                     'Implementado por Fabiano de Sousa Pessoa'
                     'Click em ""Ok"" para fechar a mensagem']);
//**********************************************************************************

////************************************************************************************
function[]=branco(cor)
rect=[0,0,100,100];
plot2d(0,0,[0],'012','leg',rect);
xclip('clipgrf');
x=[0 100 100 0   0]';
y=[0   0 100 100 0]';
fill=cor*ones(1,1);
xfpolys(x,y,fill);
xclip();
endfunction
//***********************************************************************************
//void maberto(void)
function[]=maberto(marca,linsucessores,colsucessores,custosucessores,g,nl,nc,hr,vr,dg,m,inf_esqx,inf_dirx,sup_dirx,sup_esqx,inf_esqy,inf_diry,sup_diry,sup_esqy)
//=expande(linha,coluna,g,nl,nc,hr,vr,dg,m,inf_esqx,inf_dirx,sup_dirx,sup_esqx,inf_esqy,inf_diry,sup_diry,sup_esqy)
//{int i,j; /* indices */
// int menor; /* variavel que contem o menor custo*/
// int indmenor; /* indice que contem o menor custo */
// int linmenor; /*linha do no de menor custo*/
// int colmenor; /*coluna do no de menor custo*/
// /*identificar qual no de sucessores tem o menor custo*/
// /* colocar registradores de posicao em custo regini e regfin*/
// menor = custosucessores[regini];
// for(i=regini;i<regfin;i++)
//    {/*procura o custo menor e quarda a posicao do vetor custosucessores*/
//     if(menor>custosucessores[i])
//       {indmenor = i;
//	menor = custosucessores[i];
//       }
//    }
//procura o custo menor e quarda a posicao do vetor custosucessores
menor = custosucessores(1,1);
for i=1:size(custosucessores,1)
    if (menor >= custosucessores(i,1))&(custosucessores(i,1)<>0) then
       indmenor = i;
       menor = custosucessores(i,1);
    end
end

//tenho menor: menor valor da funcao custo*/
//tenho o  indmenor: posicao do vetor custo*/
//
linmenor = linsucessores(indmenor,2);
colmenor = colsucessores(indmenor,2);
printf("\n***Coordenada do proximo no selecionado:***\n");
printf("\nlinmenor:%d",linmenor);
printf("\ncolmenor:%d",colmenor);
printf("\n");
//introduzir preenchimento do no escolhino na tela
//nobusca(colmenor+1,linmenor+1,indmenor);
//
// if(matriz[linmenor][colmenor]!=3)
//   {nobusca(colmenor+1,linmenor+1,indmenor);
//    expande(linmenor,colmenor);
//   }
if  m(linmenor,colmenor)<>3 then
    xpause(2E6);
   //Obstaculos sao quadrados pretos
   //
   coor_x = size(m,1) - linmenor + 1;
   coor_y = colmenor;
   xx=[inf_esqx(coor_x,coor_y),inf_dirx(coor_x,coor_y),sup_dirx(coor_x,coor_y),sup_esqx(coor_x,coor_y),inf_esqx(coor_x,coor_y)]';
   yy=[inf_esqy(coor_x,coor_y),inf_diry(coor_x,coor_y),sup_diry(coor_x,coor_y),sup_esqy(coor_x,coor_y),inf_esqy(coor_x,coor_y)]';
   fill = 4*ones(1,1);
   xfpolys(xx,yy,fill);
   
end
///* expande(linmenor,colmenor);*/
expande(marca,linmenor,colmenor,g,nl,nc,hr,vr,dg,m,inf_esqx,inf_dirx,sup_dirx,sup_esqx,inf_esqy,inf_diry,sup_diry,sup_esqy)
//}
endfunction
//************************************************************************************

//**********************************************************************************
function[]=expande(marca,linha,coluna,g,nl,nc,hr,vr,dg,m,inf_esqx,inf_dirx,sup_dirx,sup_esqx,inf_esqy,inf_diry,sup_diry,sup_esqy)
descoluna = 1;//armazenar na primeira coluna o no que sera expandido
linsucessores = zeros(8,2);
colsucessores = zeros(8,2);
custosucessores = zeros(8,1);
marca(linha,coluna) = 1;//marca a posicao para nao voltar la
for i = 1:8
    linsucessores(i,descoluna) = linha;
    colsucessores(i,descoluna) = coluna;
end
descoluna = 2;//armazenar na segunda coluna os nos de expansao
deslinha = 1;
// /*Comeca expandindo o no de entrada*/
//descoluna = descoluna + 1;
regini = deslinha;
for i=1:4
    if i==1 then//Expansao Horizontal
       //{/* No Direito */
       if coluna<=(size(m,2)) then//limite lateral direito
          if (m(linha,coluna+1)<>1)&(marca(linha,coluna+1)<>1) then //cosidera os obstaculos
             linsucessores(deslinha,descoluna) = linha;             //posicoes ja ocupadas
             colsucessores(deslinha,descoluna) = coluna + 1;
             custosucessores(deslinha) = g(linha,coluna+1) + hr;
             deslinha = deslinha + 1;             
          end          
       end
       // * No Esquerdo */
       if coluna>1 then//limite lateral esquerdo
          if (m(linha,coluna-1)<>1)&(marca(linha,coluna-1)<>1) then //considera os obstaculos
             linsucessores(deslinha,descoluna) = linha;             //posicoes ja ocupadas
             colsucessores(deslinha,descoluna) = coluna - 1;
             custosucessores(deslinha) = g(linha,coluna-1) + hr;
             deslinha = deslinha + 1;
          end//if m(linha,coluna-1)<>1 then //considera os obstaculos
       end//if coluna>=1 then
    end//if i==0 then
    //* Expansao Vertical */
    if i==2 then
       //* No de Cima */
       if linha>1 then//limite superio
          if (m(linha-1,coluna)<>1)&(marca(linha-1,coluna)<>1) then//considera obstaculos
             linsucessores(deslinha,descoluna) = linha - 1;        //posicoes ja ocupadas
             colsucessores(deslinha,descoluna) = coluna;
             custosucessores(deslinha) = g(linha-1,coluna) + vr;
             deslinha = deslinha + 1;
          end//if m(linha-1,coluna)<>1 then//cosidera obstaculos          
       end//if linha>=1 then
       //* No de Baixo */
       if linha<size(m,1) then //limite inferior
          if (m(linha+1,coluna)<>1)&(marca(linha+1,coluna)<>1) then //cosidera os obstaculos
             linsucessores(deslinha,descoluna)=linha + 1;//posicoes ja ocupadas
             colsucessores(deslinha,descoluna) = coluna;
             custosucessores(deslinha) = g(linha+1,coluna) + vr;
             deslinha = deslinha + 1;
          end//if m(linha+1,coluna)<>1 then//cosidera os obstaculos
       end//if linha<(lin-1) then
    end//if i==1 then
    //* Expansao Diagonal Principal*/
    //if(i==2)
    if i==3 then
       //{/* No de Cima */
       //no de cima       
       if (linha>1)&(coluna>1) then//limite diagonal principal no superior
          if (m(linha-1,coluna-1)<>1)&(marca(linha-1,coluna-1)<>1) then//considera obstaculos          
             linsucessores(deslinha,descoluna)=linha - 1;//posicoes ja ocupadas
             colsucessores(deslinha,descoluna) = coluna - 1;
             custosucessores(deslinha)= g(linha-1,coluna-1) + dg;
             deslinha = deslinha +1;
          end//if m(linha-1,coluna-1)<>1 then//considera obstaculos          
       end//if (linha>=1)&(coluna>=1) then
       //No de Baixo */
       if (linha<size(m,1))&(coluna<size(m,2)) then//Limite diagonal principal no inferior
          if (m(linha+1,coluna+1)<>1)&(marca(linha+1,coluna+1)<>1) then//considera obstaculos//posicoes ja ocupadas
             linsucessores(deslinha,descoluna) = linha  + 1;//posicoes ja ocupadas
             colsucessores(deslinha,descoluna) = coluna  + 1;
             custosucessores(deslinha) = g(linha+1,coluna+1) + dg;
             deslinha= deslinha + 1;
          end//if m(linha_1,coluna+1)<>1 then
       end//if m(linha_1,coluna+1)<>1 then
    end
       // Expansao Diagonal Secundaria*/
       if i==4 then//diagonal secundaria
//       {/* No de Cima */
         if (linha>1)&(coluna<size(m,2)) then//Limite diagonal secundaria no de cima
            if (m(linha-1,coluna+1)<>1)&(marca(linha-1,coluna+1)<>1) then//considera obstaculos//posicoes ja ocupadas
               linsucessores(deslinha,descoluna) = linha - 1;//posicoes ja ocupadas
               colsucessores(deslinha,descoluna)=coluna + 1;
               custosucessores(deslinha)=g(linha-1,coluna+1) + dg;
               deslinha = deslinha + 1;
            end  
         end
         //No de Baixo */
         if (linha<size(m,1))&(coluna>1) then//Limite diagonal secundaria no inferior
            if (m(linha+1,coluna-1)<>1)&(marca(linha+1,coluna-1)<>1) then//considera obstaculos
               linsucessores(deslinha,descoluna) = linha + 1;
               colsucessores(deslinha,descoluna)= coluna - 1; 
               custosucessores(deslinha)=g(linha+1,coluna-1) + dg;
               deslinha = deslinha + 1;
            end//if m(linha+1,coluna-1)<>1 then
         end//if (linha<(lin-1))&(coluna>=1) then
       end//if i==3 then
end//for i = 1:4
//imprimir os dados obtidos da expansao
printf("\n*** Dados da expansao**\n");
for i =1:size(linsucessores,1)
    printf("\n********************\n");
    printf("\nLinsucessores:%d",linsucessores(i,2));
    printf("\nColsucessores:%d",colsucessores(i,2));
    printf("\nCustosucessores:%d",custosucessores(i));
end

//*****************
printf("\n");
// regfin = deslinha;
// maberto();
printf("\n***Inicio da funcao maberto***\n")
//maberto(linsucessores,colsucessores,custosucessores,m,inf_esqx,inf_dirx,sup_dirx,sup_esqx,inf_esqy,inf_diry,sup_diry,sup_esqy);
maberto(marca,linsucessores,colsucessores,custosucessores,g,nl,nc,hr,vr,dg,m,inf_esqx,inf_dirx,sup_dirx,sup_esqx,inf_esqy,inf_diry,sup_diry,sup_esqy);
//chamada para a funcao que coloca o no em aberto
endfunction
//**********************************************************************************

//************************************************************************************
function[]=A_estrela(inf_esqx,inf_dirx,sup_dirx,sup_esqx,inf_esqy,inf_diry,sup_diry,sup_esqy,nl,nc,hr,vr,dg,m)
//
////Obstaculos sao quadrados pretos
////-----------------------------------------------------------------------------------
//coor_x = 3;
//coor_y = 5;
//xx=[inf_esqx(coor_x,coor_y),inf_dirx(coor_x,coor_y),sup_dirx(coor_x,coor_y),sup_esqx(coor_x,coor_y),inf_esqx(coor_x,coor_y)]';
//yy=[inf_esqy(coor_x,coor_y),inf_diry(coor_x,coor_y),sup_diry(coor_x,coor_y),sup_esqy(coor_x,coor_y),inf_esqy(coor_x,coor_y)]';
//fill = 1*ones(1,1);
//xfpolys(xx,yy,fill);
////-----------------------------------------------------------------------------------
////Partida sao quadrados amarelos
////-----------------------------------------------------------------------------------
//coor_x = 1;
//coor_y = 5;
//xx=[inf_esqx(coor_x,coor_y),inf_dirx(coor_x,coor_y),sup_dirx(coor_x,coor_y),sup_esqx(coor_x,coor_y),inf_esqx(coor_x,coor_y)]';
//yy=[inf_esqy(coor_x,coor_y),inf_diry(coor_x,coor_y),sup_diry(coor_x,coor_y),sup_esqy(coor_x,coor_y),inf_esqy(coor_x,coor_y)]';
//fill = 7*ones(1,1);
//xfpolys(xx,yy,fill);
////-----------------------------------------------------------------------------------
////Objetivo sao quadrados vermelho
////-----------------------------------------------------------------------------------
//coor_x = 5;
//coor_y = 5;
//xx=[inf_esqx(coor_x,coor_y),inf_dirx(coor_x,coor_y),sup_dirx(coor_x,coor_y),sup_esqx(coor_x,coor_y),inf_esqx(coor_x,coor_y)]';
//yy=[inf_esqy(coor_x,coor_y),inf_diry(coor_x,coor_y),sup_diry(coor_x,coor_y),sup_esqy(coor_x,coor_y),inf_esqy(coor_x,coor_y)]';
//fill = 5*ones(1,1);
//xfpolys(xx,yy,fill);
////-----------------------------------------------------------------------------------

//Inicio da algorimo A*
//de acordo com a matriz
for i=1:(size(m,1))
    for j=1:(size(m,2))
        if m(i,j)== 1 then
           //Obstaculos sao quadrados pretos
           //-----------------------------------------------------------------------------------
           coor_x = 1 + (size(m,1)) - i;
           coor_y = j;
           xx=[inf_esqx(coor_x,coor_y),inf_dirx(coor_x,coor_y),sup_dirx(coor_x,coor_y),sup_esqx(coor_x,coor_y),inf_esqx(coor_x,coor_y)]';
           yy=[inf_esqy(coor_x,coor_y),inf_diry(coor_x,coor_y),sup_diry(coor_x,coor_y),sup_esqy(coor_x,coor_y),inf_esqy(coor_x,coor_y)]';
           fill = 1*ones(1,1);
           xfpolys(xx,yy,fill);
           //-----------------------------------------------------------------------------------           
        end
        if m(i,j)==2 then
           //Partida sao quadrados amarelos
           //-----------------------------------------------------------------------------------
           coor_x = 1 + (size(m,1)) - i;
           coor_y = j;
           xx=[inf_esqx(coor_x,coor_y),inf_dirx(coor_x,coor_y),sup_dirx(coor_x,coor_y),sup_esqx(coor_x,coor_y),inf_esqx(coor_x,coor_y)]';
           yy=[inf_esqy(coor_x,coor_y),inf_diry(coor_x,coor_y),sup_diry(coor_x,coor_y),sup_esqy(coor_x,coor_y),inf_esqy(coor_x,coor_y)]';
           fill = 7*ones(1,1);
           xfpolys(xx,yy,fill);
           //-----------------------------------------------------------------------------------                   
        end
        if m(i,j)==3 then
           //Objetivo sao quadrados vermelho
           //-----------------------------------------------------------------------------------
           coor_x = 1 + (size(m,1)) - i;
           coor_y = j;
           xx=[inf_esqx(coor_x,coor_y),inf_dirx(coor_x,coor_y),sup_dirx(coor_x,coor_y),sup_esqx(coor_x,coor_y),inf_esqx(coor_x,coor_y)]';
           yy=[inf_esqy(coor_x,coor_y),inf_diry(coor_x,coor_y),sup_diry(coor_x,coor_y),sup_esqy(coor_x,coor_y),inf_esqy(coor_x,coor_y)]';
           fill = 5*ones(1,1);
           xfpolys(xx,yy,fill);
           //-----------------------------------------------------------------------------------                   
        end
    end
end
//****************************************************************************
//void crimtrzgarq(void)
//{int i,j; /*indices*/
// int coorl,coorc; /*indice que quarda a posicao do objetivo */
// int cont; /*contador*/
// int flag; /*flags*/
// coorl = 0;
// coorc = 0;
// /*Inicializa a matriz g com um valor muito alto*/
// for(i=0;i<12;i++)
//    {for(j=0;j<14;j++)
//	{g[i][j] = 10;
//	}
//    }
// /*---------------------------------------------*/
g = 10*ones(size(m,1),size(m,2));
// /*Procura a posicao do objetivo*/
// for(i=0;i<lin;i++)
//    {for(j=0;j<col;j++)
//	{if(matriz[i][j]==3)
//	   {g[i][j] = 0;
//	    coorl = i;
//	    coorc = j;
//	   }
//	}
//    }
for i=1:size(m,1)
    for j=1:size(m,2)
        if m(i,j)==3 then
           g(i,j) = 0;
           coorl = i;
           coorc = j;
        end
    end
end
// /*----------------------------*/
// /*Fixa linha e varia a coluna da esq para a dir*/
 flag = 0;
 cont = 0;
// for(j=0;j<col;j++)
//    {if( (g[coorl][j]==0) || (flag==1) )
//       {g[coorl][j]= cont;
//	cont = cont + 1;
//	flag = 1;
//       }
//    }
for j=1:size(m,2)
   if (g(coorl,j)==0)|(flag==1) then
      g(coorl,j) = cont;
      cont =cont + 1;
      flag = 1;
   end
end
// /*---------------------------*/
// /*Fixa coluna e varia a linha da baixo para cima*/
 flag = 0;
 cont = 0;
// for(i=0;i<lin;i++)
//    {if( (g[i][coorc]==0) || (flag==1) )
//       {g[i][coorc] = cont;
//	cont = cont + 1;
//	flag = 1;
//       }
//    }
for i =1:size(m,1)
    if (g(i,coorc)==0)|(flag==1) then
       g(i,coorc) = cont;
       cont  =cont + 1;
       flag = 1;
    end
end
// /*---------------------------*/
// /*Fixa linha e varia a coluna da direta para aesquerda*/
 flag = 0;
 cont = 0;
// for(j=(col-1);j>=0;j--)
//    {if( (g[coorl][j]==0) || (flag==1) )
//       {g[coorl][j]= cont;
//	cont = cont + 1;
//	flag = 1;
//       }
//    }
for j=size(m,2):-1:1
    if (g(coorl,j)==0)|(flag==1) then
       g(coorl,j) = cont;
       cont = cont + 1;
       flag = 1;
    end
end
// /*---------------------------*/
// /*Fixa coluna e varia a linha da cima para a baixo*/
 flag = 0;
 cont = 0;
// for(i=(lin-1);i>=0;i--)
//    {if( (g[i][coorc]==0) || (flag==1) )
//       {g[i][coorc] = cont;
//	cont = cont + 1;
//	flag = 1;
//       }
//    }
for  i=size(m,1):-1:1
     if (g(i,coorc)==0)|(flag==1)then
        g(i,coorc)= cont;
        cont = cont+1
        flag=1;
     end
end
// /*---------------------------*/
// /*Preenche as linhas a esqueda da cruz*/
// for(i=0;i<lin;i++)
//    {flag = 0;
//     cont = 0;
//     for(j=0;j<col;j++)
//	{if( (j==coorc) || (flag==1) )
//	   {g[i][j]= cont + g[i][coorc];
//	    cont = cont + 1;
//	    flag = 1;
//	   }
//	}
//    }
for i=1:size(m,1)
    flag=0;
    cont=0;
    for j=1:size(m,2)
        if (j==coorc)|(flag==1)then
           g(i,j) = cont + g(i,coorc);
           cont = cont + 1;
           flag = 1;           
        end
    end
end
// /*---------------------------*/
// /*Preenche as linhas a direita da cruz*/
// for(i=(lin-1);i>=0;i--)
//    {flag = 0;
//     cont = 0;
//     for(j=(col-1);j>=0;j--)
//	{if( (j==coorc) || (flag==1) )
//	   {g[i][j]= cont + g[i][coorc];
//	    cont = cont + 1;
//	    flag = 1;
//	   }
//	}
//    }
for i=size(m,1):-1:1
    flag=0;
    cont=0;
    for j=size(m,2):-1:1
        if (j==coorc)|(flag==1) then
           g(i,j)=cont+g(i,coorc);
           cont = cont + 1;
           flag = 1;
        end
    end
end
// /*---------------------------*/
// /*Preenche as colunas a cima para baixo*/
// for(i=0;i<col;i++)
//    {flag = 0;
//     cont = 0;
//     for(j=0;j<lin;j++)
//	{if( (j==coorl) || (flag==1) )
//	   {g[j][i]= cont + g[coorl][i];
//	    cont = cont + 1;
//	    flag = 1;
//	   }
//	}
//    }
for i=1:size(m,2)
    flag=0;
    cont=0;
    for j=0:size(m,1)
        if (j==coorl)|(flag==1)then
           g(j,i) = cont + g(coorl,i);
           cont = cont +1;
           flag =1;
        end
    end
end
// /*---------------------------*/
// /*Preenche as colunas a baixo para cima*/
// for(i=(col-1);i>=0;i--)
//    {flag = 0;
//     cont = 0;
//     for(j=(lin-1);j>=0;j--)
//	{if( (j==coorl) || (flag==1) )
//	   {g[j][i]= cont + g[coorl][i];
//	    cont = cont + 1;
//	    flag = 1;
//	   }
//	}
//    }
for i=size(m,2):-1:1
    flag = 0;
    cont=0;
    for j =size(m,1):-1:1
        if (j==coorl)|(flag==1)then
          g(j,i)=cont+g(coorl,i)
          cont =cont +1 ;
          flag=1;
        end
    end
end
// /*---------------------------*/
//imprimir a matriz cirada
printf("\nImprimi a matriz g criada\n");
for i=1:size(g,1)
    for j=1:size(g,2)
        printf("%3.0f",g(i,j));        
    end
    printf("\n");
end
// algoritmo();
//}
///*-------------------------------------------------------------------------*/
//void algoritmo(void)
//{
// int i,j;  /*indices*/
// int coorc,coorl; /*coordenadas consideradas*/
//
// /*Procura a posicao de partida*/
// for(i=0;i<lin;i++)
//    {for(j=0;j<col;j++)
//	{if(matriz[i][j]==2)
//	   {coorc = j;
//	    coorl = i;
//	   }
//	}
//    }
for i=1:size(m,1)
    for j=1:size(m,2)
        if m(i,j)==2 then//alteracao de matriz por m
           coorc = j;
           coorl = i;
        end
    end
end
// /*-----------------------------*/
//
//Marcar o no que sera espandido para que eu nao entre novamente
marca = zeros(nl,nc);
// /*Envia o no de partida para expande*/
expande(marca,coorl,coorc,g,nl,nc,hr,vr,dg,m,inf_esqx,inf_dirx,sup_dirx,sup_esqx,inf_esqy,inf_diry,sup_diry,sup_esqy);//
// /*----------------------------------*/
//}
///*------------------------------------------------------------------------*/

endfunction
//**********************************************************************************

//**********************************************************************************
function[]=layout2(nl,nc,hr,vr,dg,m)
//entrada
//
//nl = 3;
//nc = 4;
//
//Inserir os retangulos
rect=[0,0,100,100];
plot2d(0,0,[0],'012','leg',rect);
xclip('clipgrf');
//x=[0 25 25 0 0]'+ 12*ones(5,1);
//y=[0 0 25 25 0]'+ 12*ones(5,1);
col = 100/nc;
lin_ = 100/nl; 
x=[0 col col 0 0]'  ;//+0*ones(5,1);
y=[0 0 lin_ lin_ 0]';//+0*ones(5,1);
dx=col*[1 1 1 1 1]';
dy=lin_*[1 1 1 1 1]';;
xx=[];
yy=[];
i=0;
//alteracao:definicao das matrizes de coordenadas
//quardam a coordenada em x
inf_esqx = zeros(nl,nc);
inf_dirx = zeros(nl,nc);
sup_esqx = zeros(nl,nc);
sup_dirx = zeros(nl,nc);
//quardam a coordenada em y
inf_esqy = zeros(nl,nc);
inf_diry = zeros(nl,nc);
sup_esqy = zeros(nl,nc);
sup_diry = zeros(nl,nc);
//
desl = 0;
for k=1:nl
    //desl = 0;//delocamento xx e yy
    for l=1:nc
        xx=[xx,(l-1)*dx+x];
        yy=[yy,y+(k-1)*dy];
        //alteracao: guardar os valores dos retangulos
        //em quatro matrizes cada uma com uma coordenada
        desl = desl + 1;
        inf_esqx(k,l)=xx(1,desl);
        printf("\ninf_esqx(k,l):%f",inf_esqx(k,l));
        inf_dirx(k,l)=xx(2,desl);
        printf("inf_dirx(k,l):%f",inf_dirx(k,l));        
        sup_dirx(k,l)=xx(3,desl);
        printf("sup_esqx(k,l):%f",sup_dirx(k,l));        
        sup_esqx(k,l)=xx(4,desl);
        printf("sup_dirx(k,l):%f",sup_esqx(k,l));        
        inf_esqy(k,l)=yy(1,desl);
        printf("inf_esqy(k,l):%f",inf_esqy(k,l));        
        inf_diry(k,l)=yy(2,desl);
        printf("inf_diry(k,l):%f",inf_diry(k,l));        
        sup_diry(k,l)=yy(3,desl);
        printf("isup_esqy(k,l):%f",sup_diry(k,l));        
        sup_esqy(k,l)=yy(4,desl);
        printf("sup_diry(k,l):%f\n",sup_esqy(k,l));        
  end
end
fill=8*ones(1,nl*nc);
xfpolys(xx,yy,fill);
xclip();
//Escrever o título
xset('font size',5);
xstring(35,100,'Algoritmo A*');
A_estrela(inf_esqx,inf_dirx,sup_dirx,sup_esqx,inf_esqy,inf_diry,sup_diry,sup_esqy,nl,nc,hr,vr,dg,m);
endfunction
//************************************************************************************

//************************************************************************************
//Inicio da construçào do Labirinto
//Entrada de dados
function[]=Layout(nl,nc,hr,vr,dg,m)
printf("\n*** Programa da Incialização da Tela principal de Labirinto***\n");
printf("\n Matriz de Labirinto:\n");
for i =1:nl
    for j =1:nc
        printf("%.0f ",m(i,j));
    end
    printf("\n");
end
printf("\n nl:%d",nl);
printf("\n nc:%d",nc);
printf("\n hr:%f",hr);
printf("\n vr:%f",vr);
printf("\n dg:%f",dg);
//Inicio da construção da Tela principal cor da tela
branco(4);
//Preenchimento da tela com a matriz de quadrados
printf("\nEntrada na função:layout2()\n");
layout2(nl,nc,hr,vr,dg,m);
endfunction
//**********************************************************************************

//**********************************************************************************
function[retorno] = Ent_caixa() 
//Perguntar sobre o numero de linha o numero de colunas e os custos
//Pagina 1
txt=['Número(s) de linha(s)';'Número(s) de coluna(s)'];
sig=x_mdialog('Entre com a configuração do labirinto',txt,['0';'0']);
nl=evstr(sig(1))
nc=evstr(sig(2))
//Pagina 2
txt=['Custo Horizontal';'Custo Vertical';'Custo Diagonal'];
sig=x_mdialog('Entre os valores de custo',txt,['0';'0';'0']);
hr=evstr(sig(1))
vr=evstr(sig(2))
dg=evstr(sig(3))
//Pagina3
//entrada do labirinto
condicao = 0;//incializacao
while condicao==0
      m=evstr(x_dialog('Entre com a configuração da matriz labirito',['[0 0 0';'0 0 0';'0 0 0]']));
      if (size(m,1)==nl) & (size(m,2)==nc) then
         condicao =1;
      else
answ=buttondialog("Matriz de configuração não possui as dimenções especificadas\nTente outra vêz\nImplementado por Fabiano de Sousa Pessoa em 19/05/2006","ok");      
         condicao =0;
      end      
end//while condicao==1
retorno = m;
Layout(nl,nc,hr,vr,dg,m);
endfunction
//**********************************************************************************

//**********************************************************************************
//Falta uma funcao para inicializar o arquivo escrevendo nele valores de ex.
////Leitura do arquivo em txt
function[] = Ent_txt()
printf("***\n Entrada para o txt em processo ***\n")
u = mopen('LABIRI.txt','r');
nl = mfscanf(u,'%d');
nc = mfscanf(u,' %d');
hr = mfscanf(u,' %d');
vr = mfscanf(u,' %d\n');
//printf("%d %d %d %d",nl,nc,hr,vr);
matriz = zeros(nl,nc);
for i=1:nl
    for j=1:nc
        if j==nc then
           matriz(i,j) = mfscanf(u,'%d\n');
        else   
           matriz(i,j) = mfscanf(u,'%d ');
        end
        printf(" %d",matriz(i,j));
    end
    printf("\n");
end
dg = ( (hr^2) + (vr^2) )^(1/2);
Layout(nl,nc,hr,vr,dg,matriz);
mclose(u);
endfunction
//**********************************************************************************


//**********************************************************************************
answ = buttondialog("Escolha o método de entrada\nImplementado por Fabiano de Sousa Pessoa em 19/05/2006","Blco de notas|Cx de Diálogo");
escolha = answ;
if answ == '1' then
   Ent_txt();
end
if answ == '2' then
   Ent_caixa();
end
//**********************************************************************************

//**********************************************************************************
////adiciona menu na barra de ferramentas
addmenu(0,'Inicio',['Ler Bloco txt';'Ler Cx Dialogo';'Ler Mouse']);
Inicio_0=['disp(''Ler Bloco txt'')';'disp(''Ler Cx Dialogo'')';'disp(''Ler Mouse'')'];
//**********************************************************************************



