#
#	This file is part of PsychoStats.
#
#	Written by Jason Morriss
#	Copyright 2008 Jason Morriss
#
#	PsychoStats is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#
#	PsychoStats is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with PsychoStats.  If not, see <http://www.gnu.org/licenses/>.
#
#	$Id: firearms.pm 450 2008-05-20 11:34:52Z lifo $
#
package PS::Map::halflife::firearms;

use strict;
use warnings;
use base qw( PS::Map::halflife );

our $VERSION = '1.00.' . (('$Rev: 450 $' =~ /(\d+)/)[0] || '000');

our $TYPES = {
	blue_forcekills		=> '+',
	red_forcekills		=> '+',
	joinedred_force		=> '+',
	joinedblue_force		=> '+',
	joinedspectator		=> '+',
	red_forcewon		=> '+',
	red_forcewonpct		=> [ percent2 => qw( red_forcewon blue_forcewon ) ],
	red_forcelost		=> '+',
	blue_forcewon		=> '+',
	blue_forcewonpct		=> [ percent2 => qw( blue_forcewon red_forcewon ) ],
	blue_forcelost		=> '+',
	ffkills		=> '+',
	bandage		=> '+',
	medevac		=> '+',
	capturepoint		=> '+',
};

# override parent methods to combine types
sub get_types { return { %{$_[0]->SUPER::get_types}, %$TYPES } }

# allows the parent to determine our local types
sub mod_types { $TYPES };

sub has_mod_tables { 1 }

1;
