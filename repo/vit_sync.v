module repo

pub fn (self Repository) fetch(args ...string) ? {
	self.exec('fetch ' + args.join(' ')) ?
}

pub fn (self Repository) pull(args ...string) ? {
	self.exec('pull ' + args.join(' ')) ?
}

pub fn (self Repository) push(args ...string) ? {
	self.exec('push ' + args.join(' ')) ?
}

// string return the current git status.
pub fn (self Repository) status() ?string {
	return self.exec('status')
}
