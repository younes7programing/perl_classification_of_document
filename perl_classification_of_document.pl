#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use diagnostics;
use File::Spec


  ;    # Permet une meilleure gestion des noms des chemins sous tous les OS
use Data::Dumper qw(Dumper);

$| = 1;

#==============================================================================================
# le but de ce tp est  de prendre 5 documents text
#(contenat 5 domaine differents ) est les classifier selon leur domaine
# pour une solusion on propopse de creer 5 dic contenant des termes specifique a chaque domaines
# et calculer la distance entre chaque dic (vect de mots) et fichier text(vecteur de mots)
# et enfin prendre la valeur maximal
#================================================================================================
ActiverAccents();
my $RepBase   = 'D:\WorkSpace\eclips\perl_classification_of_document/document';
my $RepResult = 'D:\WorkSpace\eclips\perl_classification_of_document/classification';
my $RepDico   = 'D:\WorkSpace\eclips\perl_classification_of_document\dico';
my @Docs      = (
	'a1.txt', 'a2.txt',  'a3.txt', 'a4.txt',  'a5.txt', 'a6.txt',
	'a7.txt', 'a8.txt',  'a9.txt', 'a10.txt', 'b1.txt', 'b2.txt',
	'b3.txt', 'b4.txt',  'b5.txt', 'b6.txt',  'b7.txt', 'b8.txt',
	'b9.txt', 'b10.txt', 'i1.txt', 'i2.txt',  'i3.txt', 'i4.txt',
	'i5.txt', 'i6.txt',  'i7.txt', 'i8.txt',  'i9.txt', 'i10.txt',
	's1.txt', 's2.txt',  's3.txt', 's4.txt',  's5.txt', 's6.txt',
	's7.txt', 's8.txt',  's9.txt', 's10.txt', 'p1.txt', 'p2.txt',
	'p3.txt', 'p4.txt',  'p5.txt', 'p6.txt',  'p7.txt', 'p8.txt',
	'p9.txt', 'p10.txt',
);

my $DicoSport        = File::Spec->catfile( $RepDico, 'DicoSport.txt' );
my $DicoAnatomie     = File::Spec->catfile( $RepDico, 'DicoAnatomie.txt' );
my $DicoPhilo        = File::Spec->catfile( $RepDico, 'DicoPhilo.txt' );
my $DicoInformatique = File::Spec->catfile( $RepDico, 'DicoInformatique.txt' );
my $DicoBotanique    = File::Spec->catfile( $RepDico, 'DicoBotanique.txt' );
my $MotDico          = File::Spec->catfile( $RepDico, 'MotsDico.txt' );

my $fh_Sport;

open $fh_Sport, '<', $DicoSport or die("Impossible ouvrir  $DicoSport");

my @dic_Sport = <$fh_Sport>;
my %count;

if ( -s $DicoSport ) {
	my %count1;
	my $i = 0;
	open( STDIN, $DicoSport );
	while ( my $line1 = <STDIN> ) {
		chomp $line1;
		foreach my $str ( split /\s+/, $line1 ) {
			$count1{$str}++;
			$i++;

			#print "$i\n";
		}

	}

	my $taille = -s $DicoSport;
	print "Le doc Sport contient $i mots\t et de taille $taille ko\n";
}
else {
	print "Le fichier est  vide\n";
}
close $fh_Sport;
my $NbSport = scalar(@dic_Sport);

#print $fh_Resul  "@dic_Sport\n";

my $fh_Anatomie;
open $fh_Anatomie, '<', $DicoAnatomie
  or die("Impossible ouvrir  $DicoAnatomie");
my @dic_Anatomie = <$fh_Anatomie>;
if ( -s $DicoAnatomie ) {
	my %count1;
	my $i = 0;
	open( STDIN, $DicoAnatomie );
	while ( my $line1 = <STDIN> ) {
		chomp $line1;
		foreach my $str ( split /\s+/, $line1 ) {
			$count1{$str}++;
			$i++;

			#print "$i\n";
		}

	}
	my $taille = -s $DicoAnatomie;
	print "Le doc Anatomie contient $i mots\t et de taille $taille ko\n";
}
else {
	print "Le fichier est  vide\n";
}
close $fh_Anatomie;
my $NbAnatomie = scalar(@dic_Anatomie);

#print $fh_Resul  "@dic_Anatomie\n";

my $fh_Philo;
open $fh_Philo, '<', $DicoPhilo or die("Impossible ouvrir  $DicoPhilo");
my @dic_Philo = <$fh_Philo>;
for my $dic_Philo (@dic_Philo) {
	my $int++;
}
if ( -s $DicoPhilo ) {
	my %count1;
	my $i = 0;
	open( STDIN, $DicoPhilo );
	while ( my $line1 = <STDIN> ) {
		chomp $line1;
		foreach my $str ( split /\s+/, $line1 ) {
			$count1{$str}++;
			$i++;

			#print "$i\n";
		}

	}
	my $taille = -s $DicoPhilo;
	my $age    = -M $DicoPhilo;
	print "Le doc Philo contient $i mots \t et de taille $taille ko\n";
}
else {
	print "Le fichier est  vide\n";
}
close $fh_Philo;
my $NbPhilo = scalar(@dic_Philo);

my $fh_Informatique;
open $fh_Informatique, '<', $DicoInformatique
  or die("Impossible ouvrir  $DicoInformatique");
my @dic_Informatique = <$fh_Informatique>;
if ( -s $DicoInformatique ) {
	my %count1;
	my $i = 0;
	open( STDIN, $DicoInformatique );
	while ( my $line1 = <STDIN> ) {
		chomp $line1;
		foreach my $str ( split /\s+/, $line1 ) {
			$count1{$str}++;
			$i++;

			#print "$i\n";
		}

	}
	my $taille = -s $DicoInformatique;
	print "Le fichier contient  $i mots\t et de taille $taille ko\n";
}
else {
	print "Le doc Informatique est  vide\n";
}
close $fh_Informatique;
my $NbInformatique = scalar(@dic_Informatique);

my $fh_Botanique;
open $fh_Botanique, '<', $DicoBotanique
  or die("Impossible ouvrir  $DicoBotanique");
my @dic_Botanique = <$fh_Botanique>;
if ( -s $DicoBotanique ) {
	my %count1;
	my $i = 0;
	open( STDIN, $DicoBotanique );
	while ( my $line1 = <STDIN> ) {
		chomp $line1;
		foreach my $str ( split /\s+/, $line1 ) {
			$count1{$str}++;
			$i++;

			#print "$i\n";
		}

	}
	my $taille = -s $DicoBotanique;
	print "Le doc Botanique contient $i mots\t \t et de taille $taille ko\n";

}
else {
	print "Le fichier est  vide\n";
}
close $fh_Botanique;
my $NbBotanique = scalar(@dic_Botanique);

#print $fh_Resul  "@dic_Philo\n";

my $FicResultat  = File::Spec->catfile( $RepResult, 'Resultat.txt' );
my $FicDeduction = File::Spec->catfile( $RepResult, 'Deduction.txt' );
my $fh_Resul;
my $fh_Deduc;
open $fh_Resul, '>', $FicResultat or die("Impossible ouvrir $FicResultat");
open $fh_Deduc, '>', $FicDeduction
  or die("Impossible ouvrir $FicDeduction");

my $fh_Dico;
open $fh_Dico, '<', $MotDico or die("Impossible ouvrir  $MotDico");
my @TabMots = <$fh_Dico>;

if ( -s $MotDico ) {

	my %count1;
	my $i = 0;
	open( STDIN, $MotDico );
	while ( my $line1 = <STDIN> ) {
		chomp $line1;
		foreach my $str ( split /\s+/, $line1 ) {
			$count1{$str}++;
			$i++;

			#print "$i\n";
		}

	}
	my $taille = -s $MotDico;
	print
"Le doc dictionnaire de tout les mots contient $i mots\t \t et de taille $taille ko\n";
}
else {
	print "Le doc TabMots est  vide\n";
}
close $fh_Dico;

#print $fh_Resul  "@TabMots\n";

my @nom_recuperer = ();
print "\t**** information sur les 50 documents *****\n";
foreach my $Document (@Docs) {
	print $fh_Resul "\n\n=============================================\n";
	print $fh_Resul "\t\tTraitement du fichier $Document :";
	print $fh_Resul "\n\n=============================================\n";
	my $In_Fic = File::Spec->catfile( $RepBase, $Document );

	my $fh_Entree;
	open $fh_Entree, '<', $In_Fic
	  or die("Impossible ouvrir  $In_Fic");
	#################################
	print
"======================================================================================\n";

	my %count1;
	my $i = 0;
	open( STDIN, $In_Fic );
	if ( $Document) {
		while ( my $line1 = <STDIN> ) {
			chomp $line1;
			foreach my $str ( split /\s+/, $line1 ) {
				$count1{$str}++;
				$i++;

				#print "$i\n";
			}

		}
		my $taille = -s $fh_Entree;
		print
		  "Le doc $Document  contient $i mots\t \t et de taille $taille ko\n";
	}
	else {
		print "Le doc $Document est  vide\n";
	}
#################################
	my %Comptage = ();
	my $NbLigne;
	while ( my $Ligne = <$fh_Entree> ) {
		$NbLigne++;
		foreach my $Mot (@TabMots) {
			chomp $Mot;
			if ( $Ligne =~ $Mot ) {
				$Comptage{$Mot}++;

				#print $fh_Resul  "$Mot a la ligne $NbLigne\n";
			}
		}
	}

	#print $fh_Resul  "\n\n";
	while ( my ( $Mot, $Nb ) = each(%Comptage) ) {
		print $fh_Resul "Le mot '$Mot' est present $Nb fois\n";

		#remplir les mots trouver dans le tableau[] nom_recuperer
		push @nom_recuperer, $Mot;
	}

	#print $fh_Resul  "@nom_recuperer\t\n";

	#comparez les mots avec les dico

	my $Sport        = compare_with_dic_Sport($Document);
	my $Anatomie     = compare_with_dic_Anatomie($Document);
	my $Philo        = compare_with_dic_Philo($Document);
	my $Informatique = compare_with_dic_Philo($Document);
	my $Botanique    = compare_with_dic_Philo($Document);
	$Sport        = sprintf( "%0.2f", $Sport );
	$Philo        = sprintf( "%0.2f", $Philo );
	$Anatomie     = sprintf( "%0.2f", $Anatomie );
	$Informatique = sprintf( "%0.2f", $Informatique );
	$Botanique    = sprintf( "%0.2f", $Botanique );

#print $fh_Deduc  "\n\nDÃ©duction :\n$Document est Sport Ã  $Sport%, Anthropologique Ã  $Anatomie% et Philo Ã  $Philo%\n\n";

#print $fh_Deduc  "\n\nDeduction :\n$Document est Sport a $Anatomie%, Anthropologique a $Sport% et Philo a $Philo%\n\n";
	if (    $Anatomie > $Sport
		and $Anatomie > $Philo
		and $Anatomie > $Informatique
		and $Anatomie > $Botanique )
	{
		print $fh_Deduc
"\n\nDeduction :\n$Document est $Anatomie a $Anatomie%, Sport a $Sport% et Philo a $Philo% et Informatique a $Informatique et Anatomie a $Anatomie \n\n \t==> \t$Document  est classe parmis les doc **  Anatomie  **\n\n";

	 #print $fh_Deduc  " $Document  est classe parmis les doc **  Anatomie  **";
		print $fh_Deduc
"\n===========================================================================\n";
		print $fh_Deduc
"\n===========================================================================\n";
	}
	if ( $Sport == 0 ) {
		print $fh_Deduc "\n\n sport est vide ";
	}
	if (    $Anatomie < $Sport && $Sport > $Philo
		and $Sport > $Informatique
		and $Sport > $Botanique )
	{
		print $fh_Deduc
"\n\nDeduction :\n$Document est simlilaire:   $Anatomie% par rapport a Anatomie,  $Sport% par rapport a  Sport et  $Philo% par rapport a Philo et  $Informatique par rapport a Informatique  et  $Anatomie par rapport a Anatomie a \n\n==>   \t$Document  est classe parmis les doc **  Sport  **\n\n";

		#print $fh_Deduc  " $Document  est classe parmis les doc **  Sport  **";
		print $fh_Deduc
"\n===========================================================================\n";
		print $fh_Deduc
"\n===========================================================================\n";
	}
	if (    $Anatomie < $Philo && $Sport < $Philo
		and $Philo > $Informatique
		and $Philo > $Botanique )
	{
		print $fh_Deduc
"\n\nDeduction :\n$Document est simlilaire:   $Anatomie% par rapport a Anatomie,  $Sport% par rapport a  Sport et  $Philo% par rapport a Philo et  $Informatique par rapport a Informatique  et  $Anatomie par rapport a Anatomie a \n\n ==> \t$Document  est classe parmis les doc **  Philo  **\n\n";

		#print $fh_Deduc  " $Document  est classe parmis les doc **  Philo  **";
		print $fh_Deduc
"\n===========================================================================\n";
		print $fh_Deduc
"\n===========================================================================\n";
	}

	if (    $Anatomie < $Informatique && $Sport < $Informatique
		and $Philo < $Informatique
		and $Informatique > $Botanique )
	{
		print $fh_Deduc
"\n\nDeduction :\n$Document est simlilaire:   $Anatomie% par rapport a Anatomie,  $Sport% par rapport a  Sport et  $Philo% par rapport a Philo et  $Informatique par rapport a Informatique  et  $Anatomie par rapport a Anatomie a \n\n \t ==> \t$Document  est classe parmis les doc **  Informatique  **\n\n";

		#print $fh_Deduc  " $Document  est classe parmis les doc **  Philo  **";
		print $fh_Deduc
"\n===========================================================================\n";
		print $fh_Deduc
"\n===========================================================================\n";
	}
	if (    $Anatomie < $Botanique && $Sport < $Botanique
		and $Botanique > $Informatique
		and $Philo > $Botanique )
	{
		print $fh_Deduc
"\n\nDeduction :\n$Document est simlilaire:   $Anatomie% par rapport a Anatomie,  $Sport% par rapport a  Sport et  $Philo% par rapport a Philo et  $Informatique par rapport a Informatique  et  $Anatomie par rapport a Anatomie a \n\n \t==> \t$Document  est classe parmis les doc **  $Botanique  **\n\n";

		#print $fh_Deduc  " $Document  est classe parmis les doc **  Philo  **";
		print $fh_Deduc
"\n===========================================================================\n";
		print $fh_Deduc
"\n===========================================================================\n";
	}
	if ( $Anatomie eq $Philo && $Sport eq $Philo ) {
		print $fh_Deduc
"\n\nDeduction :\n$Document est simlilaire:   $Anatomie% par rapport a Anatomie,  $Sport% par rapport a  Sport et  $Philo% par rapport a Philo et  $Informatique par rapport a Informatique  et  $Anatomie par rapport a Anatomie a \n\n ==>\t le doc -$Document- est   non classe \n\n  ";
		print $fh_Deduc
"\n===========================================================================\n";
		print $fh_Deduc
"\n===========================================================================\n";
	}
	undef %Comptage;
	undef @nom_recuperer;
	close $fh_Entree;
}

close $fh_Resul;
close $fh_Deduc;

#################################

sub compare_with_dic_Sport {
	my ($Document) = @_;
	print $fh_Resul "\n\n ***  Comparaison de $Document avec dic_Sport\n ";
	my $count = 0;
	my %hash;
	my @words = ();
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;

	for my $val (@dic_Sport) {
		chomp $val;
		if ( exists $hash{$val} ) {

			$count++;
			push @words, $val;
		}
	}
	print $fh_Resul "Les mots @words \nsont presents dans dic_Sport   .\n";
	if ( $NbSport != 0 ) {
		my $pourcentage_appr = ( $count * 100 ) / $NbSport;
		print $fh_Resul
"\nLe nombre de mots du fichier $Document prÃ©sents dans le dic_Sport  est $count  ===>
	\tle pourcentage par raport au dic_Sport = $pourcentage_appr %";
	}
	else {
		print $fh_Resul "le dic ETH est completement vide ";
	}
}

sub compare_with_dic_Anatomie {
	my ($Document) = @_;
	print $fh_Resul "\n\n *** Comparaison de $Document avec dic_Anatomie\n ";
	my $count = 0;
	my %hash;
	my @words = ();
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;

	for my $val (@dic_Anatomie) {
		chomp($val);
		if ( exists $hash{$val} ) {

			$count++;
			push @words, $val;
		}
	}
	print $fh_Resul "Les mots @words \nsont presents dans dic_Anatomie .\n";
	my $pourcentage_appr = ( $count * 100 ) / $NbAnatomie;
	print $fh_Resul
"\nLe nombre de mots du fichier $Document prÃ©sents dans le dic_Anatomie  est $count  ===> 
	\tle pourcentage par raport au dic_Anatomie = $pourcentage_appr %";
	return $pourcentage_appr;
}

sub compare_with_dic_Philo {
	my ($Document) = @_;
	print $fh_Resul "\n\n *** Comparaison de $Document avec dic_Philo\n ";
	my $count = 0;
	my @words = ();
	my %hash;
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;

	for my $val (@dic_Philo) {
		chomp($val);
		if ( exists $hash{$val} ) {

			$count++;
			push @words, $val;
		}

	}
	print $fh_Resul "Les mots @words \nsont presents dans dic_Philo   .\n";
	my $pourcentage_appr = ( $count * 100 ) / $NbPhilo;
	print $fh_Resul
"\nLe nombre de mots du fichier $Document prÃ©sents dans le dic_Philo  est $count  ===> 
	\tle pourcentage par raport au dic_Philo = $pourcentage_appr %";
	return $pourcentage_appr;
}

sub compare_with_dic_Informatique {
	my ($Document) = @_;
	print $fh_Resul
	  "\n\n *** Comparaison de $Document avec dic_Informatique\n ";
	my $count = 0;
	my %hash;
	my @words = ();
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;

	for my $val (@dic_Informatique) {
		chomp($val);
		if ( exists $hash{$val} ) {
			print $fh_Resul
"Les mots @words \nsont presents dans dic_Informatique   la position $hash{$val}.\n";
			$count++;
			push @words, $val;
		}
	}
	print $fh_Resul
	  "Les mots @words sont presents  dans dic_Informatique   .\n";
	my $pourcentage_appr = ( $count * 100 ) / $NbInformatique;
	print $fh_Resul
"\nLe nombre de mots du fichier $Document prÃ©sents dans le dic_Informatique  est $count  ===> 
	\tle pourcentage par raport au dic_Informatique = $pourcentage_appr %";

}

sub compare_with_dic_Botanique {
	my ($Document) = @_;
	print $fh_Resul "\n\n *** Comparaison de $Document avec dic_Botanique\n ";
	my $count = 0;
	my @words = ();
	my %hash;
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;

	for my $val (@dic_Botanique) {
		chomp($val);
		if ( exists $hash{$val} ) {
			$count++;
			push @words, $val;
		}
	}
	print $fh_Resul "Les mots @words \nsont presents dans dic_Botanique  .\n";
	my $pourcentage_appr = ( $count * 100 ) / $NbBotanique;
	print $fh_Resul
"\nLe nombre de mots du fichier $Document prÃ©sents dans le dic_Botanique  est $count  ===> 
	\tle pourcentage par raport au dic_Philo = $pourcentage_appr %";
	return $pourcentage_appr;
}

#==============================================================
# Pour avoir les accents sur la console DOS
# http://perl.developpez.com/faq/perl/?page=Terminal#AccentsDOS
#==============================================================

sub ActiverAccents {
	my $encodage;

	# Windows
	if ( lc($^O) eq 'mswin32' ) {
		eval {
			my ($codepage) = ( `chcp` =~ m/:\s+(\d+)/ );
			$encodage = "cp$codepage";
			foreach my $h ( \*STDOUT, \*STDERR, \*STDIN, ) {
				binmode $h, ":encoding($encodage)";
			}
		};
	}
	else {
		$encodage = `locale charmap`;
		eval {
			foreach my $h ( \*STDOUT, \*STDERR, \*STDIN, ) {
				binmode $h, ":encoding($encodage)";
			}
		};
	}
	return $encodage;
}

#Sinon :
#ü 	\x81 	à 	\x85 	è 	\x8A
#é 	\x82 	ç 	\x87 	ï 	\x8B
#â 	\x83 	ê 	\x88 	î 	\x8C
#ä 	\x84 	ë 	\x89

