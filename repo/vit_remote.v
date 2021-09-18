module repo

import uwu.ups
import uwu.str

pub struct Remote {
	repo  Repository [required]
mut:
	alive bool = true
	name string
	url  string
}

fn new_remote(repo Repository, line string) Remote {
	parts := str.words(line)
	return Remote{
		repo: repo
		name: parts[0]
		url: parts[1]
	}
}

// get_name return the name of this remote.
pub fn (self Remote) get_name() string {
	return self.name
}

// get_url return the URL of this remote.
pub fn (self Remote) get_url() string {
	return self.url
}

// set_url update the URL of this remote.
pub fn (mut self Remote) set_url(url string) ? {
	self.repo.exec('remote set-url $self.name $url') ?
	self.url = url
}

// rename update the name of this remote.
pub fn (mut self Remote) rename(new string) ? {
	self.repo.exec('remote rename $self.name $new') ?
	self.name = new
}

// remove delete this remote from the repository.
pub fn (mut self Remote) remove() ? {
	if self.alive {
		self.repo.exec('remote remove $self.name') ?
		self.alive = false
	}
}

// revive append this remote to the repository (again).
pub fn (mut self Remote) revive() ? {
	if !self.alive {
		self.repo.exec('remote add $self.name $self.url') ?
		self.alive = true
	}
}

// get_branch shorcut for retrieving the current branch.
fn (self Remote) get_branch() ?string {
	return self.repo.current_branch()
}

// ---------------------------------------------------------

// add_remote append a remote to this repository.
pub fn (self Repository) add_remote(name string, url string) ?Remote {
	self.exec('remote add $name $url') ?
	return self.get_remote(name)
}

// get_remotes return a list of remotes in this repository.
pub fn (self Repository) get_remotes() ?[]Remote {
	lines := self.exec('remote -v') ?.split_into_lines()
	mut res := []Remote{cap: 4}
	for line in lines {
		if line.ends_with('(push)') {
			res << new_remote(self, line)
		}
	}
	return res
}

// get_remote return the remote with the specified name.
pub fn (self Repository) get_remote(name string) ?Remote {
	for remote in self.get_remotes() ? {
		if remote.name == name {
			return remote
		}
	}
	ups.unknown('remote', name) ?
	return none
}
