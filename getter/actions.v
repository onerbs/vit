module getter

import uwu.paths
import vit
import os

// clone will clone the specified repository.
pub fn (self Getter) clone(url string) ? {
	flags := self.branch_flag()
	vit.exec('clone $flags $url $self.target') ?
}

// bare_clone will clone the specified repository with depth=1.
pub fn (self Getter) bare_clone(url string) ? {
	flags := self.branch_flag()
	vit.exec('clone --depth=1 --single-branch $flags $url $self.target') ?
}

// download will clone the repository and erase the `.git` directory.
pub fn (self Getter) download(url string) ? {
	self.bare_clone(url) ?
	mut target := self.target
	if target.len < 1 {
		target = paths.simple(url)
	}
	dir := paths.from_here(target, '.git')
	os.rmdir_all(dir) ?
}

fn (self Getter) branch_flag() string {
	if self.branch.len > 0 {
		return '--branch=$self.branch'
	}
	return ''
}
