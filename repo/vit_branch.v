module repo

import uwu.ups
import uwu.str

struct Branch {
	repo &Repository [required]
pub:
	name string [required]
}

// delete will delete this branch.
pub fn (self Branch) delete() ? {
	self.repo.exec('branch -d $self.name') ?
}

// force_delete will delete this branch even if it's not fully merged.
pub fn (self Branch) force_delete() ? {
	self.repo.exec('branch -D $self.name') ?
}

// rename will rename this branch.
pub fn (self Branch) rename(new_name string) ? {
	self.repo.exec('branch -m $self.name $new_name') ?
}

// force_rename will rename this branch even if the target already exists.
pub fn (self Branch) force_rename(new_name string) ? {
	self.repo.exec('branch -M $self.name $new_name') ?
}

// copy will create a copy of this branch with the specified name.
pub fn (self Branch) copy(target string) ? {
	self.repo.exec('branch -c $self.name $target') ?
}

// force_copy will create a copy of this branch with the specified name,
// even if the target already exists.
pub fn (self Branch) force_copy(target string) ? {
	self.repo.exec('branch -C $self.name $target') ?
}

// set_upstream_to define the upstream branch for this branch.
pub fn (self Branch) set_upstream_to(branch string) ? {
	self.repo.exec('branch -u $self.name $branch') ?
}

// ---------------------------------------------------------

// set_upstream define the upstream branch for the active branch.
pub fn (self Repository) set_upstream(branch string) ? {
	self.exec('branch -u $branch') ?
}

// unset_upstream unset the upstream branch of the active branch.
pub fn (self Repository) unset_upstream() string {
	return self.get('branch --unset-upstream')
}

// checkout switch the active branch to the specified one.
pub fn (self Repository) checkout(branch string) ?Branch {
	self.exec('checkout $branch') ?
	return self.branch(branch)
}

// new_branch create a new branch and switch to it.
pub fn (self Repository) new_branch(branch string) ?Branch {
	self.exec('checkout -b $branch') ?
	return self.branch(branch)
}

// new_orphan create a new orphan branch and switch to it.
pub fn (self Repository) new_orphan(name string) ?Branch {
	self.exec('checkout --orphan $name') ?
	return self.branch(name)
}

// create_branch create a new branch.
pub fn (self Repository) create_branch(name string) ?Branch {
	self.exec('branch $name') ?
	return self.branch(name)
}

// list_branches list the local branches in the repository.
[direct_array_access]
pub fn (self Repository) list_branches() []string {
	mut res := str.words(self.get('branch -la')).filter(it != '*')
	for ix in 0 .. res.len {
		it := res[ix]
		if it.starts_with('remotes') {
			res[ix] = it.all_after('/')
		}
	}
	return res
}

// get_branch manage the selected branch.
pub fn (self Repository) get_branch(name string) ?Branch {
	if name !in self.list_branches() {
		ups.invalid('branch name', name) ?
	}
	return self.branch(name)
}

// get_branches return the local branches in the repository.
pub fn (self Repository) get_branches() []Branch {
	return self.list_branches().map(self.branch(it))
}

// get_current_branch manage the current branch.
pub fn (self Repository) get_current_branch() Branch {
	// Q: can `name` be empty?
	name := self.get('branch --show-current')
	return self.branch(name)
}

fn (self Repository) branch(name string) Branch {
	return Branch{&self, name}
}
