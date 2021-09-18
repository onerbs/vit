module getter

import vit
// import uwu.paths
// import os

// clone will clone the specified repository.
pub fn (self Getter) clone(url string) bool {
	flags := self.branch_flag()
	return vit.exec('clone $flags $url $self.target')
}

// bare_clone will clone the specified repository with depth=1.
pub fn (self Getter) bare_clone(url string) bool {
	flags := self.branch_flag()
	return vit.exec('clone --depth=1 --single-branch $flags $url $self.target')
}

// // download will clone the repository and erase the `.git` directory.
// pub fn (self Getter) download(url string) bool {
// 	if !self.fast_clone(url) {
// 		return false
// 	}
// 	mut target := self.target
// 	if target.len == 0 {
// 		target = os.base(url.trim_suffix('.git'))
// 	}
// 	dir := path.from_here(target, '.git')
// 	os.rmdir_all(dir) or {
// 		$if debug {
// 			eprintln(err.msg)
// 		}
// 		return false
// 	}
// 	return true
// }

fn (self Getter) branch_flag() string {
	if self.branch.len > 0 {
		return '--branch=$self.branch'
	}
	return ''
}
