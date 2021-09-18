module repo

import uwu.ups
import uwu
import os

struct Repository {
	root string
}

// here use the repository in the current working directory.
pub fn here() ?Repository {
	return load(os.getwd())
}

// load use the repository in the provided directory.
pub fn load(base string) ?Repository {
	if os.exists(os.join_path(base, '.git')) {
		root := os.real_path(base)
		return Repository{root}
	}
	ups.invalid('git repository', base) ?
	return none
}

// init initialize a new git repository in the current directory.
pub fn init() ?Repository {
	return init_at(os.getwd())
}

// init_at initialize a new git repository in the specified directory.
pub fn init_at(dir string) ?Repository {
	if os.exists(os.join_path(dir, '.git')) {
		return here()
	}
	root := os.real_path(dir)
	repo := Repository{root}
	repo.exec('init') ?
	return repo
}

// exec execute a git command.
pub fn (self Repository) exec(cmd string) ?string {
	return uwu.exec('git -C "$self.root" $cmd') or { return error_with_code(err.msg, err.code) }
}

// get_author return the name of the repository author.
pub fn (self Repository) get_author() ?string {
	mut res := self.exec('config --get real.name') ?
	if res == '' {
		res = self.exec('config --get user.name') ?
	}
	if res == '' {
		return none
	}
	return res
}

// status return the repository status.
pub fn (self Repository) status() ?string {
	return self.exec('status')
}
