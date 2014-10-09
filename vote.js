db=connect("ip:port/dbname");
db.auth("username","pwd");
col=db.getCollection("digg");
cur=col.find({"type":20130326});
var total=0;
while(cur.hasNext()){
 		 total+=cur.next().upCount;
}
print(total);


