le but de ce programme est  de prendre 5 documents text
(contenat 5 domaine differents ) est les classifier selon leur domaine
pour une solusion on propopse de creer 5 dic contenant des termes specifique a chaque domaines
et calculer la distance entre chaque dic (vect de mots) et fichier text(vecteur de mots)
 et enfin prendre la valeur maximal
 le dossier dico :contient les dictionnaires
 
 poue executer le programme ;
 
 1-extract classification.rar,document.rar,document
 
 2-change the path of your folder in this line 
 
                     my $RepBase   = 'D:\WorkSpace\eclips\Perl_KNN/document';
                     my $RepResult = 'D:\WorkSpace\eclips\Perl_KNN/classification';
                     my $RepDico   = 'D:\WorkSpace\eclips\Perl_KNN\dico';
                     
                  to 
                     
                     my $RepBase   = 'D:\WorkSpace\eclips\Name_of your folder/document';
                     my $RepResult = 'D:\WorkSpace\eclips\Name_of your folder/classification';
                     my $RepDico   = 'D:\WorkSpace\eclips\Name_of your folder\dico';
                     
                     
                     
                     Enjoy!
