## Instructions

* 1) $ gem install bundler
   $ bundle install

* 2) edit config.rb and enter there your credentials, also edit planetlab.py 
* 3) go to http://monitor.planet-lab.eu/monitor/node 
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


* 4) chmod +x *.rb && chmod +x *.php && chmod +x *.py
* 5) upload php scripts to your webserver directory, create there phonelog.txt, set it writable. Set PHP scripts executable.
* 6) `./pinger.rb nodes.txt`
* 7) `./add_nodes.txt alive.txt`
* 8) edit your ~/.ssh/config add this line at the bottom:

`StrictHostKeyChecking no`

* 9) `./uploader.rb`
* 10) check http://address.ofyour.webserver.com/planetlab/phobelog.php
* 11) open 'hello_world.kml' file in Google Earth
