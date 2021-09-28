module repo

import vit
import uwu.ups
import os

[heap]
struct Repository {
	root string
}

// load manage the repository in the current directory.
pub fn load() ?Repository {
	return load_at(os.getwd())
}

// load_at manage the repository in the provided directory.
pub fn load_at(base string) ?Repository {
	repo := repo_at(base)
	if repo.root.len < 1 {
		ups.invalid('git repository', base) ?
	}
	return repo
}

// init initialize a new git repository in the current directory.
pub fn init() ?Repository {
	return init_at(os.getwd())
}

// init_at initialize a new git repository in the provided directory.
pub fn init_at(base string) ?Repository {
	if os.exists(base) {
		repo := repo_at(base)
		if repo.root.len > 0 {
			return repo
		}
	} else {
		os.mkdir_all(base) ?
	}
	root := os.real_path(base)
	repo := Repository{root}
	repo.exec('init') ?
	return repo
}

fn repo_at(base string) Repository {
	mut root := ''
	if os.exists(os.join_path(base, '.git')) {
		root = os.real_path(base)
	}
	return Repository{root}
}

// exec execute a git command or throw an error.
pub fn (self Repository) exec(cmd string) ? {
	return vit.exec('-C "$self.root" $cmd')
}

// get execute a git command and return the output.
pub fn (self Repository) get(cmd string) string {
	return vit.get('-C "$self.root" $cmd')
}
