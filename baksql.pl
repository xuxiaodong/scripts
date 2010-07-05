#!/usr/bin/env perl
#
# Backup MySQL database
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

use strict;
use warnings;

my $user = '';
my $pass = '';

my $cwd     = '';
my $db_name = '';

chomp( my $date = `date +%Y%m%d%H%M%S` );
my $sql_name = $date . '.sql';
my $bak_name = $sql_name . '.tar.gz';

my $bak_cmd =
    "mysqldump --add-drop-table --user=$user --password=$pass $db_name > $sql_name";
my $tar_cmd = "tar czf $bak_name $sql_name";

chdir $cwd;
system $bak_cmd;
system $tar_cmd;
unlink $sql_name;
