module repo

import math.util

// undo drop the last commit.
pub fn (self Repository) undo() ? {
	self.exec('reset HEAD^') ?
}

// reset drop the last n commits.
pub fn (self Repository) reset(n int) ? {
	qty := util.imax(n, 1)
	self.exec('reset HEAD~$qty') ?
}
