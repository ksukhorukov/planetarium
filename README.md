## Instructions

* Execute:

 ```
    gem install bundler
    bundle install
 ```

*  Edit config.rb and enter there your credentials, also edit planetlab.py 
*  Go to http://monitor.planet-lab.eu/monitor/node 
   filter nodes by status, form a huge list of nodes, one hostname perline.

It can be done with parser:

```
$ head copy_paste_nodes.txt 
1012	uninaonelab	planetlab01.dis.unina.it	online	3 hrs ago	False 
15198	darmstadtple	host1.planetlab.informatik.tu-darmstadt.de	online	13 min ago	False 
...

$ ./parser copy_paste_nodes.txt > nodes.txt
$ head nodes.txt 

dplanet2.uoc.edu 
planetlab2.research.nicta.com.au 
planetlab1.informatik.uni-wuerzburg.de 
```


* Execute:
  `chmod +x *.rb && chmod +x *.php && chmod +x *.py`
* Upload *.php scripts to your webserver directory, create there phonelog.txt, set it writable. Set PHP scripts executable.
* `./pinger.rb nodes.txt > alive.txt`
* `./add_nodes.rb alive.txt`
*  Edit your ~/.ssh/config add this line at the bottom:

		
			StrictHostKeyChecking no
			

* Execute: 
  `./uploader.rb`
* Check http://address.ofyour.webserver.com/planetlab/phobelog.php
* Open 'hello_world.kml' file in Google Earth

## Raw results

```
7006	Instituto Superior Tecnico	istple	http://www.ist.utl.pt	38.7373	-9.30324
2903	Universitat Oberta de Catalunya	uocple	http://www.uoc.edu	41.3909	2.16791
7026	Wroclaw University of Technology	wrocple	http://www.pwr.wroc.pl	51.1	16.93
6934	Technische Universitaet Berlin	tuberlinple	http://www.tkn.tu-berlin.de/	52.5	13.3
2887	Silesian University of Technology, Insti	polslple	http://www.inf.polsl.pl/	50.2901	18.6773
465	KTH, Royal Institute of Technology, EE	ktheeple	http://www.kth.se	59.3495	18.067
6992	Universidad Publica de Navarra	unavarraple	http://www.tlm.unavarra.es/research	42.7993	-1.63544
402	Universite Catholique de Louvain	uclple	http://www.info.ucl.ac.be	50.6833	4.61667
7269	Athlone Institute of Technology	ait	http://www.ait.ie/sri	53.4187	-7.90557
7018	University of Cyprus	cyprusple	http://grid.ucy.ac.cy/planetlab	35.15	33.36
7049	University of Zurich, Communication Systems Group	uzhple	http://www.csg.uzh.ch/	47.23	8.32
429	Universitat Politecnica de Catalunya	upcple	http://www.upc.edu	41.3897	2.11273
7046	Helsinki Institute for Information Technology	hiitple	http://www.hiit.fi	60.1	25.0
6872	University of Athens	uofathens	http://www.di.uoa.gr	37.9684	23.7669
7231	KU Leuven	kuleuven	http://www.esat.kuleuven.be/scd/?view=cosic	50.8625	4.68599
7303	Centre for Wireless Communications	oulu	http://www.cwc.oulu.fi/home/	65.0582	25.4713
6876	Czech Educational and Scientific Network	cesnetple	http://www.ces.net	50.102	14.3916
7054	Vrije Universiteit	vrijeple	http://www.cs.vu.nl/index-en.html	52.35	4.9
6941	Netgroup at University of Rome "Tor Vergata"	uniroma2	http://netgroup.uniroma2.it	41.8556	12.6243
7154	Jacobs University Bremen	iubremenple	http://www.jacobs-university.de/	53.04	8.49
3	Universite Pierre et Marie Curie	upmc	http://www.lip6.fr	48.8473	2.35749
7148	Linkoping University - IDA	liu	http://www.ida.liu.se	58.399	15.577
6950	Aalto University Comnet	comnet	http://comnet.tkk.fi	60.19	24.93
6940	Poznan Supercomputing and Networking Center	poznanple	http://www.man.poznan.pl	52.4118	16.9165
7058	Eurecom Institute	eurecomple	http://www.eurecom.fr	43.6285	7.05162
```
