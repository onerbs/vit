module repo

import uwu.str

// stage push the selected files to the stage.
pub fn (self Repository) stage(files ...string) ? {
	list := files.map(str.safe_quote(it)).join(' ')
	self.exec('add $list') ?
}

// unstage remove the selected files from the stage.
pub fn (self Repository) unstage(files ...string) ? {
	list := files.map(str.safe_quote(it)).join(' ')
	self.exec('restore --staged $list') ?
}

// restore discard the changes on the selected files.
pub fn (self Repository) restore(files ...string) ? {
	list := files.map(str.safe_quote(it)).join(' ')
	self.exec('restore $list') ?
}
