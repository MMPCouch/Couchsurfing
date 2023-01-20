-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 20. Jan 2023 um 13:23
-- Server-Version: 10.3.31-MariaDB-0+deb10u1
-- PHP-Version: 7.0.33-57+0~20211119.61+debian10~1.gbp5d8ba5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `716000_5_1`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buchungsanfrage`
--

CREATE TABLE `buchungsanfrage` (
  `ID` int(11) NOT NULL,
  `couch_id` int(11) DEFAULT NULL,
  `gast_user_id` int(11) DEFAULT NULL,
  `motivationstext` varchar(200) DEFAULT NULL,
  `buchungsstatus` tinyint(4) DEFAULT NULL,
  `anbieter_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `buchungsanfrage`
--

INSERT INTO `buchungsanfrage` (`ID`, `couch_id`, `gast_user_id`, `motivationstext`, `buchungsstatus`, `anbieter_user_id`) VALUES
(11, 59, 49, 'Würde einfach gerne wieder mal richtig ausschlafen.', 1, 49),
(16, 59, 50, 'Bitte nimm die Anfrage an, werde sogar 3x pro Tag staubsaugen!', 2, 49),
(17, 59, 50, 'Bin für einen Major in Town und brauche dringend eine Bleibe.', 1, 49),
(18, 59, 50, 'Bitte akzeptiere die Buchungsanfrage.', 2, 49),
(26, 68, 49, 'please', 0, 66),
(27, 80, 49, ' juhu', 0, 78),
(28, 80, 49, ' macht mich halt an', 0, 78);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `couch`
--

CREATE TABLE `couch` (
  `ID` int(11) NOT NULL,
  `titel` varchar(100) NOT NULL,
  `bild` varchar(300) NOT NULL,
  `adresse` varchar(200) NOT NULL,
  `stadt` int(11) NOT NULL,
  `beschreibung` text NOT NULL,
  `anbieter_user_id` int(11) NOT NULL,
  `verfuegbarkeitsstatus` tinyint(1) NOT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `datum_von` date NOT NULL,
  `datum_bis` date NOT NULL,
  `kosten` varchar(250) DEFAULT NULL,
  `publikationsstatus` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Daten für Tabelle `couch`
--

INSERT INTO `couch` (`ID`, `titel`, `bild`, `adresse`, `stadt`, `beschreibung`, `anbieter_user_id`, `verfuegbarkeitsstatus`, `timestamp`, `datum_von`, `datum_bis`, `kosten`, `publikationsstatus`) VALUES
(59, 'Blub Resort III', 'https://cdn-images.article.com/products/SKU17546/2890x1500/image82123.jpg?w=2740&q=60&fm=webp&fit=max', 'Random alley 2', 3, ' Was macht ein Berner in Zürich\r\nDas Gleiche wie du. Ich studiere in Zürich, deshalb bin ich von Montag bis Freitag in einer WG, doch unsere WG hat ein Sofa, das unbenutzt ist. Deshalb sind wir auf Couchsurfing aufmerksam geworden und schreiben gerade dieses Inserat. Falls du also Interesse hast, eine spontane Nacht bei uns zu übernachten feel free to book our couch! ;) Ist schön. sehr schön. versprochen.', 49, 1, '2023-01-10 14:43:12', '2023-01-01', '2023-10-10', ' Täglich 2x staubsaugen.', 1),
(60, 'Luxus Couch', 'https://cdn1.home24.net/images/media/catalog/product/725x740/png/-/1/-1000250005-210325-11540200015-IMAGE-P000000001000250005.webp', 'Vallerstrasse 144', 1, 'Wir sind Nick und Jonas und wir versprechen dir wir haben das bequemste Sofa der Welt. Wir sind zwar keine MMP-Studenten, wie die Genies und Gründer dieser Webseite, aber ihren Zweck unterstützen wir voll und ganz. Deshalb sind wir bereit unser Sofa auch mit dir zu teilen! Es ist die ganze Woche immer mindesten einer von uns in der WG, das heisst es gibt keine Probleme mit Zeitraumbuchungen. Wir sind eine lustige und offene WG, immer offen, neue Menschen kennenzulernen. Geht es dir da genauso? Dann buche unsere Couch sofort!', 52, 0, '2023-01-12 13:08:12', '2023-02-20', '2023-02-25', ' Deine Seele', 1),
(61, 'Bequeme Unterkunft in Graubünden', 'https://cdn1.home24.net/images/media/catalog/product/725x740/png/-/1/-1000235653-210210-13314500105-IMAGE-P000000001000235653.webp', 'Bergrain 32', 2, 'Guten Abend\r\nIch bin Ruzzle, 23 Jahre alt und studiere zurzeit Tourismus an der Fachhochschule Graubünden.\r\nMein aktueller Mitbewohner ist von Februar bis April 2023 im Ausland, deshalb haben wir uns darauf geeinigt, dass wir sein Zimmer für Couchsurfing benutzen. In diesem Zeitraum bin ich immer Mittwoch bis Samstag zu Hause d.h. du kannst dieses Zimmer mieten in diesem Zeitraum. Das Zimmer beinhaltet ein Pult, einen Schrank und natürlich ein Bett. Wir haben in der Wohnung eine grosse Küche & zwei Badezimmer, die du bei deiner Mietdauer natürlich mitbenutzen darfst. Ich würde mich freuen, dich kennenzulernen.', 54, 1, '2023-01-12 13:20:03', '2023-03-20', '2023-03-30', 'Ein nettes Lächeln', 1),
(62, 'Sofa Spreehütte', 'https://cdn1.home24.net/images/media/catalog/product/725x740/png/-/1/-1000217639-211006-061518000011-IMAGE-P000000001000217639.webp', 'Casa Gielgia 51', 2, 'Hallo mein Name ist Emilia und ich wohne seit einem Semester in Chur. Ich habe mir damals eine grosse, aber günstige Wohnung zugelegt. Ich habe über das Studium von Couchsurfing gehört und finde das passt mehr als gut zu mir. Ich biete daher gerne meine L-förmige Couch an, für jeden Studenten aus der Schweiz. Wir sehen uns.', 58, 1, '2023-01-12 13:26:38', '2023-04-02', '2023-05-20', 'Katze strählen', 1),
(63, 'Zerfleddertes Ledersofa', 'https://cdn1.vente-unique.com/thumbnails/product/65/65837/gallery_slider/lg/sofa_143317.webp', 'Gartenhof 148', 2, 'Diese Couch ist bereits in die Jahre gekommen. Ich wohne seit 3 Jahren in Chur und habe hier mein Studium begonnen. Deshalb habe ich von Couchsurfing erfahren und biete hier mein kleines aber feines 2er Bettsofa ASKEBY von Ikea an (nur zum Mieten, kein Verkauf :D ). Ich wohne in unmittelbarer Nähe der Fachhochschule Graubünden, also perfekt für jede:n Studierende:n, der hier Grosses ( und Kleines) vor hat.', 59, 1, '2023-01-12 13:30:18', '2023-05-01', '2023-05-23', ' Gratis', 1),
(64, 'Villa Kunterbunt', 'https://cdn1.home24.net/images/media/catalog/product/800x800/png/-/1/-1000086542-190507-11433000001-IMAGE-P000000001000086542.webp', 'Jakobstrasse 3', 2, 'Trallari trallahey tralla hoppsasa.\r\nWir sind Loris, Manuela und Basil und haben die coolste WG in Chur. Couchsurfing ist voll unser Ding geworden, deshalb bieten wir unsere WG Couch auch anderen Studierenden an. Ein kleiner Haken gibt es, wir sind alle nur von montags bis freitags da d.h. du kannst unsere Couch nur in diesem Zeitraum mieten. Wir freuen uns, wenn du dich dafür entscheidest, eine Nacht oder auch einen längeren Zeitraum in der coolsten WG Churs zu verbringen.', 60, 1, '2023-01-12 13:35:18', '2023-01-20', '2023-04-03', ' Benutz deine Fantasie', 1),
(65, 'Party Couch', 'https://cdn1.home24.net/images/media/catalog/product/800x800/png/-/1/-1000296971-211018-10254002610-DETAILS-P000000001000296971.webp', 'Schuepisstrasse 137', 2, 'Ich gehe auf Weltreise und muss daher mein wunderschönes WG-Zimmer in der Churer Altstadt verlassen. Das Zimmer ist frei ab dem 1. Februar. Es befindet sich in einer 41/2 Zimmer Wohnung im 1. Stock mit Lift, 2 Mitbewohnerinnen, 2 Katzen :-), 2 Badezimmern, einem Wohn-/Essbereich und komfortabler Küche. Die Wohnung hat einen wunderschönen Balkon mit Blick in den grossen Gemeinschaftsgarten für mehrere Liegenschaften. Bis ich zurück komme, bleibt das Inserat auf Couchsurfing.', 64, 1, '2023-01-12 13:40:25', '2023-02-20', '2023-02-23', ' Gute Laune mitbringen', 1),
(67, 'Liegewiese', 'https://cdn1.home24.net/images/media/catalog/product/725x740/png/-/1/-1000113432-220331-030-DETAILS-P000000001000113432.webp', 'Wingertweg 127', 2, ' Platz für 10 Personen', 65, 0, '2023-01-12 13:43:00', '2023-03-10', '2023-04-15', ' Dein erstgeborenes Kind', 1),
(68, 'Etwas zu kurze Couch', 'https://cdn1.home24.net/images/media/catalog/product/725x740/png/-/1/-1000222105-201113-13025500298-IMAGE-P000000001000222105.webp', 'Via dalla Staziun 111', 2, ' Wenn du unter 1.60m bist, gehts.\r\nHallo du, wir sind Anna und Paul und sind beide im dritten Semester Betriebsökonomie an der Fachhochschule Graubünden. Wir sind mit vielen MMP Studierenden befreundet und haben dadurch von Couchsurfing gehört. Liebend gerne bieten wir den Studierenden in Not auch unser Sofa an. Wir sind sehr spontan und flexibel. Du kannst uns gerne einen Tag davor schreiben, dann können wir sehen, was sich machen lässt.', 66, 1, '2023-01-12 13:51:30', '2023-03-15', '2023-06-10', 'Nicht empfohlen für grosse Menschen', 1),
(69, 'Normale Couch in 2er WG', 'https://cdn1.home24.net/images/media/catalog/product/1720x1720/png/-/1/-1000242092-210219-10204200051-DETAILS-P000000001000242092.webp', 'Plattenstrasse 49', 2, 'Hi, mein Name ist Miriam und ich bin MMP Studentin im 2. Semester. Ich wohne immer noch bei meinen Eltern in Chur aber wir haben ein riesiges Familiensofa, dass ich gerne mit dir teilen würde. Meine Eltern wissen natürlich davon und sind damit einverstanden dieses Herbstsemester hin und wieder einige Studierende hier schlafen zu lassen, damit ich dies im\r\nnächten Semester auch mal ausprobieren kann in einer anderen Stadt. Ich freue mich, falls du vorbeikommst. Bis bald.', 67, 1, '2023-01-12 13:55:32', '2023-08-10', '2023-10-20', ' Keinen Lärm veranstalten!', 1),
(70, 'Modernes Schlafsofa', 'https://bilder.jelmoli-shop.ch/i/empiriecom/3d33630b5224e7e68944be04e8208f31?$format_dv_desk_132$', 'Bergrain 85', 1, 'Das bequemste Sofa der Welt\r\nWir sind Nick und Jonas und wir versprechen dir wir haben das bequemste Sofa der Welt. Wir sind zwar keine MMP-Studenten, wie die Genies und Gründer dieser Webseite, aber ihren Zweck unterstützen wir voll und ganz. Deshalb sind wir bereit unser Sofa auch mit dir zu teilen! Es ist die ganze Woche immer mindesten einer von uns in der WG, das heisst es gibt keine Probleme mit Zeitraumbuchungen. Wir sind eine lustige und offene WG, immer offen, neue Menschen kennenzulernen. Geht es dir da genauso? Dann buche unsere Couch sofort!', 68, 1, '2023-01-12 13:59:24', '2023-02-23', '2023-03-10', 'Die drei Kinder betreuen', 1),
(71, 'Modernes Sitzpouf', 'https://de.vidaxl.ch/dw/image/v2/BFNS_PRD/on/demandware.static/-/Sites-vidaxl-catalog-master-sku/default/dwec156e0c/hi-res/536/696/4453/244977/image_1_244977.jpg?sw=400', 'Mülhauserstrasse 63', 3, 'Hallo ,ich hab von Couchsurfing gehört und finde dies eine gute Sache. Da ich ebenfalls ein Wohnzimmer habe mit einer Couch, die niemand benutzt, mache ich dieses Inserat hier. Good to know ist, ich bin für montags bis samstags immer in Zürich in meiner Wohnung d.h. du kannst dann auch kommen beziehungsweise das Sofa buchen. Es gibt eine einzige Bedingung: du darfst nicht gegen Hunde allergisch sein, da ich zwei Dalmatiner besitze. Ansonsten kannst du dich gerne jederzeit melden via 077 777 77 77 falls du allfällige Fragen hast.', 69, 1, '2023-01-12 14:04:28', '2023-04-26', '2023-04-26', 'Eine Packung Räucherstäbchen', 1),
(72, 'Bequeme Schlafmatte', 'https://www.schecker.ch/$WS/schecker/websale8_shop-schecker/produkte/medien/bilder/gross/Komfortkissen-Torridon-_-074641.webp', 'Scheidweg 143', 2, 'Ich bin Marc und studiere zurzeit Betriebsökonomie in Chur. Ich habe von der Couchsurfing App erfahren, als ich wegen eines Kurses selbst einmal eine Couch gemietet habe in Bern. Ich kenne also das Problem mehr als Gut und bin deshalb hier: gerne biete ich meine Couch anderen Studierenden aus der Schweiz an. Ich bin immer Dienstag bis Samstag in meiner Wohnung, dies bezieht sich dementsprechend auch auf den Buchungszeitraum.', 70, 1, '2023-01-12 14:08:03', '2023-03-10', '2023-07-24', 'Mit den Hunden Gassi gehen', 1),
(73, 'Optische Täuschung', 'https://cdn.laredoute.com/products/a/c/7/ac717ea2ef7e0da128aed1141336770e.jpg?imgopt=twic&twic=v1/cover=1200x1200', 'Seefeldstrasse 92', 1, 'Ich biete eine Luxusluftmatraze als Übernachtungsmöglichkeit in Bern an. Ich besitze leider kein Sofa, aber ich habe in meiner 3.5 Zimmerwohnung noch ein Zimmer frei und möchte dieses sinnvoll nutzen. Das Zimmer kann für eine Nacht oder auch eine längere Zeitspanne gebucht werden.', 71, 1, '2023-01-12 14:14:45', '2023-04-20', '2023-05-23', ' Ein selbstgeschriebenes Haiku', 1),
(74, 'Schlichte Couch von schlichten Leuten', 'https://cdn.laredoute.com/products/4/f/8/4f8938a65d5acae3c97537dcee2e4f85.jpg?imgopt=twic&twic=v1/cover=1200x1200', 'Rasenstrasse 87', 1, 'Wir sind Mirabelle, Sarah und Laura, eine reine Frauen-WG mit einem typischen Ausziehsofa von Ikea. Es erfüllt seinen Zweck, doch wir sind der Meinung es kann noch mehr! Deshalb bieten wir unser Sofa auf Couchsurfing an. Wir bevorzugen vor allem Frauen, die dringend eine spontane Unterkunft in Bern benötigen. Zögere dich aber nicht dich bei uns zu melden.', 72, 0, '2023-01-12 14:20:28', '2023-04-16', '2023-07-30', 'Gipfeli mitbringen', 1),
(75, 'Funky Couch', 'https://pictureserver.net/images/pic/34/49/undef_src_sa_picid_793577_x_760_type_whitesh_image.jpg?ver=10', 'Mittlerer Thalackerweg 136', 1, 'Halli Hallo wir sind Patrick und Katrin, ein MMP Pärchen aus Bern! Zurzeit studieren wir beide noch und kennen das Problem des Pendelns in der Schweiz während des Studiums, desshaöb bieten wir unser Sofa hier an. Falls du für eins, zwei Nächte eine Übernachtungsmöglichkeit suchts, darfst du dich gerne bei uns melden. Bis dahin alles Gute und vielleicht bis bald.', 73, 1, '2023-01-12 14:48:09', '2023-02-10', '2023-10-02', ' 1000.- pro Nacht', 1),
(76, 'Hipster Couch', 'https://cdn1.home24.net/images/media/catalog/product/800x800/png/-/1/-1000296930-211018-10251902210-IMAGE-P000000001000296930.webp', 'Lungolago 59', 1, 'Hey, mein Name ist Michelle und ich lebe seit 1 Jahr in Bern in einer 2.5 Zimmerwohnung. Ich bin durch mein Studium auf Couchsurfing aufmerksam geworden und konnte es bereits mehrere Male nutzen. Jetzt bin ich an der Reihe meinen Mitstudierenden mit meinem Sofa etwas zurückzugeben. Das Sofa ist ausziehbar und bietet für bis zu 2 Personen platzt, falls du nicht alleine in Bern schlafen möchtest oder eine:n Klassenkamerd:in mitnehmen möchtest. Ich bin immer Montags bis Freitags in Bern, dementsprechend, kann man mein Sofa auch in diesem Zeitraum mieten. Ich freue mich auf deine Nachricht!', 74, 1, '2023-01-12 14:51:40', '2023-03-25', '2023-04-28', 'Was es dir Wert ist', 1),
(78, 'Marshmallow Traum', 'https://www.bruno-wickart.ch/media/webp_image/catalog/product/cache/231c24f6d773d65d705938eaf2e09e9e/2/0/20_20254701_20_20254701_5.webp', 'Scheidweg 63', 1, 'Modernes Design, Schlafqualität zweitrangig.\r\nNein, den wir sind eine 3er WG mit einer ausziehbaren Couch, die nur darauf wartet, gebucht zu werden. Wir sind Niclas, Johanna und Klas. Wir alle studieren an der Fachhochschule Bern und sind so auf Couchsurfing aufmerksam geworden. Du anscheinend auch. Unsere Couch liegt im Wohnzimmer, welches ein separater und abschliessbarer Raum ist (für mehr Comfort) und bietet mehr als genug Platz für eine Person. Haben wir dein Interesse geweckt? Meld’ dich doch bei uns!', 76, 1, '2023-01-12 15:09:27', '2023-05-20', '2023-08-24', 'Rückenschmerzen', 1),
(79, 'Vintage Traum', 'https://medias.maisonsdumonde.com/image/upload/q_auto,f_auto/w_2000/img/rundes-1-2-sitzer-sofa-mit-samtbezug-senfgelb-1000-8-30-187892_1.jpg', 'Hasenbühlstrasse 148', 3, 'Wir sind Isabella und Sandro und studieren beide in Zürich. Wegen unterschiedlichen Kursen haben wir Couchsurfing schon mehrmals genutzt und es hat uns überzeugt. So überzeugt, dass auch wir unsere Couch anbieten wollen. Wir sind eine einfache zweier WG mit einem Wohnzimmer, dass du jederzeit nutzen kannst. Melde dich vorher aber bitte per Mail an uns, da wird ja auch immer wieder unterwegs sind und wir dir so besser sagen können, ob der gewünschte Zeitraum 100% für dich verfügbar ist. Wir freuen uns auf jede Anfrage und jede Buchung unseres Sofas.', 77, 1, '2023-01-12 15:15:55', '2023-05-02', '2023-08-25', 'Frühstück machen', 1),
(80, 'Schwebende Couch', 'https://www.insemo-bueromoebel.de/media/catalog/product/cache/322391c756b3d278fa1a3cb0cc72585f/d/e/design-loungesofa-bouli-2-sitzer_1.jpg', 'Via Stauffacher 150', 3, 'Ich bin Marco 25 und studiere MMP in Zürich. Dass Studium ist ziemlich stressig, aber ich möchte es nicht missen, meine Couch auf Couchsurfing anzubieten. Weil ich jedoch die Woche durch viel unterwegs bin, biete ich meine Couch nur am Wochenende an. Mag vielleicht etwas speziell sein, aber ich finde das eine ganz gute Idee. Falls du also schon Sonntag Abends in Zürich sein musst, dann steht dir mein Sofa liebend gerne zur Verfügung. Als kleine Randinfo: mein Wohnzimmer ist ein getrennter Raum. Du kannst ihn abschliessen und fühlst dich vielleicht so etwas wohler. Ich lade dich auch gerne ein, meine Küche und das Bad mitzubenutzen.', 78, 1, '2023-01-12 15:20:25', '2023-07-04', '2023-09-22', 'For freeee', 1),
(81, 'Goth Couch', 'https://d2ufyztka2i71u.cloudfront.net/spree/products/10314/product/Barock_Sofa_schwarz_Samt.jpg?1625920258', 'Hasenbühlstrasse 148', 3, 'Zürich ist die Hauptstadt der Schweiz.\r\n\r\nEigentlich nicht, aber ich wollte dich auf mein Inserat aufmerksam machen. Ich biete dir nämlich in unserer 4er WG ein super bequemes Sofa an. Falls es dich interessiert, das Sofa ist von Conforama, es dementsprechend bequem. Couchsurfing war mir bis jetzt eine grosse Hilfe und ich möchte diese Hilfe zurückgeben an andere Studierende. Bei uns ist die ganze Woche jemand da d.h. du kannst eigentlich das ganze Semester über unsere Couch mieten. Don\'t be shy und melde dich bei uns!', 79, 1, '2023-01-12 15:26:04', '2023-05-30', '2023-07-10', 'Einen selbstgepflückten Strauss Blumen', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(42) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `session`
--

INSERT INTO `session` (`id`, `user_id`, `token`, `timestamp`) VALUES
(210, 49, 'QbLD0ocLxMbWokaFLxzXiQPGn3M7KwsahniuYBT4nu', '2023-01-20 13:23:32'),
(211, 49, '4pD8kRvQsGJ3qtTT0QPag7JZr8QvnF6g2ZOy8C0kU6', '2023-01-20 11:29:22');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stadt`
--

CREATE TABLE `stadt` (
  `ID` int(11) NOT NULL,
  `stadt` varchar(42) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `stadt`
--

INSERT INTO `stadt` (`ID`, `stadt`) VALUES
(1, 'Bern'),
(2, 'Chur'),
(3, 'Zürich');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `profilbild` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `profilbild`) VALUES
(49, '111', '111@111.ch', '$2y$10$iPUTX1DJcIaRg4tDlW13Yu0zXK6wT/dkJA.dGDA.szCHzrY/pcZoO', ''),
(50, '222', '222@222.ch', '$2y$10$TSAZ77akYCm2Lz9JjIBrk.5pS54wrVJeB5vv6N.V0By6Wwxqz6.sW', ''),
(51, '333', '333@333.ch', '$2y$10$ss46r8leoT1iOoPFHllV2.wP70O64j9XIPg/xGmT0KhWcDawAOS66', ''),
(52, 'Anja', 'a@k.ch', '$2y$10$F3KHoVpoipAShJDEa32C2utXvfsJGq9p8mVCeoTp6p0U7pmGAp2mu', ''),
(54, 'Daniel', 'd@d', '$2y$10$GRaoT5oY.qb32J2T3jTzrO5UHKr0Wpz6AWV.CjBYKwrVNi3pCCJHO', ''),
(58, 'Adrian', 'a@a.ch', '$2y$10$Y1oGNOK1IxGLKePIdikn1.Uhy37Cu4DCAqNXtFx0cHFO7KnS.YZbG', ''),
(59, 'Noemi', 'n@n.ch', '$2y$10$hCzK7MNaFHjtS0NLSfH5u.b09yXFU0QySuXlhVWnGf5335rKsT4XW', ''),
(60, 'mariel', 'm@m.ch', '$2y$10$xeAAroRYHZxko.OiWs8JTe6CG8MFkFhX/LisVieyNMuo7wSNvENDW', ''),
(64, 'Marius', 'm@mm.ch', '$2y$10$.qdijBUHDrmL8jrZ6wSPU.D6f.GIvpfnl.yw5NTXrvXJr3ah.zopi', ''),
(65, 'Michelle', 'mm@mm.ch', '$2y$10$IcRWHMPL1wz1vWvO.IZGK.z8wCpHTSA3gOQFqFmP9/G3o.31T3jT.', ''),
(66, 'Asha', 'a@d.ch', '$2y$10$1J7DAjbehQIhwLONfLKkp.6RpEbvR9aiDcGjb9Fc9yxCpHgEX.MS6', ''),
(67, 'Lea', 'l@l.ch', '$2y$10$nBIfa.2hVp/PhdJQQnN5Eu/ImH.Wm0vs5SbozCU27AmXuLTdczU1y', ''),
(68, 'Tamara', 't@t.ch', '$2y$10$kCVhrjbl1NRTIm1wz42kruemY8ws2a/1y3zctEwculVMbyqkIU/nC', ''),
(69, 'Nicole', 'n@nn.ch', '$2y$10$ongYReJ5PNywVFaSneQyc.wwHl3kqgt2cWrnfZrv1H02uG4Js7AEG', ''),
(70, 'David', 'd@d.ch', '$2y$10$B3KuTV/JJbU.hWPYgMYK6OK7jv73NPx926ZsItT3nzAbrIZVKJ1FK', ''),
(71, 'Christof', 'c@c.ch', '$2y$10$d7A.nX9cmR2YhvAKlce8uu2xS7z8asOzvpioHc6MLN.wJlfjljm8W', ''),
(72, 'Deine Mudda', 'mudda@mudda.ch', '$2y$10$Sffto4W3EYMlyc0vbljA1u7oLAO2gQpMCzztis9YsoLhN0v4AZJnG', ''),
(73, 'Beni', 'b@b.ch', '$2y$10$t/ag6RWTV28n0gDXCbOuiupkF6mIzPz4MA2JijDHFmXaBMPNRUVDy', ''),
(74, 'Ronald', 'r@r.ch', '$2y$10$KNf11bUk2o206WmTqndxM.Tumxlw1umFHevVJHDlidy0Dt5ctmQm2', ''),
(75, 'Manuel', 'm@mmm.ch', '$2y$10$qKIGqHCm4BT.bERMkchJwOY6EcoHtaHRthnsUVlZ6Vp/yloaITPea', ''),
(76, 'Sandro', 's@s.ch', '$2y$10$gSST7km91ZoWi4TVQj9e3.WcyNdO26vOhzUziUkRhpt0NMpzJiomG', ''),
(77, 'Wolfgang', 'w@w.ch', '$2y$10$nrmUcqvLkxwfkJ.fwQKtZedWv0thwlRF3kusG9lCGOaOARPwoEW2a', ''),
(78, 'Amina', 'aa@aa.ch', '$2y$10$wcOtYYJ3l.exsjsGR1bbfe10KZ2aYi/jxZVZIXS2N1oneok2SzOFa', ''),
(79, 'Charlotte', 'c@cc.ch', '$2y$10$mOzz2S0msUDVabs3iUkCWuIgX37UcJypJPf0dDHCrTlu3z4OfINk2', '');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `buchungsanfrage`
--
ALTER TABLE `buchungsanfrage`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `couch`
--
ALTER TABLE `couch`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `stadt` (`stadt`),
  ADD KEY `user` (`anbieter_user_id`);

--
-- Indizes für die Tabelle `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_userid` (`user_id`);

--
-- Indizes für die Tabelle `stadt`
--
ALTER TABLE `stadt`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `buchungsanfrage`
--
ALTER TABLE `buchungsanfrage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT für Tabelle `couch`
--
ALTER TABLE `couch`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT für Tabelle `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;
--
-- AUTO_INCREMENT für Tabelle `stadt`
--
ALTER TABLE `stadt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
