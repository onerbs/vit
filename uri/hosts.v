module uri

// bitbucket create a new URL maker with the BitBucket host.
pub fn bitbucket(repo string) Host {
	return new_host(name: 'bitbucket.org', repo: repo)
}

// codeberg create a new URL maker with the CodeBerg host.
pub fn codeberg(repo string) Host {
	return new_host(name: 'codeberg.org', repo: repo)
}

// github create a new URL maker with the GitHub host.
pub fn github(repo string) Host {
	return new_host(name: 'github.com', repo: repo)
}

// gitlab create a new URL maker with the GitLab host.
pub fn gitlab(repo string) Host {
	return new_host(name: 'gitlab.com', repo: repo)
}

// sourcehut create a new URL maker with the SourceHut host.
pub fn sourcehut(repo string) Host {
	return new_host(name: 'git.sr.ht', repo: repo)
}
