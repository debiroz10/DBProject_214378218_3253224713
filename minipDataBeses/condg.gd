
[General]
Version=1

[Preferences]
Username=
Password=2647
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=DEBBI1
Name=CONTAINING
Count=20

[Record]
Name=AMOUNTC
Type=NUMBER
Size=5
Data=Random(10, 9999)
Master=

[Record]
Name=EQUIPMENTID
Type=NUMBER
Size=5
Data=List(select EQUIPMENTID from EQUIPMENT)
Master=

[Record]
Name=PACKAGEID
Type=NUMBER
Size=5
Data=List(select PACKAGEID from PAKCAGE)
Master=

