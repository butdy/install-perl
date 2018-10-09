#! perl
use strict;
use warnings;
use threads;
use threads::shared;

my $startTime = time();

$|++;
my $semSTDOUT :shared;
sub tprint{
	lock $semSTDOUT;
	print STDERR (time() - $startTime) .  "s : Thread " . threads->tid() . " - " . join(" ", @_) . "\n";
}

my $command;
if (@ARGV) {
	print "### Running a perl script ###\n";
	$command = 'perl -e "print \"hello world\""';
}else{
	print "### Running a regular command ###\n";
	$command = 'echo hello world';
}

#all of these threads will be created while main thread is not reading from stdin
tprint("> Creating threads");
my @threads;

#threads that will execute command after main thread is reading from stdin again
push @threads, threads->create('threadWait') for 1..3;
sleep 1;
tprint("All Threads created");

tprint("> Waiting for input now. All threads should finish now without pressing enter");
<STDIN>;
tprint("> Input received, all done");

$_->join() for @threads;
tprint("All Threads joined");
exit 0;

sub threadWait{
	#close STDIN; #seemed to have no effect...
	tprint("Created");
	sleep 3;#just give main thread a little extra time to read stdin
	tprint("Starting '$command'");
	my $output = `$command`;
	chomp $output;
	tprint("Finished the command: $output");
}
