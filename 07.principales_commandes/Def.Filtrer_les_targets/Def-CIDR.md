CIDR, ou "Classless Inter-Domain Routing", est un système de notation permettant de représenter des plages d'adresses IP de manière plus flexible et efficace que les anciens systèmes de classe d'adresse IP.

Une adresse IP est généralement représentée sous la forme de quatre groupes de chiffres séparés par des points, comme par exemple `192.168.1.1`. Chaque groupe de chiffres représente une octet (8 bits) de l'adresse IP, et il existe trois classes d'adresses IP (A, B, et C) qui déterminent la façon dont les octets sont répartis entre l'identification du réseau et l'identification de l'hôte.

CIDR a été introduit pour surmonter les limitations des classes d'adresses IP en permettant une allocation plus flexible des adresses IP. Au lieu de diviser les adresses en classes prédéfinies, CIDR permet de spécifier le nombre de bits utilisés pour représenter le réseau, offrant ainsi une meilleure granularité.

La notation CIDR se fait en ajoutant un suffixe au format "/X" à la fin de l'adresse IP, où "X" représente le nombre de bits utilisés pour identifier le réseau. Par exemple, "192.168.1.0/24" signifie que les 24 premiers bits sont utilisés pour identifier le réseau, laissant 8 bits pour identifier les hôtes dans ce réseau.

Quelques exemples de notation CIDR :

- `192.168.1.0/24`: Les 24 premiers bits identifient le réseau.
- `10.0.0.0/8`: Les 8 premiers bits identifient le réseau.
- `172.16.0.0/16`: Les 16 premiers bits identifient le réseau.

CIDR est largement utilisé dans la configuration des routeurs et des pare-feu pour spécifier des plages d'adresses IP de manière concise et efficiente.