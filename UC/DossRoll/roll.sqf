//TODO ajout d'une condition qui vérifie 
//si la commande vient de ace ou du chat

_rNumber = random 99;


_messageroll = format["action réussie à %1 %",_rnumber];
//ou 
//_messageroll = format["%1 à %2 %",(_this select 0),_rnumber]; affichage plus stylé

[player, _messageroll] remoteExec ["globalChat", 0];

hint _messageroll;