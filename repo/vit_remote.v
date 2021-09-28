module repo

import uwu.ups
import uwu.str

pub struct Remote {
	repo &Repository [required]
mut:
	alive bool
	name  string
	url   string
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
pub fn (mut self Remote) rename(new_name string) ? {
	self.repo.exec('remote rename $self.name $new_name') ?
	self.name = new_name
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

// delete_branch will delete the selected branch from the remote.
pub fn (self Remote) delete_branch(name string) ? {
	self.repo.exec('push $self.name --delete $name') ?
}

// ---------------------------------------------------------

// new_remote append a remote to this repository.
pub fn (self Repository) new_remote(name string, url string) ?Remote {
	self.exec('remote add $name $url') ?
	return self.remote(name, url)
}

// list_remotes return a list of remotes in the repository.
[direct_array_access]
pub fn (self Repository) list_remotes() map[string]string {
	lines := self.get('remote -v').split_into_lines()
	mut res := map[string]string{}
	for line in lines {
		parts := str.words(line)
		if parts.len > 1 {
			res[parts[0]] = parts[1]
		}
	}
	return res
}

// get_remote return the remote with the specified name.
pub fn (self Repository) get_remote(name string) ?Remote {
	url := self.list_remotes()[name] or { '' }
	if url.len < 1 {
		ups.unknown('remote', name) ?
	}
	return self.remote(name, url)
}

// get_remotes return a list of remotes in the repository.
pub fn (self Repository) get_remotes() []Remote {
	mut res := []Remote{}
	for name, url in self.list_remotes() {
		res << self.remote(name, url)
	}
	return res
}

fn (repo Repository) remote(name string, url string) Remote {
	return Remote{&repo, true, name, url}
}
