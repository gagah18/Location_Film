Les requêtes suivantes pour faire des essais:

Requête pour afficher les titres et dates de sorties des films du plus récent au plus ancien
SELECT * FROM `sql_Locationfilm`.`FILMSTOCK` ORDER BY id_FilmS DESC LIMIT 3;

Requête pour AJOUTER un film
INSERT INTO `sql_Locationfilm`.`FILMSTOCK` (`idINFOFILM`, `Titre`, `Date de sortie`, `Durée`, `Date d'Entrée`, `Réalisateur`, `idCATFILM`) VALUES ('', '', '', '', '', '', '');

Requête pour MODIFIER un film
UPDATE `sql_Locationfilm`.`FILMSTOCK` SET `idINFOFILM`= '', `titre` = '', `Date de sortie` = '', `Durée` = '', `Date de sortie` = '', `réalisateur` = '' WHERE (`idINFOFILM` = '1');

Requête pour supprimer un film
DELETE FROM `sql_Locationfilm`.`FILMSTOCK` WHERE `idINFOFILM`= 1;

Requête pour AJOUTER un client
INSERT INTO `sql_Locationfilm`.`CLIENT` (`IDClient`, `NomClient`, `PrénomClt`, `EmailClt`, `Date d'Entrée NewClient`,`idPAYFILM`) VALUES ('', '', '', '', '', '', '');

Requête pour MODIFIER un client
UPDATE `sql_Locationfilm`.`CLIENT` SET `NomClient` = '', `PrénomClt` = '', `EmailClt` = '', `Date d'Entrée Newclient` = '', `idPAYFILM` = '' WHERE (`IDClient` = '1');

Requête pour supprimer un client
DELETE FROM `sql_Locationfilm`.`CLIENT` WHERE `IDClient`= 1;

Requête pour afficher les 3 derniers films ajoutés
SELECT * FROM `sql_Locationfilm`.`FILMSTOCK` ORDER BY `idINFOFILM` DESC LIMIT 3;



