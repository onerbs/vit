module repo

// fetch fetch the changes from the specified remote.
pub fn (self Branch) fetch(remote string) ? {
	self.repo.exec('fetch $remote $self.name') ?
}

// fetch fetch the changes to the current branch.
pub fn (self Remote) fetch() ? {
	self.repo.get_current_branch().fetch(self.name) ?
}

// fetch_branch fetch the changes to the specified branch.
pub fn (self Remote) fetch_branch(branch string) ? {
	self.repo.get_branch(branch) ?.fetch(self.name) ?
}

// fetch_upstream fetch the changes from the specified remote
// and set up the upstream to the branch in the remote.
pub fn (self Remote) fetch_upstream() ? {
	branch := self.repo.get_current_branch().name
	self.repo.exec('fetch --set-upstream $self.name $branch') ?
}

// -------------------------------------

// pull pull the changes from the specified remote.
pub fn (self Branch) pull(remote string) ? {
	self.repo.exec('pull $remote $self.name') ?
}

// pull pull the changes to the current branch.
pub fn (self Remote) pull() ? {
	self.repo.get_current_branch().pull(self.name) ?
}

// pull_branch pull the changes to the specified branch.
pub fn (self Remote) pull_branch(branch string) ? {
	self.repo.get_branch(branch) ?.pull(self.name) ?
}

// pull_upstream pull the changes from the specified remote
// and set up the upstream to the branch in the remote.
pub fn (self Remote) pull_upstream() ? {
	branch := self.repo.get_current_branch().name
	self.repo.exec('pull --set-upstream $self.name $branch') ?
}

// -------------------------------------

// push push the changes to the specified remote.
pub fn (self Branch) push(remote string) ? {
	self.repo.exec('push $remote $self.name') ?
}

// push push the changes in the current branch.
pub fn (self Remote) push() ? {
	self.repo.get_current_branch().push(self.name) ?
}

// push_branch push the changes in the specified branch.
pub fn (self Remote) push_branch(branch string) ? {
	self.repo.get_branch(branch) ?.push(self.name) ?
}

// push_upstream push the changes to the specified remote
// and set up the upstream to the branch in the remote.
pub fn (self Remote) push_upstream() ? {
	branch := self.repo.get_current_branch().name
	self.repo.exec('push --set-upstream $self.name $branch') ?
}
