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

// gitea create a new URL maker with the Gitea host.
pub fn gitea(repo string) Host {
	return new_host(name: 'gitea.io', repo: repo)
}

// gogs create a new URL maker with the Gogs host.
pub fn gogs(repo string) Host {
	return new_host(name: 'gogs.io', repo: repo)
}

// gitlab create a new URL maker with the GitLab host.
pub fn gitlab(repo string) Host {
	return new_host(name: 'gitlab.com', repo: repo)
}

// pagure create a new URL maker with the Pagure host.
pub fn pagure(repo string) Host {
	return new_host(name: 'pagure.io', repo: repo)
}

// radicle create a new URL maker with the Radicle host.
pub fn radicle(repo string) Host {
	return new_host(name: 'radicle.xyz', repo: repo)
}

// savannah_gnu create a new URL maker with the SavannahGnu host.
pub fn savannah_gnu(repo string) Host {
	return new_host(name: 'savannah.gnu.org', repo: repo)
}

// sourcehut create a new URL maker with the SourceHut host.
pub fn sourcehut(repo string) Host {
	return new_host(name: 'git.sr.ht', repo: repo)
}
