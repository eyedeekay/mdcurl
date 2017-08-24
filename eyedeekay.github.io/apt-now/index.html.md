<div id="header">

apt-now
-------

A tool for setting up and hosting an apt repository using arbitrary
http/s hosts to make files accessible with extra features for
git-enabled hosting sites.

usage
-----

For usage help, [go here](usage.html).

</div>

<div id="content">

Details
-------

This tool, currently called apt-now but soon to be changed to repo-now,
is essentially a static site generator geared toward generating and
formatting a specific type of content in a specific type of way, the
content being GNU/Linux, Busybox/Linux(think openWRT) or
Android/Linux(This one's maybe a teeny bit delayed. I figured out how to
get Debian on my tablet, and I've been rocking that for a while.)
packages, and the format being a signed repository accessible from the
web or something like it(It can also, for instance, be used to
statically host software repositories over i2p with no substantial
modification.) It does this by taking advantage of the structural
regularity of these types of resources and constructs the whole site on
the client side, transmitting content to the server only after a valid
repository has been built. This means that the server doesn't have to
run any code at all to present the site to the end-user taking advantage
of the resource over the web, doesn't need to support ssh or remote
desktop, and doesn't even technically need to support ftp or git, as
long as a way of transferring the repository to the remote storage
service can be included in the program.

Use Cases
---------

-   Personal Use: Independent, hobbyist, and self-employed developers
    can use this program to host their own packages in a way which
    allows them to use their package management interface, encourages
    them to learn more about their choices of software and GNU/Linux
    distributions, and which provides an easy way for them to back up
    their configuration.
-   Educational Use: Educational and corporate training programs which
    work with Open-Source projects can use this program to host code
    repositories for employees during training, and in turn their
    trainers and supervisors can follow versioned updates and use them
    to build redistributable packages of viable projects.
-   Activist Use: Activists who deliver things like privacy and security
    related packages that might find their main repositories censored in
    some regions can use this tool to maintain mirrors on sites which
    will prove much more difficult to keep people from accessing, like
    "burner" accounts on free file hosting sites, distributed file
    systems, and fire-and-forget hidden services.
-   Small Groups: Small groups of hobbyists and hackers can collaborate
    on projects and take advantage of the instant clonability of github
    repositories to create instant mirrors of their group's packages,
    sharing, testing, and growing their projects potential userbase and
    lowering barriers to entry for their ideas.
-   Small Businesses: Small businesses can save costs on hosting their
    in-house process software and encourage a culture of peer review by
    hosting both their source repositories and tiny package repositories
    on github, bitbucket, or similar versioned web hosting services.
-   Large Businesses: Larger businesses which allow their employees to
    use "20% time" or similar programs to develop projects can use this
    in conjunction with tools like dh\_make or fpm to roll out an
    instant package repository when a program is ready for testing with
    a wider audience.

If you're one of these people and you have a bitcoin or two lying
around, you could send them my way and support development.

-   **1FMSVpcKGuRhTjCcWegCgET9x3er28BzkA**

Versioning and Features
-----------------------

Right now, binary repository generation for Debian(APT Repositories) is
stable and source repository generation for Debian/Apt are also pretty
much stable. While these are the only working types of repositories, the
pre-hyphenate part of this project's name will be "apt." Additionally,
while an end user could use any means to transfer the repository
constructed by the apt-now tool, there is currently only support for the
use of github-pages as a hosting medium in the code. While this remains
the case the post-hyphenate part of this project's name will be "git."
When experimental support for F-Droid and Redhat(Yellowdog Updater) are
complete, additional ways of transferring the files will be considered
and added, and the final version will implement APT, YUM, and F-Droid
repositories in an easy to configure, polyglot(But probably not
agnostic) way.

You should be aware that if you use this, your .git directory will be
visible to all users of the repository, allowing them to completely copy
the repository and it's entire history. It assumes that is what you
want. If you don't, you must remove the .git directory manually. In the
future, a command-line option will be provided.

### Repository Types

-   Debian/APT
    -   Binary Repository(Complete, Stable, Generates Web Pages from
        package info.)
    -   Source Repository(Pretty much complete and stable. Generates Web
        Pages from package info.)
    -   Notes: Depends on normal debian tools, including reprepro
-   Android/F-Droid
    -   Binary Repository(Experimental, Unstable, broken,
        see fdroid-git. The documentation for fdroidserver sometimes
        implies that the system requires some small amount of
        server-side code.)
    -   Source Repository(Research phases)
    -   Notes: Android implies somewhat different separation of logic
        from GNU/Linux
-   Redhat/YUM
    -   Binary Repository(Experimental, Still researching, but from the
        looks of things it's really straightforward. I do not know how
        to build RPM packages though, so we'll be working with
        Fedora's rpm's.)
    -   Source Repository(Experimental, Still researching, but the YUM
        paradigm seems to be astoundingly simple.)
    -   Notes: None yet. But I'm sure there's something.

### Transport Types

-   Version-Controlled
    -   git(Complete as a way up updating the server, but can't be used
        to retrieve inpidual software packages or update software.
        Cloning is pretty much like making an instant mirror, which
        is cool.) Will be considered complete when a repository can be
        initialized and cloned from in the apt-now directory in the
        absence of a configured web-based git account.
    -   hg(Not started, but straightforward. Pretty much the same as the
        git code with very little alteration, just some transliterating
        of commands with identical benefits.) Will be considered
        complete when fulfilling the same requirements as git.
    -   svn(Not started, but basically the same story for the purposes
        of this system.) See above.
-   File Transfer Based
    -   FTP(Not started, but really pretty easy, involves composing some
        commands and configuring some usernames/passwords/keys/etc.)
    -   SFTP(Not started, but basically maps onto ftp. Probably like,
        one additional line of code and a teeny bit of planning
        to support.)
-   More Exotic, Sync, Filesharing oriented
    -   bittorrent(Not started, probably will work with
        [apt-p2p](http://www.camrdale.org/apt-p2p/) or
        [debtorrent](http://debtorrent.alioth.debian.org/) with minimal
        to no modification. Might have to generate some magnet links.
        Probably going to conflict with Tor, but may be able to
        encourage use within i2p?)
-   Self-Hosted
    -   Self Hosting with local static httpd written in go. Stupid easy
        to turn on, just build the web site with the -l / --serve
        command line option or the START\_HTTPD option in the config
        file/environment variable.
    -   i2p eepsites are now also supported, and in fact this exact
        repository is mirrored at
        [fireaxe.i2p/apt-now](http://fireaxe.i2p/apt-now), or
        [ov3ev5dplhdz6ipy442ftb4kzz4dembm3ifs2jo25qhiyw6f4ogq.b32.i2p/apt-now](http://ov3ev5dplhdz6ipy442ftb4kzz4dembm3ifs2jo25qhiyw6f4ogq.b32.i2p/apt-no%0Aw)
        if you need the b32 address.
    -   Tor HS are now also supported and automatic, and they are also
        available as a mirror at
        [hmuc3ffhrehwuenz.onion/apt-now](http://hmuc3ffhrehwuenz.onion/apt-now)
        to prove the concept. If you're only interested in making
        packages available to Tor users and not your own anonymity, you
        can omit LOCAL\_ONLY\_HTTPD.

### Misc Features

-   Output a site. Collect information from within the packages, list
    them in well-formatted markdown files, and emit the markdown into
    html files which link to eachother, also a sitemap. This is all
    really easy to do on the client side.

Screenshot
----------

<div class="figure">

![apt-now hosted 4 ways](aptnow-4.png "Packageception")
apt-now hosted 4 ways

</div>

On Deck
-------

-   Wow it's been a minute since I updated this. Most of that stuff's
    actually done now, let me see... Well I'm going to start generating
    pages for more kinds of information from the packages. Specifically,
    I'm going to do the changelogs(first) and the patches(second,
    but cooler). Then I'm going to get real wierd with it.

</div>

<div id="sidebar">

Related Projects
----------------

-   [Reprepro, obviously](http://mirrorer.alioth.debian.org/) for APT
    repo management
-   [Createrepo, also obviously](http://createrepo.baseurl.org/) for YUM
    repo management
-   [Fdroidserver, also also
    obvious](https://gitlab.com/fdroid/fdroidserver)
-   [Effing Package Management](https://github.com/jordansissel/fpm)
    Some packages depend on this, but it isn't in may repo's besides the
    ruby gems somewhat ironically.
-   dh\_make, live-build, lots of others, I mean it's a package
    management component, so it's loosely related to almost everything
    if it has to be.

Links
-----

-   [CreateRepo
    Tutorial](https://www.godaddy.com/help/how-to-set-up-a-yum-repository-on-centos-6-12%0A297)

apt-now personal repository tool
================================

This tool helps developers host their own applications by posting them
to github pages for download.

        -d \ --directory
                Work in this directory, uses current directory by default
        -o \ --origin
                URL of the repository
        -c \ --codename
                Codename you want to use, defaults is \"testing\"
        -a \ --arch
                Architecture you want to host, defaults to \"all\"
        -p \ --policy
                Policy of packages you want to host, defaults to \"main\"
        -k \ --key
                ID of the package signing key
        -s \ --sources
                Folder with the packages to include in the repo
        -q \ --override
                Name of the override file
        -m \ --message
                Message to include in the commit
        -n \ --name
                Human-readable name of the Repository
        -v \ --desc
                Detailed repository description
        -c \ --check
                Make sure the dependencies are installed
        -r \ --reset
                Re-generate all components of the repository
        -u \ --user \ --org \ --organization
                Us as user/organization page, post page to master branch
        -l \ --serve
                Serve with a local, static httpd on port 45291(debia).
        -f \ --hide
                Make local httpd only accessible by localhost.
        -t \ --tor
                Serve local httpd with Tor Hidden Service.
        -i \ --i2p
                Point i2p eepSite at apt-now directory.
        -x \ --skindex
                    Skip creating index page.
        -h \ --help
                Display this help message

to add this repository to your Debian-based system:

        echo "deb https://eyedeekay.github.io/apt-now/deb-pkg rolling main" | \
            sudo tee /etc/apt/sources.list.d/eyedeekay.github.io.list
        wget -qO - https://eyedeekay.github.io/apt-now/eyedeekay.github.io.gpg.key | \
            sudo apt-key add -

In this respository, you'll find

### Binary Packages:

-   [the latest apt-now](info/apt-now_0.9-1_all.deb.html)
-   [the static httpd](info/go-uhttpd_1.0-1_all.deb.html)
-   [the pkpage helper](info/pkpage_1.0-1_all.deb.html)
-   [the scpage helper](info/scpage_1.0-1_all.deb.html)
-   [the hdpage helper](info/hdpage_1.0-1_all.deb.html)
-   [the static-page-scripts
    metapackage](info/static-page-scripts_1.0_all.deb.html)

### Source Packages:

-   [the latest apt-now](info/apt-now_0.9-1.dsc.html)
-   [the static httpd](info/go-uhttpd_1.0-1.dsc.html)
-   [the pkpage helper](info/pkpage_1.0-1.dsc.html)
-   [the scpage helper](info/scpage_1.0-1.dsc.html)
-   [the hdpage helper](info/hdpage_1.0-1.dsc.html)
-   [the static-page-scripts
    metapackage](info/static-page-scripts_1.0.dsc.html)

</div>
