module repo

// commit create a new commit with the provided message.
pub fn (self Repository) commit(msg string) ? {
	self.exec('commit -m "$msg"') ?
}

// amend amend the previous commit with the provided message.
pub fn (self Repository) amend(msg string) ? {
	self.exec('commit --amend "$msg"') ?
}
