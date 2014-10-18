Instructions:

1) $ gem install bundler
   $ bundle install

2) edit config.rb and enter there your credentials
3) go to http://monitor.planet-lab.eu/monitor/node 
   filter nodes by status, form a huge list of nodes, one hostname perline.

It can be done with parser:

$ head copy_paste_nodes.txt 
1012	uninaonelab	planetlab01.dis.unina.it	online	3 hrs ago	False
15198	darmstadtple	host1.planetlab.informatik.tu-darmstadt.de	online	13 min ago	False
14237	uocple	dplanet2.uoc.edu	online	8 hrs ago	False
16098	wuerzburgple	planetlab1.informatik.uni-wuerzburg.de	offline	17 hrs ago	False
7066	imdeaple	utet.ii.uam.es	offline	13 min ago	False
15195	nicta	planetlab2.research.nicta.com.au	offline	2 days ago	True
14911	kitple	iraplab2.iralab.uni-karlsruhe.de	good	10 mnths ago	False
15956	upmc	sybaris.ipv6.lip6.fr	good	1 mnths ago	False
14928	netmodeple	stella.planetlab.ntua.gr	good	9 mnths ago	False
15954	upmc	anateus.ipv6.lip6.fr	good	1 mnths ago	False

$ ./parser copy_paste_nodes.txt > nodes.txt
$ head nodes.txt

dplanet2.uoc.edu
planetlab2.research.nicta.com.au
planetlab1.informatik.uni-wuerzburg.de
dannan.disy.inf.uni-konstanz.de
planetlab2.ci.pwr.wroc.pl
planetlab-1.man.poznan.pl
planet2.unipr.it
planetlab2.informatik.uni-goettingen.de
....


3) chmod +x *.rb && chmod +x *.php && chmod +x *.py
4) upload php scripts to your webserver directory, create there phonelog.txt, set it writable. Set PHP scripts executable.
5) ./pinger.rb nodes.txt
6) ./add_nodes.txt alive.txt
7) edit your ~/.ssh/config add this line at the bottom:

StrictHostKeyChecking no

8) ./uploader.rb
9) check http://address.ofyour.webserver.com/planetlab/phobelog.php
10) open 'hello_world.kml' file in Google Earth
