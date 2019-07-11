
Renan sugestões

Grafos antes e depois -3 -2, -0.5 0.5   - PFC e SI gam, 

dois critérios: Melhor assortatividade, Mesmos parâmetros

Corrigir células automatas - mostrar diferenças controle e diferença

Motifs ?

wn = wgn(370000,1,-20); - > parâmetro para sinal ruído

~ Average degree of neighbor (mit_code) ~ 

scatter( k, ave_n_deg) 

k = definição em degree distribution

ave...= output da função mit


~~~~~~~~~~

tort

tirar o filtro de alpha

- realizar em um sem normalização para ver se fica identico 

LFPy



__________________________________________________________________________


Basic Process

> rat1 or rat 2 

( carregar os dados )

> [t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[3 3],1000);

Filtra entre >0.1<100 Hz
Separa intervalo dos eventos 
Transforma 500 Hz a taxa de amostragem
Concatena
________________________________________________________________________

Graph builds

> [nodos]= v_clocalmaximum(data1,zscore,win,m);

> [control_distance_ij,C] = small_distance(data1,nodos);

> plot(control_distance_ij);

Verificar intervalo de valores para distância.  

>  [data2]= graph_density(data1,nodos,control_distance_ij,C, interval)

> Derive a densidade do gráfico pela distância : [y] = derivative (data2);

> plot a derivada em função da distância: plot(data2(:,1),y(:,1));

Separar o D máximo threshold para o grafo: thres

> [gp,thres,net]= small_graph(nodos,C, thres,control_distance_ij);

> graph_visualization(control_distance_ij,gp, thres);

Graph analyses

> Big_auto_assxnodes_area  ( gera grafos com nodos dinâmicos análisando 
assortatividade) 

> plot_clusteringxnodes  

> plot_efficiencylocalxnodes

> plot_assort_nodesvar ( plotagem de assortatividade x nodos por região. 
Lembrar de carregar a structure AxN)

> bestgraph

> bp_graph_analises


Tools coulp help: 

> v_bestatistical(data1);

Basics statisticals

> s_fft(data, fs)

FFT

> [r,pk]=assortativity(net);

> assxnodes_anysignal(wn,name_variable,pathtosave);
 Automation of any signal



