/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

by Mercier
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/

if (ACL_PARAM_Language == "english") then
{
	ACL_LG_Murderer_1 = "Don't expect to have any information from me, you come here and kill the people.";
	ACL_LG_Murderer_2 = "You're worse than the enemy! Leave us alone.";
	ACL_LG_Player_1 = "Did you see recently any suspect activity near your village?";
	ACL_LG_Player_2 = "Ok, thank you. Be careful though.";
	ACL_LG_Answer_1 = "Yes, I did! I saw some guys with weapons earlier in the area but I have no idea where they are now, sorry...";
	ACL_LG_Answer_2 = "No, I'm sorry.";
	ACL_LG_Bye = "Good bye.";
	ACL_LG_NoCoop =
	[
		"Sorry, no english.",
		"Me no english.",
		"I do not like you.",
		"Me no like american.",
		"I don't want to talk with you.",
		"No the time with this crap.",
		"I don't have time for you.",
		"I need to go somewhere else."
	];
	ACL_LG_Coop = 
	[
		"Yes?",
		"What do you want?",
		"Can I help you?",
		"Hello, what do you need?"
	];
};
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if (ACL_PARAM_Language == "french") then
{
	ACL_LG_Murderer_1 = "N'attendez aucune information de ma part, vous venez ici et tuez les citoyens.";
	ACL_LG_Murderer_2 = "Vous êtes pire que l'ennemi! Laissez-nous tranquille!";
	ACL_LG_Player_1 = "Êtes-vous au courant de certaines activités suspectes aux abords de votre village??";
	ACL_LG_Player_2 = "Ok, merci. Soyez vigilant.";
	ACL_LG_Answer_1 = "Oui! J'ai vu quelques personnages armées plus tôt dans la région mais je ne sais pas où ils sont maintenant. Désolé.";
	ACL_LG_Answer_2 = "Non, je suis désolé.";
	ACL_LG_Bye = "Au revoir.";
	ACL_LG_NoCoop =
	[
		"Désolé, pas français.",
		"Moi pas parler français.",
		"Moi pas aimer toi.",
		"Je ne veux pas parler avec toi.",
		"Pas le temps avec ces bêtises.",
		"Pas le temps pour toi.",
		"Je dois aller ailleurs.",
		"Je suis occupé."
	];
	ACL_LG_Coop = 
	[
		"Oui?",
		"Que voulez-vous?",
		"Puis-je vous aider?",
		"Bonjour, de quoi avez-vous besoin?"
	];
};
if (true) exitWith {};