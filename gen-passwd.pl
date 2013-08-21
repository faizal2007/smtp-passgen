#!/usr/bin/perl -w
#/**
# * @author freakie <faizal@geekshelves.com>
# * @Description 
# *  - generate smtp password hash when telnet for mail sending testing
# *
#**/


use MIME::Base64;
use feature 'switch';
sub interactive
{
    $noargv = scalar(@ARGV);
    
    if($noargv > 0)
    {
        print "Application : gen-passwd \nDescription : Postfix SMTP Password generator for telnet usage \nVersion : 1.0";
        print "\nNon Intractive mode are not available in current version\n\t Do use ./gen-passwd.pl or perl gen-passwd.pl\n\n ";
    }
    else
    {
        # Allow user to key info input by input
        print "Enter Domain : ";
        chomp($domain = <>);

        print "Enter Username : ";
        chomp($username = <>);

        print "Enter Password : ";
        system('stty','-echo');
        chop($password=<STDIN>);
        system('stty','echo');
    
    
        $coded = "\000".$username."\@".$domain."\000".$password;
        $encoded = encode_base64($coded);
        print "\nTelnet auth plain : ";
        print $encoded;
    }
}

interactive();
