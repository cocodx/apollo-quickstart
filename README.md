### apollo server start  
1,use src/main/server/sql/*.sql import to mysql,run them  
2,run the runApollo.bat,be careful the env of this files  
3,http://localhost:8070  apollo@admin

Eureka has to known the config service and admin service  
Config service need to connected database,reading and pushing config properties    
Admin service need to connected database,updating and pushing config properties
the Client use the config service to read the config properties.  
Meta server is the topper service than Eureka  
the Client use the domain to Meta Server get the Config Services(IP+Port),go to the services,load balance,try try try error  
Portal use the domain to Meta Server get the Admin Services(IP+port),go to the services,load balance,try try try error  

  

usually,config(config+eureka+meta-server)

###key words:
application:appId == project
environment:dev or prod or test and so on  
cluster:beijing machines cluster and shenzhen machines cluster  
namespace：management the properties by namespace == a property file  
common namespace:for example-mysql connecting ,how use it? extend common  