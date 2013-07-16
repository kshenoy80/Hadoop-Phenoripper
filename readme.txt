su tutti i pc del cluster:
1) creare un nuovo user
   sudo adduser userhadoop
   password user
2) creare la cartella homes in root 
   sudo mkdir /homes/
3) impostare permessi alla cartella homes e cambiare il proprietario
   sudo chmod -R 777 /homes
   sudo chown userhadoop: /homes
4) inserire l'hostname del pc in /etc/hostname e l'hostname di tutti i nodi in /etc/hosts
5) scaricare MCR Matlab Compiler Runtime(non incluso nel repository, 1.2+ GB) e installarlo seguendo le sue istruzioni
6) copiare la cartella phenoripper dal repository su tutti i pc del cluster

solo sul master
1) copiare tutto il repository nella home di userhadoop
2) aprire hadoop/BuildMultiSetup e modificare MASTER e SLAVE_LISTS con gli hostname scritti in /etc/hosts
   MASTER=pc05
   SLAVE_LISTS="pc08 pc02 pc18"
3) eseguire BuildMultiSetup
   hadoop/BuildMultiSetup
4) impostare il config di hadoop con quello generato dallo script di flor(dalla home di userhadoop)
   sethdpconf hadoopmulti/confmulti/
5) formattare namenode e datanode
    hadoop namenode -format
    hadoop datanode -format
6) far partire i daemons
    start-all.sh
7) generare un input dallo script python inputGen.py (genera coppie di parametri)
    python inputGen.py -> genParameters.txt
8) portare genParameters.txt sul dfs:
    hadoop fs -put genParameters.txt ~/input.txt
9) impostare il path di tutti i parametri di phenoripper in phenomapper.py(dovrebbero già essere okay se tutto è fatto come scritto qua)
10) avviare il job sul master
    hadoop jar /usr/share/hadoop/contrib/streaming/hadoop-streaming-1.1.2.jar -D mapred.reduce.tasks=0 -inputformat org.apache.hadoop.mapred.lib.NLineInputFormat -file phenomapper.py -mapper phenomapper.py -input ~/input.txt -output ~/out
