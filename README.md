
[Untitled 6.docx](https://github.com/Nina-Gessner-Baleno/8086-programming/files/6170565/Untitled.6.docx)
# 8086-ASM-programming
Some of the important topics for assembly language-8086 
Liebe Schüler, wenn du die Assemblersprache 8086 lernen willst, dann lies meine Datei. Leider ist aufgrund der Änderung meines Kontos mein Konto von Quora, Stackoverflow jetzt nicht aktiv, so dass ich hier alles veröffentlichen werde, was mit Programmierung zu tun hat. Jeden Monat finden Sie neue aktualisierte und Ich werde die alte Datei löschen und die neue mit dem gleichen Namen hochladen  ..
Liebe Studenten, ich bin auf Github aktiv und werde einige wichtige Themen der Programmierung / ASM / Berechnungstheorie / Quanten & Künstliche Intelligenz hier auf Github hochladen. Aufgrund meiner neuen E-Mail-ID habe ich einen neuen Account bei Github und all meinen erstellt andere Konten werden deaktiviert. Für weitere Anfragen können Sie mich unter NinaGessner@htw-dresden.de erreichen.
Danke!
Nina


# GENERAL PURPOSE REGISTERS

Die 8086-CPU verfügt über 8 Allzweckregister. Jedes Register hat seinen eigenen Namen:
AX - das Akkumulatorregister (unterteilt in AH / AL).
BX - das Basisadressregister (unterteilt in BH / BL).
CX - das Zählregister (unterteilt in CH / CL).
DX - das Datenregister (unterteilt in DH / DL).
SI - Quellindexregister.
DI - Zielindexregister.
BP - Basiszeiger.
SP - Stapelzeiger.

Trotz des Namens eines Registers bestimmt der Programmierer die Verwendung für jedes Allzweckregister. Der Hauptzweck eines Registers besteht darin, eine Nummer (Variable) zu behalten. Die Größe der oben genannten Register beträgt 16 Bit. Es ist ungefähr so: 0011000000111001b (in binärer Form) oder 12345 in dezimaler (menschlicher) Form.

4 Allzweckregister (AX, BX, CX, DX) bestehen aus zwei separaten 8-Bit-Registern, beispielsweise wenn AX = 0011000000111001b, dann AH = 00110000b und AL = 00111001b. Wenn Sie eines der 8-Bit-Register ändern, wird daher auch das 16-Bit-Register aktualisiert und umgekehrt. Das gleiche gilt für andere 3 Register, "H" steht für hoch und "L" steht für niedrigen Teil.

Da sich die Register in der CPU befinden, sind sie viel schneller als der Speicher. Der Zugriff auf einen Speicherort erfordert die Verwendung eines Systembusses, daher dauert es viel länger. Der Zugriff auf Daten in einem Register dauert normalerweise nicht lange. Daher sollten Sie versuchen, Variablen in den Registern zu behalten. Registersätze sind sehr klein und die meisten Register haben spezielle Zwecke, die ihre Verwendung als Variablen einschränken, aber sie sind immer noch ein ausgezeichneter Ort zum Speichern temporärer Berechnungsdaten.

# SEGMENT REGISTERS

CS - zeigt auf das Segment, das das aktuelle Programm enthält.
DS - zeigt im Allgemeinen auf ein Segment, in dem Variablen definiert sind.
ES - zusätzliches Segmentregister, es liegt an einem Codierer, seine Verwendung zu definieren.
SS - zeigt auf das Segment, das den Stapel enthält.
Obwohl es möglich ist, Daten in den Segmentregistern zu speichern, ist dies niemals eine gute Idee. Die Segmentregister haben einen ganz besonderen Zweck - sie zeigen auf zugängliche Speicherblöcke.

Segmentregister arbeiten mit dem Allzweckregister zusammen, um auf einen beliebigen Speicherwert zuzugreifen. Wenn wir beispielsweise unter der physischen Adresse 12345h (hexadezimal) auf den Speicher zugreifen möchten, sollten wir DS = 1230h und SI = 0045h einstellen. Dies ist gut, da wir auf diese Weise auf viel mehr Speicher zugreifen können als mit einem einzelnen Register, das auf 16-Bit-Werte begrenzt ist.
Die CPU berechnet die physikalische Adresse, indem sie das Segmentregister mit 10h multipliziert und ein Allzweckregister hinzufügt (1230h * 10h + 45h = 12345h):
 
Die mit 2 Registern gebildete Adresse wird als effektive Adresse bezeichnet.
Standardmäßig arbeiten die Register BX, SI und DI mit dem DS-Segmentregister.
BP und SP arbeiten mit dem SS-Segmentregister.
Andere Allzweckregister können keine effektive Adresse bilden!
Auch wenn BX eine effektive Adresse bilden kann, können BH und BL dies nicht!

# SPECIAL PURPOSE REGISTERS

IP - the instruction pointer.
Flags Register - determines the current state of the processor.

Das IP-Register arbeitet immer mit dem CS-Segmentregister zusammen und zeigt auf die aktuell ausgeführte Anweisung.
Das Flags Register wird nach mathematischen Operationen automatisch von der CPU geändert. Dies ermöglicht es, den Typ des Ergebnisses zu bestimmen und die Bedingungen zu bestimmen, unter denen die Steuerung auf andere Teile des Programms übertragen werden kann.
Im Allgemeinen können Sie nicht direkt auf diese Register zugreifen.

