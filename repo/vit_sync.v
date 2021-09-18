module repo

// fetch fetch all changes from the remote.
pub fn (self Remote) fetch(args ...string) ? {
	self.exec('fetch ' + args.join(' ')) ?
}

// fetch_upstream fetch the changes to the remote.
pub fn (self Remote) fetch_upstream() ? {
	branch := self.get_branch() ?
	self.fetch('--set-upstream', self.name, branch) ?
}

// fetch_current fetch the chages in the current branch from the remote.
pub fn (self Remote) fetch_current() ? {
	branch := self.get_branch() ?
	self.fetch_branch(branch) ?
}

// fetch_branch fetch the changes from the specfied branch from the remote.
pub fn (self Remote) fetch_branch(branch string) ? {
	self.fetch(self.name, branch) ?
}

// -------------------------------------

// pull pull all changes from the remote.
pub fn (self Remote) pull(args ...string) ? {
	self.exec('pull ' + args.join(' ')) ?
}

// pull_upstream pull the changes to the remote.
pub fn (self Remote) pull_upstream() ? {
	branch := self.get_branch() ?
	self.pull('--set-upstream', self.name, branch) ?
}

// pull_current pull the chages in the current branch from the remote.
pub fn (self Remote) pull_current() ? {
	branch := self.get_branch() ?
	self.pull_branch(branch) ?
}

// pull_branch pull the changes from the specfied branch from the remote.
pub fn (self Remote) pull_branch(branch string) ? {
	self.pull(self.name, branch) ?
}

// -------------------------------------

// push push the changes to the remote.
pub fn (self Remote) push(args ...string) ? {
	self.exec('push ' + args.join(' ')) ?
}

// push_upstream push the changes to the remote.
pub fn (self Remote) push_upstream() ? {
	branch := self.get_branch() ?
	self.push('--set-upstream', self.name, branch) ?
}

// push_current push the chages in the current branch to the remote.
pub fn (self Remote) push_current() ? {
	branch := self.get_branch() ?
	self.push_branch(branch) ?
}

// push_branch push the changes from the specfied branch to the remote.
pub fn (self Remote) push_branch(branch string) ? {
	self.push(self.name, branch) ?
}
