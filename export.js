db=connect("ip:port/dbname")
db.auth("username","pwd")
db.digg.find({type:2}).sort({upCount:-1}).forEach(function(doc){print(doc.vid+" "+doc.pid+" "+doc.upCount+" "+doc.downCount)});


print("over");
