#!/usr/bin/perl
#Gives options on managing phonebook entries
#if no command line arguments are given exit
if($#ARGV < 0){
print "must enter file to run the script at command line";
exit 0;
}
#list of options listed
my $file = $ARGV[0];
print "--Phone Book Options--\n";
print "1.List Records alphabetically by first name\n";
print "2.List Records alphabetically by last name\n";
print "3.List Records in Reverse Alphabetical order by first name\n";
print "4.List Records in Reverse Alphabetical order by last name\n";
print "5.Search Records for a Last name and print results\n";
print "6.Search Records by birthday month\n";
print "7.Search records by birthday year\n";
print "Enter desired option(1-7): ";
#take in the users choice for options
$answer = <STDIN>;
chomp($answer);
#create and array and open the given file name at command line, then put it into array split by ':'
my @lines;
open (FILEHERE, $file);
while(<FILEHERE>) {
push @lines, [split /:/];
}
#since there is no case statement for perl used if statement to process users choce
#phonebook printed in alphabetical order
if ( $answer == 1 ) {
my @sorted = sort { $a->[0] cmp $b->[0] } @lines;
foreach my $l (@sorted) { print $l->[0], ":", $l->[1], ":", $l->[2], ":", $l->[3], ":", $l->[4], ":", $l->[5] }
}
#phonebook prined in alphabetical by last name
elsif ( $answer == 2 )  {
my @sorted = sort { $a->[0] <=> $b->[0] } @lines;
foreach my $l (@sorted) { print $l->[0], ":", $l->[1], ":", $l->[2], ":", $l->[3], ":", $l->[4], ":", $l->[5] }
}
#print in reverse alphabetical by first name
elsif ( $answer == 3 ) {
my @sorted = reverse sort { $a->[0] cmp $b->[0] } @lines;
foreach my $l (@sorted) { print $l->[0], ":", $l->[1], ":", $l->[2], ":", $l->[3], ":", $l->[4], ":", $l->[5] }
}
#print in reverse alphabetical by last name
elsif ( $answer == 4 ) {
my @sorted = reverse sort { $a->[0] <=> $b->[0] } @lines;
foreach my $l (@sorted) { print $l->[0], ":", $l->[1], ":", $l->[2], ":", $l->[3], ":", $l->[4], ":", $l->[5] }
}
#take in last name then split the first name from the last
#and search trough the last names for match, if match print
elsif ( $answer == 5 ) {
print "Enter a last name to search for: ";
$last = <STDIN>;
chomp($last);
foreach my $l (@lines) {
my @last = split(' ',$l->[0]);
if(@last[1] eq $last){
print $l->[0], ":", $l->[1], ":", $l->[2], ":", $l->[3], ":", $l->[4], ":", $l->[5] }
}
}
#enter month for birthday, then split the birthday field into 3 parts seperated by '/'
#then compare the first field to the month if the same print
elsif ( $answer == 6 ) {
print "Enter a month(1-12): ";
$mon = <STDIN>;
chomp($mon);
foreach my $l (@lines) {
my @date = split('/',$l->[4]);
if(@date[0] eq $mon){
print $l->[0], ":", $l->[1], ":", $l->[2], ":", $l->[3], ":", $l->[4], ":", $l->[5] }
}
}
#works the same as the month search but change the comparison to the thrid field
elsif ( $answer == 7 ) {
print "Enter a year(two digits): ";
$mon = <STDIN>;
chomp($mon);
foreach my $l (@lines) {
my @date = split('/',$l->[4]);
if(@date[2] eq $mon){
print $l->[0], ":", $l->[1], ":", $l->[2], ":", $l->[3], ":", $l->[4], ":", $l->[5] }
}
}
#if an option is not chosen then print this
else {
print "That is not a choice\n";
}
