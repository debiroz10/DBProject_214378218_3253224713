
[General]
Version=1

[Preferences]
Username=
Password=2574
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=DEBBI1
Name=INSTOCK
Count=200

[Record]
Name=AMOUNT
Type=NUMBER
Size=5
Data=Random(10, 99999)
Master=

[Record]
Name=SUPPLIERID
Type=NUMBER
Size=5
Data=List(select SUPPLIERID from SUPPLIER_)
Master=

[Record]
Name=EQUIPMENTID
Type=NUMBER
Size=5
Data=List(select EQUIPMENTID from EQUIPMENT)
Master=

