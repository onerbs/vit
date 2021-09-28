# vit

Another Git wrapper


## Installation

> This module depends on [`uwu`](https://github.com/onerbs/uwu)


Clone this repository in your V modules folder:

	git clone https://github.com/onerbs/vit ~/.vmodules/vit


## Usage

Initialize a new repository, commit and push.

``` v
import vit.repo
import vit.uri

fn main() {
	mut repo := repo.init() ?           // `git init`

	repo.stage('LICENSE') ?             // `git add LICENSE`
	repo.commit('Add LICENSE') ?        // `git commit -m "Add LICENSE"`

	host := uri.github('sample')        // See the available hosts on `uri/hosts.v`
	url := host.ssh()                   // "git@github.com:user/sample.git"

	                                    // `git remote add origin git@github.com:user/sample.git`
	origin := repo.add_remote('origin', url) ?

	origin.push_upstream() ?            // `git push -u origin main`
}
```
