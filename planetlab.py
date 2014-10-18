#!/usr/bin/env python
import xmlrpclib

plc_host='www.planet-lab.eu'

slice_name='slice_name'

auth = {  'AuthMethod' : 'password',
					'Username' : 'your@email.com',
					'AuthString' : 'password',
}

api_url="https://%s:443/PLCAPI/"%plc_host
plc_api = xmlrpclib.ServerProxy(api_url,allow_none=True)
# the slice's node ids
node_ids = plc_api.GetSlices(auth,slice_name,['node_ids'])[0]['node_ids']
# get hostname for these nodes
slice_nodes = plc_api.GetNodes(auth,node_ids,['hostname'])
# store in a file
f=open('mynodes.txt','w')
for node in slice_nodes:
	print >>f,node['hostname']
f.close()