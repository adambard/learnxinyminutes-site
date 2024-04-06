
import shutit
session = shutit.create_session('bash')
session.send('echo Hello World', echo=True)

python example.py

$ python example.py
echo "Hello World"
echo "Hello World"
Hello World
Ians-MacBook-Air.local:ORIGIN_ENV:RhuebR2T#

import shutit
session = shutit.create_session('bash')
session.login('ssh you@example.com', user='du', password='meinpassword')
session.send('hostname', echo=True)
session.logout()

$ python example.py
hostname
hostname
example.com
example.com:cgoIsdVv:heDa77HB#

import shutit
session = shutit.create_session('bash')
password = session.get_input('', ispass=True)
session.login('ssh you@example.com', user='du', password=password)
session.send('hostname', echo=True)
session.logout()

$ python example.py
Input Secret:
hostname
hostname
example.com
example.com:cgoIsdVv:heDa77HB#

import shutit
session1 = shutit.create_session('bash')
session2 = shutit.create_session('bash')
password1 = session1.get_input('Password für server1', ispass=True)
password2 = session2.get_input('Password für server2', ispass=True)
session1.login('ssh you@one.example.com', user='du', password=password1)
session2.login('ssh you@two.example.com', user='du', password=password2)
session1.send('hostname', echo=True)
session2.send('hostname', echo=True)
session1.logout()
session2.logout()

$ python example.py
Password for server1
Input Secret:

Password for server2
Input Secret:
hostname
hostname
one.example.com
one.example.com:Fnh2pyFj:qkrsmUNs# hostname
hostname
two.example.com
two.example.com:Gl2lldEo:D3FavQjA#

import shutit
capacity_command="""df / | awk '{print $5}' | tail -1 | sed s/[^0-9]//"""
session1 = shutit.create_session('bash')
session2 = shutit.create_session('bash')
password1 = session.get_input('Passwort für Server1', ispass=True)
password2 = session.get_input('Passwort für Server2', ispass=True)
session1.login('ssh you@one.example.com', user='du', password=password1)
session2.login('ssh you@two.example.com', user='du', password=password2)
capacity = session1.send_and_get_output(capacity_command)
if int(capacity) < 10:
	print(kein Platz mehr auf Server1!')
capacity = session2.send_and_get_output(capacity_command)
if int(capacity) < 10:
	print(kein Platz mehr auf Server2!')
session1.logout()
session2.logout()

import shutit
session = shutit.create_session('bash')
session.send('telnet', expect='elnet>', echo=True)
session.send('open google.com 80', expect='scape character', echo=True)
session.send('GET /', echo=True, check_exit=False)
session.logout()

$ python example.py
telnet
telnet> open google.com 80
Trying 216.58.214.14...
Connected to google.com.
Escape character is '^]'.
GET /
HTTP/1.0 302 Found
Cache-Control: private
Content-Type: text/html; charset=UTF-8
Referrer-Policy: no-referrer
Location: http://www.google.co.uk/?gfe_rd=cr&ei=huczWcj3GfTW8gfq0paQDA
Content-Length: 261
Date: Sun, 04 Jun 2017 10:57:10 GMT

<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>302 Moved</TITLE></HEAD><BODY>
<H1>302 Moved</H1>
The document has moved
<A HREF="http://www.google.co.uk/?gfe_rd=cr&amp;ei=huczWcj3GfTW8gfq0paQDA">
here
</A>.
</BODY></HTML>
Connection closed by foreign host.

[...]
session.pause_point('Das ist ein pause point')
[...]

import shutit
session = shutit.create_session('bash')
session.pause_point('Schaue dich um!')
session.send('echo "Hat dir der Pause point gefallen?"', echo=True)

$ python example.py
Schaue dich um!

Ians-Air.home:ORIGIN_ENV:I00LA1Mq#  bash
imiell@Ians-Air:/space/git/shutit  ⑂ master +    
CTRL-] caught, continuing with run...
2017-06-05 15:12:33,577 INFO: Sending:  exit
2017-06-05 15:12:33,633 INFO: Output (squashed):  exitexitIans-Air.home:ORIGIN_ENV:I00LA1Mq#  [...]
echo "Hat dir der Pause point gefallen?"
echo "Hat dir der Pause point gefallen?"
Hat dir der Pause point gefallen?
Ians-Air.home:ORIGIN_ENV:I00LA1Mq#

import shutit
import time
long_command="""sleep 60"""
session1 = shutit.create_session('bash')
session2 = shutit.create_session('bash')
password1 = session1.get_input('Password for server1', ispass=True)
password2 = session2.get_input('Password for server2', ispass=True)
session1.login('ssh you@one.example.com', user='du', password=password1)
session2.login('ssh you@two.example.com', user='du', password=password2)
start = time.time()
session1.send(long_command, background=True)
session2.send(long_command, background=True)
print('Es hat: ' + str(time.time() - start) + ' Sekunden zum Starten gebraucht')
session1.wait()
session2.wait()
print('Es hat:' + str(time.time() - start) + ' Sekunden zum Vollenden gebraucht')

