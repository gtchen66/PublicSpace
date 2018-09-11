#!/usr/local/bin/perl
#
# convert unixtime to human readable.
# search for any 10-digit string and try to convert.

while ($line = <>) {
    chomp $line;

    $val = $line;

    if ($val =~ /^(\d\d\d\d\d\d\d\d\d\d)$/) {
	# nothing but a date value
	my @dt_ary = localtime($val);

	$dt = sprintf("%04d%02d%02d.%02d%02d%02d",$dt_ary[5]+1900,$dt_ary[4]+1,$dt_ary[3],$dt_ary[2],$dt_ary[1],$dt_ary[0]);
	$val = $dt;
    } 
   
    while ($val =~ /^(.*[^\d])(\d\d\d\d\d\d\d\d\d\d)([^\d].*)$/) {
	$str_be = $1;
	$str_dt = $2;
	$str_ed = $3;
	my @dt_ary = localtime($str_dt);

	$dt = sprintf("%04d%02d%02d.%02d%02d%02d",$dt_ary[5]+1900,$dt_ary[4]+1,$dt_ary[3],$dt_ary[2],$dt_ary[1],$dt_ary[0]);
	$val = $str_be . $dt . $str_ed;
    }

    while ($val =~ /^(\d\d\d\d\d\d\d\d\d\d)([^\d].*)$/) {
	$str_dt = $1;
	$str_ed = $2;
	my @dt_ary = localtime($str_dt);

	$dt = sprintf("%04d%02d%02d.%02d%02d%02d",$dt_ary[5]+1900,$dt_ary[4]+1,$dt_ary[3],$dt_ary[2],$dt_ary[1],$dt_ary[0]);
	$val = $dt . $str_ed;
    }

    while ($val =~ /^(.*[^\d])(\d\d\d\d\d\d\d\d\d\d)$/) {
	$str_be = $1;
	$str_dt = $2;
	my @dt_ary = localtime($str_dt);

	$dt = sprintf("%04d%02d%02d.%02d%02d%02d",$dt_ary[5]+1900,$dt_ary[4]+1,$dt_ary[3],$dt_ary[2],$dt_ary[1],$dt_ary[0]);
	$val = $str_be . $dt;
    }

    print $val . "\n";
}
