
[General]
Version=1

[Preferences]
Username=
Password=2478
Database=
DateFormat=DD-MM-YYYY
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=DEBBI1
Name=INVITATION
Count=200

[Record]
Name=FINALPRICE
Type=NUMBER
Size=7
Data=Random(100, 9999999)
Master=

[Record]
Name=INVITATIONID
Type=NUMBER
Size=5
Data=Sequence(115)
Master=

[Record]
Name=DATTE
Type=DATE
Size=
Data=Random(1/1/2000, 1/1/2027)
Master=

[Record]
Name=CLIENTID
Type=VARCHAR2
Size=8
Data=List(select CLIENTID from CLIENT)
Master=

[Record]
Name=DESIGNERID
Type=NUMBER
Size=5
Data=List(select DESIGNERID from DESIGNER)
Master=

[Record]
Name=PACKAGEID
Type=NUMBER
Size=5
Data=List(select PACKAGEID from PAKCAGE)
Master=

