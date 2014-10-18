## Instructions

* Execute:

 ```gem install bundler
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
* `./pinger.rb nodes.txt`
* `./add_nodes.txt alive.txt`
*  Edit your ~/.ssh/config add this line at the bottom:

			`StrictHostKeyChecking no`

* Execute: 
  `./uploader.rb`
* Check http://address.ofyour.webserver.com/planetlab/phobelog.php
* Open 'hello_world.kml' file in Google Earth
