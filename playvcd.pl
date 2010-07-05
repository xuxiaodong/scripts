#!/usr/bin/env perl
#
# Playing VCD DAT files with MPlayer
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

use 5.012;
use warnings;

my $mount   = "/bin/mount";
my $filesys = "iso9660";
my $cdrom   = "/dev/hda";
my $path    = "/mnt/cdrom/";
system $mount, "-t", $filesys, $cdrom, $path;

$path .= "mpegav/";
opendir( my $vcd, $path );
my @files = grep {/\.dat$/} readdir($vcd);
closedir($vcd);

my $mplayer = "/usr/bin/mplayer";
for my $number ( 2 .. scalar @files ) {
    system $mplayer, "-cdrom-device", $cdrom, "vcd://$number";
}
