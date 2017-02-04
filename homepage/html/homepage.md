# ![](images/fordintysa.png) <span>Build Server</span>

This is your private build server running in Docker containers.

The goal of this workshop is to give you some hands-on experience with the apps listed in the menu bar on the bottom.

----

<small> **Page navigation** :

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
offer more functionality like an integrated bug / issue ticket system, a wiki, online editing, etc.

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
  - On the **Overview** screen you can see some *commits*<br/>
    <small>_Scroll down to see *tags* and *branches*._</small>


## ![gitblit-logo](images/gitblit.png) <span>GitBlit &mdash; Question Time</span>

  1. Can you locate the `readme.md` file?
  2. At what interval is an update published in the past year?
  3. Who or what is responsible for increasing the version number?
  4. There's currently three (or four) active branches.<br/>
     Was that always the case?
  
<small>Press **S** to see the answers.</small>

Note: Answers:<br/>1. Menu option **Tree** or **Docs**.<br/>2. On average once a month.<br/>3. The `maven-release-plugin`.<br/>4. No, there were countless branches for issues & features. After the _merge_ of a branch back into the `master` it's obsolete and deleted. It's just a bookmark...


## ![gitblit-logo](images/gitblit.png) <span>GitBlit &mdash; Register & Login</span>

You haven't seen the most important repository because it needs authentication:

  - Login with user&ensp;`root`&ensp;& password&ensp;`sysadmin`
  - Open the&ensp;![](images/gb_menudropdown.png)&ensp;menu at the top right and select **Users** (_Gebruikers_)
  - At the top right there's a link to create a new user so fill in that form.
  - Do select 'admin' (_mag beheren_) <small>(other options at your own risk)</small> and save.
  - Log out and try to log in again using your own account

Now you can access our repository **OrdinaJTech/fordintysa-ci**


## ![gitblit-logo](images/gitblit.png) <span>GitBlit &mdash; Clone the Repository</span>

We'll be making some small changes to the code in our repository, so you need to make a clone to your own computer.

  - On the overview screen of our repository&ensp;`OrdinaJTech/fordintysa-ci`&ensp;you'll find the attribute **repositorie url**.<br/>
    <small/>The quickest way to copy the url is to click on the ![](images/gb_copyurl.png) icon between the words `.git` and `RW+`.</small>
  - Use your favorite tool to make a clone of the repository.
  - Test whether the code compiles and all unit tests pass by executing&ensp;`mvn clean test`


## ![gitblit-logo](images/gitblit.png) <span>Push a commit to GitBlit</span>

  - Change something in the `readme.md` file in your local repository.
  - **Commit** the change.
  - **Push** the commit to the `origin`.
  - Check in **GitBlit** your commit has arrived.
  
You should now have a working Git infrastructure with a local and remote repository.



## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Introduction</span>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Register & Login</span>

  - Click in the menu bar on __Jenkins__.<br/>
  - Login with user&ensp;`user`&ensp;& password&ensp;`password`<br/>
    _Jenkins will show a screen **Customize Jenkins** that allows you to add extra plugins. Not nescessary, since all the plugins you need are already installed._
  - Click on the `x` at the top right.<br/>
    _Jenkins reports it's **ready**._
  - Click the button **Start using Jenkins**


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Create the build item</span>

  - Click on the link **Create new Item** (_Cre&euml;er nieuwe taken_)
  - Enter an appropriate item name (eg&ensp;`fordintysa`)
  - Select the box **Maven Build** (_Bouw een Maven item_)
  - Click **OK**

The item is now created, and we can configure it further.

<small>In the first tab **General** you can give the item a description, specify it needs parameters, deactivate it, etc.<br/>
We don't need these features, so leave them as is.<br/><br/>
On the next pages we'll cover the most important parts you can configure in a Jenkins build item.</small>


## ![jenkins-logo](images/jenkins.png) <span>Configure Build Item &mdash; SCM (1)</span>

Jenkins needs to clone our repository hosted by GitBlit, and it needs the URL.

  - Select **Git** as the SCM source.
  - Switch your browser window to **GitBlit** and select the `fordintysa-ci` repository.
  - Put it's URL in your copy-paste buffer, as explained [previously](#/1/5)
  - Switch back to **Jenkins** and paste the URL.

You'll see an error message, because part of the URL is your GitBlit userid and the password is not given. You're not going to let anyone else use that, not even Jenkins!


## ![jenkins-logo](images/jenkins.png) <span>Configure Build Item &mdash; SCM (2)</span>

GitBlit is already set up with an account for Jenkins, so we'll use that.

  - Remove the part of the URL containing your userid.<br/>
  - Click on the **Add** button next to **Credentials** and select **Jenkins** popping out.</br>
    _A window shows up where you can enter the credentials:_
      - Username:&ensp;`jenkins`
	  - Password:&ensp;`jenkins`
  - Select `jenkins` in the Credentials dropdown box.
  
Now the error message should be gone.

There are plenty other options in the SCM panel, but we'll see some of that later.


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
