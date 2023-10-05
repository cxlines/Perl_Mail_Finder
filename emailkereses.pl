use strict;
use warnings;

#bemenet megadasa

print "Kerem adja meg a vizsgalando fajl nevet: ";
my $be_fajl = <STDIN>;
chomp($be_fajl);

#bemenet megadasanak ellenorzese - ha nem szoveges fajl hiba

unless (open(INPUT, '<', $be_fajl)) {
    die "Hiba tortent megnyitaskor '$be_fajl': $!";
}


#szukseges azonosito minta - tehat mely karakterek es hol fordulnak elo - milyen sorrendben

my $minta_mail = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/;

#minden sorban keresunk egy a mintahoz hasonlo stringet - szoveget es ha talalunk kiiratjuk

while (my $egysor = <INPUT>) {
    my @email_cimek = $egysor =~ /$minta_mail/g;
    if (@email_cimek) {
        print "Talalt email cim: @email_cimek \n";
    }
}

#az algoritmuson kivul allo zaro uzenet - ha veget ert az algoritmus

print "\nAz algoritmus veget ert! \nKeszitette: Muller Istvan - UJS FEI 2023";
