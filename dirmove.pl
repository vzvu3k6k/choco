#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my $arg = shift;
$arg = 1 unless $arg;

my $dir = '.';
my $pwd = `pwd`;

main($pwd, $dir, $arg);

sub main {
    ($pwd, $dir, $arg) = @_;
    chomp($pwd);

    # 選択（peco/sentaku）
    my $selector = '';
    if ($arg eq 's') {
        $selector = 'sentaku'
    } else {
        $selector = 'peco'
    }

    # 不可視チェック
    my $option = '';
    my $back = '';

    if ($arg eq '.') {
        $option = '-aF';
    } else {
        $option = '-F';
        $back = "../\n";
    }

    $dir = `
    if [ -n "\$( ls "$option" "$pwd" | grep / )" ]; then
        str="$back"
        str+=\$( ls "$option" "$pwd" | grep / )
        for i in \$str
        do
            echo \$i
        done | "$selector"
    else
        echo ''
    fi 2>/dev/null
    `;

    # ディレクトリが無ければ（＝改行が戻り）脱出
    out($pwd) if ($dir =~ /\A\n\z/);

    # 移動中断したら（＝空文字が戻り）脱出
    if ($dir eq '') {
        out($pwd);
    } else {
        $dir =~ s/\/$//;
        $pwd = "$pwd/$dir";
        main($pwd, $dir, $arg);
    }
}

sub out {
    $pwd = shift;
    print `echo $pwd`;
    exit;
}