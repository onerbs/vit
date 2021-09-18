module repo

import uwu.str

// add push the selected files to the stage.
pub fn (self Repository) add(files ...string) ? {
	list := files.map(str.safe_quote(it)).join(' ')
	self.exec('add $list') ?
}

// restore remove the selected files from the stage.
pub fn (self Repository) restore(files ...string) ? {
	list := files.map(str.safe_quote(it)).join(' ')
	self.exec('restore $list') ?
}
