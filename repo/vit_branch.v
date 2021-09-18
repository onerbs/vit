module repo

// checkout change the current branch.
pub fn (self Repository) checkout(branch string) ? {
	self.exec('checkout $branch') ?
}

// new_branch create a new branch.
pub fn (self Repository) new_branch(name string) ? {
	self.exec('checkout -b $name') ?
}

// new_orphan create a new orphan branch.
pub fn (self Repository) new_orphan(name string) ? {
	self.exec('checkout --orphan $name') ?
}

// current_branch return the name of the current branch.
pub fn (self Repository) current_branch() ?string {
	return self.exec('branch --show-current')
}
