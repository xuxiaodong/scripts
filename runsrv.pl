#!/usr/bin/env perl
#
# Run server
#
# Copyright (C) 2010 Xiaodong Xu <xxdlhy@gmail.com>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA

use 5.010;
use strict;
use warnings;

my @tasks = qw(nginx php5-cgi mysql);
my $path  = "/etc/init.d/";

foreach my $task (@tasks) {
    chomp( my $pid = qx(pgrep -o $task) );
    my $bin = $path . $task;

    unless ($pid) {
        system $bin, "start";
    }
    else {
        say "[OK] \U$task\E is running.";
    }
}
