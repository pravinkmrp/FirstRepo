README

Copy the jar to current folder

Run one of the below commands
```
1. java -jar .\target\demo-1.0-SNAPSHOT-jar-with-dependencies.jar -f node.csv
2. java -jar .\target\demo-1.0-SNAPSHOT-jar-with-dependencies.jar -f node.csv -c cluster.csv
3. java -jar .\target\demo-1.0-SNAPSHOT-jar-with-dependencies.jar -f node.csv -c cluster.csv -p preferredlist.csv
4. java -jar .\target\demo-1.0-SNAPSHOT-jar-with-dependencies.jar -d C:\Users\folder\work\projects\graph-poc\MasterMonolithicJavaApp -l src\main\java\\
5. java -jar .\target\demo-1.0-SNAPSHOT-jar-with-dependencies.jar -d C:\Users\folder\work\projects\graph-poc\MasterMonolithicJavaApp -l src\main\java\\ -p preferredlist.csv
```
```
Sample:node.csv
node1,node2
A,B
B,C
C,D
B,E
B,F
F,A

Sample: cluster.csv
node1,cluster
A,cluster1
B,cluster4
C,cluster3
F,cluster2

Sample: preferredlist.csv
header1
E

```
