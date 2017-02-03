# ![](images/fordintysa.png) <span>Build Server</span>

This is your private build server running in Docker containers.

The goal of this workshop is to give you some hands-on experience with the apps listed in the menu bar on the bottom.

----

<small>Page navigation:

  - Just press **Space** for the next slide
  - **Down** goes to the next page within a chapter
  - **Right** skips to the next chapter
  - For more keyboard shortcuts: press **?**
</small>



## ![gitblit-logo](images/gitblit.png) <span>GitBlit &mdash; Introduction (1)</span>

The first requirement for practicing [Continuous Integration](https://en.wikipedia.org/wiki/Continuous_integration) is using a version control system for the project's source code, aka **SCM**, which stands for _Source Code/Control Management_.

By far the most popular SCM is [Git](https://git-scm.com/). You probably have a [git client](https://git-scm.com/downloads) installed on your PC, often integrated with your IDE. If not, now is a good time!

Having a local repository is already a step forwards, but if you're working in a team on the same code base, it makes sense to host it on a server.


## ![gitblit-logo](images/gitblit.png) <span>GitBlit &mdash; Introduction (2)</span>

[GitBlit](http://gitblit.com/) is a basic repository management tool for hosting git repositories on your own server. 
It does not try to be a full collaborative development environment.
For example [GitHub](https://github.com/), [GitLab](https://about.gitlab.com/), [Phabricator](https://www.phacility.com/), [SCM Manager](https://www.scm-manager.org/), and [Tuleap](https://www.tuleap.org/)
offer more functionality like a wiki, integrated bug / issue ticket system, etc.

Like [GitBucket](https://gitbucket.github.io/gitbucket-news/about/), GitBlit just hosts repositories. So for this workshop GitBlit is just fine.
<small>(NB: we planned to use GitLab, but that starts up too slow and preloading it with repositories was a headache)</small>

So let's give it a spin!


## ![gitblit-logo](images/gitblit.png) <span>GitBlit &mdash; Repository Browsing</span>

  - Click in the menu bar on __GitBlit__.<br/>
	<small>_The first screen you see is the Dashboard, which is not that interesting._</small>
  - In the top menu pick the second option: **Repositories**.<br/>
    <small>_We have pre-loaded a couple repositories from GitHub into GitBlit._</small>
  - Take a look at repository `jqno/equalsverifier`.<br/>
    <small>_This is a quite mature project which uses tags & feature branches._</small>
  - On the **Overview** screen you can see some *commits*, *tags* and *branches*.
  - Also try the menu with *commits*, *tree* <small>(view the source code)</small> and *docs*.

<small>Don't spend too much time here, there's lots more to do. For instance, you cannot yet reach the most important repository because it needs your authentication. We'll do that next!</small>


## ![gitblit-logo](images/gitblit.png) <span>GitBlit &mdash; Register & Login</span>

  - You can login with user&ensp;`user`&ensp;& password&ensp;`password`<br/><br/>
    ### ... or create your own account:
  - Login with user&ensp;`root`&ensp;& password&ensp;`sysadmin`
  - Open the ![](images/gb_menudropdown.png) menu at the top right and select **Users** (_Gebruikers_)
  - At the top right there's a link to create a new user so fill in that form.
  - Do select 'admin' (_mag beheren_) <small>(other options at your own risk)</small> and save.
  - Log out and try to log in again using your own account

Now you can access our repository **OrdinaJTech/fordintysa-ci**


## ![gitblit-logo](images/gitblit.png) <span>GitBlit &mdash; Clone the Repository</span>

We'll be making some small changes to the code in our repository, so you need to make a clone to your own computer.

  - On the overview screen of our repository `OrdinaJTech/fordintysa-ci` you'll find the attribute **repositorie url**.
  - The quickest way to copy the url is to click on the ![](images/gb_copyurl.png) icon between the words `.git` and `RW+`.
  - Use your favorite tool to make a clone of the repository.
  - Import this _Maven_ Project into your favorite Java IDE (NetBeans, Eclipse...)



## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Introduction</span>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Build the Project</span>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.



## ![artifactory-logo](images/artifactory.png) <span>Artifactory &mdash; Introduction</span>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


## ![artifactory-logo](images/artifactory.png) <span>Artifactory &mdash; Browsing the Repository</span>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


## ![artifactory-logo](images/artifactory.png) <span>Artifactory &mdash; let Jenkins deploy the Artifact</span>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.



## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; let a Git Push trigger the build</span>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


## ![git-logo](images/git.png) <span> &mdash; Merge a Branch</span>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.



## ![sonarqube-logo](images/sonar.png) <span>SonarQube &mdash; Introduction</span>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


## ![sonarqube-logo](images/sonar.png) <span>SonarQube &mdash; Fix some Code Quality issues</span>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tem



## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; deploy The App</span>

### ... and ...
# WIN !!!