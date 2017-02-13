# ![](images/fordintysa.png) <span>Build Server</span>

This is your private build server running in Docker containers.

The goal of this workshop is to give you some hands-on experience with the apps listed in the menu bar on the bottom.

----

<small> **Page navigation** :<ul>
  <li>Just press **Space** for the next slide</li>
  <li>**Down** goes to the next page within a chapter</li>
  <li>**Right** skips to the next chapter</li>
  <li>For more keyboard shortcuts: press **?**</li>
  <li>Text contains clickable [hyperlinks](#/1)</li>
</ul></small>



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


## ![slow](images/slow.png) <span>Slow or Fast track?</span> ![fast](images/fast.png)

We have limited time for this workshop, so you get the choice:

  - Follow the **Slow** track:<br/>
    <small>This will be the best learning experience, but you probably won't finish it in time.<br/>
	You can complete it any other time at your own pace.</small>
  - Follow the **Fast** track:<br/>
    <small>This gives you the best chance of getting through the whole workshop and see the app deployed.<br/>
    But you will miss some detailed information, so you won't get out all there is to learn.</small>

<small>Whenever there's a track split or pages to skip, you'll see these icons at the bottom of the page.<br/>
Just click on the one you want to follow.<br/>
<small>Note that at each decision point you can choose a different option.</small></small>

### [![slow](images/slow.png)](#/1/3) &#8656; do \ Explore GitBlit & create account / skip &#8658; [![fast](images/fast.png)](#/1/6)


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
     Is that all there ever was?
  
<small>Press **S** to check your answers.</small>

<small><small>Disable any popup blockers please to see the answers.</small></small>

Note: Answers:<br/>1. Menu option **Tree** or **Docs**.<br/>2. On average once a month.<br/>3. The `maven-release-plugin`.<br/>4. No, there were countless branches for issues & features. After the _merge_ of a branch back into the `master` it's obsolete and deleted. It's just a bookmark...


## ![gitblit-logo](images/gitblit.png) <span>GitBlit &mdash; Register & Login</span>

You haven't seen the most important repository because it needs authentication:

  - Login with user&ensp;`root`&ensp;& password&ensp;`sysadmin`
  - Open the&ensp;![](images/gb_menudropdown.png)&ensp;menu at the top right and select **Users** (_Gebruikers_)
  - At the top right there's a link to create a new user so fill in that form.
  - Do select 'admin' (_kan beheren_) <small>(other options at your own risk)</small> and save.
  - Log out and try to log in again using your own account

Now you can access our repository **OrdinaJTech/fordintysa-ci**

### Continue &#8658; [![slow](images/slow.png)](#/1/7)


## ![gitblit-logo](images/gitblit.png) <span>GitBlit &mdash; Login</span>

  - Click in the menu bar on __GitBlit__.<br/>
	<small>_The first screen you see is the Dashboard, which is not that interesting._</small>
  - Login with user&ensp;`user`&ensp;& password&ensp;`password`
  - In the top menu pick the second option: **Repositories**.</br>
    <small>_We have pre-loaded a couple repositories from GitHub into GitBlit._</small>
  - Select the repository &ensp;`OrdinaJTech/fordintysa-ci`&ensp;


## ![gitblit-logo](images/gitblit.png) <span>GitBlit &mdash; Clone the Repository</span>

We'll be making some small changes to some files in our repository, so you need to make a clone to your own computer.

  - On the overview screen of our repository&ensp;`OrdinaJTech/fordintysa-ci`&ensp;you'll find the attribute **repositorie url**.<br/>
    <small/>The quickest way to copy the url is to click on the ![](images/gb_copyurl.png) icon between the words `.git` and `RW+`.</small>
  - Use your favorite tool to make a clone of the repository.

<small>NB: this workshop is about Continuous Integration, not developing Java code. 
You may import this project in your IDE (Netbeans, Eclipse, IntelliJ)
or test whether the code compiles and all unit tests pass by executing&ensp;`mvn clean test`,
but you should be able to do without. Just using a plain text editor (and ofcourse a Git client) should get you through.</small>

### [![slow](images/slow.png)](#/1/8) &#8656; do \ test git push to GitBlit / skip &#8658; [![fast](images/fast.png)](#/2)


## ![git-logo](images/git.png) <span>Push a commit to GitBlit</span>

You should now have a working Git infrastructure with a local and remote repository.<br/>
Let's test whether you can push a change to your own GitBlit server. 

  - Navigate in your local repository to folder `src/main/resources/` 
  - Edit the file **`wishlist.txt`**
  - **Commit** the change.
  - **Push** the commit to the `origin`.
  - Check in **GitBlit** your commit has arrived.



## ![maven-logo](images/maven.png) <span>Maven &mdash; SNAPSHOT versions</span>

Here's a fragment of the project's `pom.xml` you have just cloned:
  
```xml
<project>
	<groupId>nl.fordintysa</groupId>
	<artifactId>fordintysa-webapp</artifactId>
	<version>1.0.0-SNAPSHOT</version>
	<packaging>war</packaging>
```

Notice that `version` ends with `-SNAPSHOT`.

<small>This means the project is not in a stable state, but contains _work in progress_.<br/>
Each executed build results in a **snapshot** of the project as it progresses.<br/>
As long as the work promised to be done is not finished, the version remains the same.</small>


## ![maven-logo](images/maven.png) <span>Maven &mdash; Increment SNAPSHOT version</span>

There will come a moment when the development team is happy with the state of all the changes they have implemented.
Then the `SNAPSHOT` phase is over and a **Release Candidate** is built for deployment and further testing:

  - The -SNAPSHOT suffix is removed from the version
  - The release candidate version will be built
  - The version number is increased and suffixed with -SNAPSHOT again



## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Introduction (1)</span>

Here are some important aspects of Continuous Integration:

  1. Using a SCM tool for source code version control <small>(_already covered_)</small>
  1. An **Automated Build** process
  1. Automated **Testing** of the built software

While your IDE can perform these processes, there's no _guarantee_ each developer has done these required steps before submitting their changes to the central repository.
That's why we need it to be _automated_ and it's the role of a **Build Server** to execute this central part in Continuous Integration.


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Introduction (2)</span>

There's a [lot of software](https://en.wikipedia.org/wiki/Comparison_of_continuous_integration_software) available for automated builds & tests.
Which one to chose depends on a couple of factors, like the ability to integrate with the rest of the environment. Think of:

  - Connecting with the Source Code Repository
  - Ability to compile the source code and perform automated tests
  - Reporting of Static Code Quality Analysis
  - Delivery of the compiled code for deployment

<small>The strength of Jenkins lies in the fact that it is merely an execution skeleton, while specific **plugins** do specialised tasks.
For instance, look at the rich ecosystem supported by Jenkins for connecting with a SCM here: 
[https://plugins.jenkins.io/](https://plugins.jenkins.io/), in the left menu at the bottom under **Source Control Management**.
Multiple plugins for simular tasks and enhancing Jenkins' behaviour can be installed, so it can be made very simple or very complex.
All of this is open source and completely free.<br/>
So let's try that out...<small>


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Register & Login</span>

Click in the menu bar on **Jenkins**.

<div id="left">
<h3>![slow](images/slow.png)</h3>
<ul>
<li>Use the bottom link: **signup as a new user**.</li>
<li>Fill in the form and click **sign up**. <br/>
    _You should be welcomed with **Success**._</li>
<li>Click on the link to go back to **the top page**.</li>
</div>
<div id="right">
<h3>![fast](images/fast.png)</h3>
<p>Login with:<p>
<ul>
<li>user:&emsp;&emsp;&emsp;`user`</li>
<li>password:&ensp;`password`</li>
</ul>
</div>
<div style="clear: both"></div>

----
###  ![fast](images/fast.png)&ensp;both continue with **space**&ensp;![slow](images/slow.png)



## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Create your first Build Item</span>

You're now at the main screen of Jenkins. 
Here you usually see the list of projects contained in Jenkins, 
with some details about their last build status.
Let's put something there:

  - Click on the link **Create new Item** (_Cre&euml;er nieuwe taken_)
  - Enter an appropriate item name (eg&ensp;`fordintysa`)
  - Select the box **Maven Build** (_Bouw een Maven item_) and click **OK**.

_The item is now created, and we can configure it further._


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Configure a Build Item</span>

On the next pages we'll cover the most important parts of a Jenkins build item.

The first tab **General** is for, ehm... _generic_ stuff, like:

<small>_We don't need these features yet, so leave them as is._</small>

  - The name of an item and a description
  - Specify to prompt for parameters (manual input)
  - Save disk space by deleting old data, and retain just the last few job logs
  - Deactivate it to prevent a build is accidentally started


## ![jenkins-logo](images/jenkins.png) <span>Configure Build Item &mdash; SCM (1)</span>

Jenkins needs to clone our repository hosted by GitBlit, and it needs the URL.

  - Select **Git** as the SCM source.
  - Switch your browser window to **GitBlit**
  - Select the `fordintysa-ci` repository.
  - Put it's URL in your copy-paste buffer, as explained [previously](#/1/7)
  - Switch back to **Jenkins** and paste the URL.

<small>You'll see an error message, because part of the URL is your GitBlit userid.<br/>
But the password is not given, and you're not going to let anyone else use that.<br/>
Not even someone as trustworthy as Jenkins!</small>


## ![jenkins-logo](images/jenkins.png) <span>Configure Build Item &mdash; SCM (2)</span>

We've already set up credentials for Jenkins to connect with GitBlit, so let's use that:

  - Remove the part of the URL containing your userid.
  - In the Credentials dropdown box, select the _Jenkins credentials for GitBlit_.

_Now the error message should be gone._

<small>There are a lot of other options in this section and others, too much to explain them all.
And most of them can/should be left at their default setting.
If you're really curious what it does, click on the question mark at the right to display a help text.</small>

### [![slow](images/slow.png)](#/4/4) &#8656; read \ explanation: Build Triggers / skip &#8658; [![fast](images/fast.png)](#/4/5)


## ![jenkins-logo](images/jenkins.png) <span>Configure Build Item &mdash; Build Triggers (_Bouwactiveerders_)</span>

Here you can define to let this item build on regular intervals, when another build has finished, or triggered by a commit, etcetera...

Since we're just starting with Jenkins, it's probably best to first trigger all builds manually.
You can do that anyway, but triggering builds automatically is not our first concern.
We first have to see whether it works at all before we can automate that.

<small>One of the build trigger items is checked by default: **Build whenever a SNAPSHOT dependency is built**.<br/><br/>
This needs some explanation. Usage of capital letters might give you the impression that *snapshot* is a deciding factor here. 
Well, no... That word should be in small caps between brackets. The emphasys should be on **dependency**.<br/>
**Build whenever a _Dependency_ is built**, regardless whether that dependency is a snapshot.<br/><br/>
Since our project has no dependencies that are also built by this Jenkins instance, this switch won't do anything.</small>


## ![jenkins-logo](images/jenkins.png) <span>Configure Build Item &mdash; Build Environment (_Bouwomgeving_)</span>

We keep all these options empty for now, except for the very last one.

  - Tick the last option: _Resolve artifacts from Artifactory_.
  - On the bottom right click the button **Refresh Repositories**<br>
    <small>_The repository for released versions is OK, but **snapshot** versions have a separate repo_</small>
  - Select **libs-snapshot** as the _Resolution snapshots repository_.

<small>Artifactory is installed on your virtual build server, but as long as the plugin for it is not activated on a build item you won't see it in action.
We'll discuss Artifactory in depth later on. For now it's sufficient to know that Artifactory serves as a private Maven repository, 
both for fetching artifacts not yet present in the local Maven repository, and for publishing the artifacts Jenkins has produced.</small>

### [![slow](images/slow.png)](#/4/6) &#8656; read \ explanation: Pre Steps / skip &#8658; [![fast](images/fast.png)](#/4/7)


## ![jenkins-logo](images/jenkins.png) <span>Configure Build Item &mdash; Pre Steps</span>

This speaks for itself: you can specify some extra work to be done before the actual build is done. 
Not needed here, but please look what kind of actions you can add.

_And do observe this: as you're scrolling down that quite large page, the tab selection in the top menu does change accordingly.
So you can navigate in the configuration page both ways: scroll up & down or select a tab at the top._


## ![jenkins-logo](images/jenkins.png) <span>Configure Build Item &mdash; Build (_Bouwpoging_)</span>

This is where it's realy happening. Here the Maven-specific aspects are configured.

The location of the `pom.xml` is OK <small>(root of the repository)</small>, but the Maven goals to execute not yet.

  - Fill in the **goals & options** for Maven you think are most appropriate.<br/>
    <small>Need a hint? Press **S**...</small>
  - Do click on **Advanced** (_Uitgebreid_) and watch all the extra options unfold.</br>
    <small>Just know it's here you can e.g. specify an extra `settings.xml` file for Maven.<br/>
	NB: I know of no way to let this part fold back up again.</small>

Note: Just&ensp;**`clean install`**&ensp;would do fine...


## ![jenkins-logo](images/jenkins.png) <span>Configure Build Item &mdash; Post Steps</span>

Better start really simple, and don't make it too complex.

Maybe later we'll add extra steps to execute when (or _if_) the build succeeds...

There's no harm in peeking at what type of extra steps you can execute though.


## ![jenkins-logo](images/jenkins.png) <span>Configure Build Item &mdash; Build Settings (_Bouwconfiguratie_)</span>

If you tick the box to let Jenkins email notifications, it will only send emails for _failed_ builds.
The majority of builds will succeed and don't need any attention. 
Emails will be sent by default to all developers that changed any code since the previous succeeded build.
Another email will be sent as soon as someone fixed the issue and the build is stable again,
so you don't need to look into issues someone else already fixed.

_That's good to know: Jenkins won't spam you, and will tell you also when the panic is over._

_This specific instance of Jenkins cannot even spam you, the email config should not work._


## ![jenkins-logo](images/jenkins.png) <span>Configure Build Item &mdash; Post Build Actions<br/>(_Acties na Bouwpoging_)</span>

Have a peek at what type of actions can be done in this section.

Compare that with the list of actions in the **Post Steps** section.

----

## Question Time

_What do you think is the difference between a **Post Step** and **Post Build Action** ?_

<small>Press **S** to check your answer.</small>

Note: This has to do with the definition of when the build is finished. Only build _steps_ may let the build fail. Afterwards only some finishing administrative actions are left to be done, but nothing that can influence the result.


## ![jenkins-logo](images/jenkins.png) <span>Configure Build Item &mdash; Review & Save</span>

We're finally at the bottom of this rather large form.<br/>
Let's recapitulate what was actually filled in:

  1. It's a **Maven project** and it has a **name** for identification purposes.
  1. The **Git repository** URL is given, with credentials to access it.
  1. **Artifactory** will resolve <small>(download)</small> any Maven artifacts <small>(i.e. Maven plugins & dependencies.)</small>
  1. The `pom.xml` at the default location is used for the Maven goals&ensp;`clean install`
  
Check? Then click **Save**!

<small>The configuration _can_ be made quite complex, but a simple build item can be configured in no time.</small>



## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; First Build &mdash; Start</span>

You're back now at the project page.

About halfway the menu at the left is the option **Build now** (_Start nu een bouwpoging_)

  - Start the build.<br/>
    _<small>The build job will go through the scheduling queue in no time.<br/>
	It will appear at the left under **Build History** (Overzicht Bouwpogingen)</small>_<br/><br/>
  - Once you see **#1** blinking, click there on the current **DateTime**.<br/>
    _<small>This is the details screen for the first build of our project.</small>_


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; First Build &mdash; Monitoring</span>
  - From the menu on the left, click on **Console Output**<br/>
    _<small>You should now see the console log output from Jenkins and Maven.</small>_

<small>Jenkins has cloned the Git repository into a workspace folder and started Maven to do the actual build.
Since Maven runs for the first time, it's local repository is still empty and it is mainly busy downloading the required plugins.
<br/><br/>
<small>Note that in the console all URLs are decorated as clickable links.
Since `http://artifactory:8081/` refers to a virtual host that's only accessible inside the Docker infrastructure, you cannot access the link.
But we'll show you Artifactory in a minute.</small></small>

Your maiden Jenkins build should end within a minute with &ensp;**`Finished: SUCCESS`**

<small>Jenkins has put Maven to work: our Java source code from Git is compiled, tested and packaged into a .war file.
The .war file (which is in essence an special .jar file) can then be deployed on a webserver for further testing, or for the 'live' application.</small>


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Build Finished: SUCCESS</span>

**This is the first _and last_ build guaranteed to finish with success.**

<small>It is easy to guarantee this, because the developer tested this himself by performing&ensp;`mvn clean install`&ensp;prior to committing any change to Git.
Now Jenkins has performed _exactly the same_ Maven process, so failure is not an option.</small>

----

NOTICE: in this workshop we have **on purpose** introduced some points where a build failure is expected.
So ** _don't panic_ ** when a build fails. Read the <span style="color: red">`[ERROR]`</span> messages in the console log very carefully.
We have all confidence you can figure out why it failed, and you should be able to correct it with some minor adjustments.
Just keep your brain switched on...


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Structure</span>

Now we went through all the screens you use most often. This is the main structure:

  - **Main Dashboard** aka **Job Index** containing all the items
     - **Item** or **Project** identified by a _Name_ with a configuration how to build it
	    - Actual **Builds** identified by a _Number_, which shows the build details
		   - The **Console Output** with detailed logging of that specific build

<small>After the first build started, we went from the Item through Build Details to the Console Output.
The next time you start a build (especially one that previously failed) remember you can skip the Build Details screen
and go directy to the Console Output by clicking on the blinking ball directly left of the Number.</small> 


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Second Build</span>

  - Start the build a second time to get a bit more familiar.

_Since the first one succeeded, and nothing has changed,<br/>it is guaranteed this one will succeed as well.<br/>
This one will finish much faster ofcourse._

<small><small>OK, so two slides back we lied... a tiny bit.</small></small>

That's one of the basic principles of Continuous Integration:

### Employ a Build, Test & QA process that is Repeatable through Automation.



## ![app-logo](images/Question.png) <span>The App &mdash; Run more Unit Tests</span>

Our build executed just three unit tests. We have prepared some more.

  - In your local (cloned) repository, navigate to
     - folder&emsp;&ensp;`src/test/java`
     - package&ensp;`nl.fordintysa`
  - Open file&ensp;`MainTest.java`&ensp;with a text editor (or your IDE)
  - Remove both slashes at the start of **line 14**<br/>
    <small>_The_ `@Test` _annotation is now uncommented, so in the next build the method_<br/>
	`testGetNameNoArgs()` _will be executed as well during the unit tests._</small>
  - **Save** the file, **commit** and **push** the change to GitBlit
  - Start the build again in Jenkins and watch it's console output.


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Failing Unit Tests</span>

Some of the lines you should notice in the console output:

```
testGetNameNoArgs(nl.fordintysa.MainTest)  Time elapsed: 0.014 sec  <<< FAILURE!
org.junit.ComparisonFailure: expected:<Fordintysa[]> but was:<Fordintysa[-CI]>
---
[ERROR] There are test failures.
---
[INFO] BUILD SUCCESS
---
Finished: UNSTABLE
```

<small>Just one unit tests failed. Which one could that be? ;-)<br/><br/>
Usually Maven then reports `BUILD FAILURE`, but Jenkins here reports `BUILD SUCCESS`.<br/>
At the end it's labelled `UNSTABLE`, which means an artifact _could_ be produced but its tests failed.</small>


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Unstable Build</span>

So it gets the benefits of the doubt. 
A failing test is not enough to let a build fail completely.
This is done so the following tasks like measuring the code quality can be done regardless.
Jenkins leaves it up to you what to do.
<br/><br/>

  - Fix the unit test and make the build stable again

<small><br/><br/></small>
### [![slow](images/slow.png)](#/6/3) &#8656; do \ activate another unit test / skip &#8658; [![fast](images/fast.png)](#/7)


## ![app-logo](images/Question.png) <span>The App &mdash; Run more Unit Tests (2)</span>

  - Still in `MainTest.java`, uncomment lines 26-30.
  - Let it build again by Jenkins<br/>
    <small>_Now there's a compilation error and the build is flagged as a FAILURE.<br/>
	If you think you can prevent it, by all means: try._<br/><br/></small>
  - Fix the unit test and make the build stable again



## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; let a Git Push trigger the build</span>

It's really easy to let a **push** into GitBlit automatically trigger a **build** in Jenkins.

  - Navigate in Jenkins to your **Project** page
  - Select **Configure** (_Configureren_) in the menu on the left
  - Select tab **Build Triggers** (_Bouwactiveerders_)
  - Tick item **Poll SCM** (_Bemonster SCM_)
  - Fill the field **Schedule** (_Planning_) with:
    ```
	H * * * *
	```
  - **Save** the changed configuration.


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; test Git Push triggers the build</span>

  - Navigate in your local repository to folder `src/main/resources/` 
  - Edit the file **`wishlist.txt`**
  - **Commit** and **Push** the change
  - Watch in Jenkins what happens...



## ![maven-logo](images/maven.png) <span>Maven Repositories &mdash; Recapitulation</span>

As you might have learned, Maven uses two repositories:

  - There's a **local** repository somewhere on the harddisk in which the artifacts you have built yourself are stored by the&ensp;`install`&ensp;goal.
    The local repository also serves as a cache for artifacts you did not build yourself, but which were fetched from:
  - A **remote** repository. This is used to download any Maven plugins and dependencies  
    which are not yet stored in your local repository.

<small>The most often used remote repository is [Maven Central](http://repo1.maven.org/maven2),
but there are some alternative hosts with simular content like 
[Atlassian](https://maven.atlassian.com/repository/public),
[Gradle](http://gradle.artifactoryonline.com/gradle/libs),
[JBoss](http://repository.jboss.org/nexus/content/groups/public-jboss/)
and the [JCenter bintray](http://jcenter.bintray.com/).
There are also hosts with a limited set of artifacts, like
[Spring](http://maven.springframework.org/release).
</small>

<small><small>Note that we're not discussing _source code_ repositories like Git, but [_binary_ repositories](https://en.wikipedia.org/wiki/Binary_repository_manager) 
that hold the built .jar artifacts. These are quite different beasts.</small></small>


## ![maven-logo](images/maven.png) <span>Maven Repositories &mdash; Issues</span>

The Maven goal&ensp;`deploy`&ensp;uploads the built artifacts to a remote repository, 
which is defined the [`distributionManagement`](https://maven.apache.org/pom.html#Distribution_Management) section of the pom.

<small>That remote repository for artifact deployment shall not be Maven Central. 
For that you need special privileges (which you don't have) because our good friends at Apache only allow trusted content in their Maven Central repository.<br/><br/>
So what to do then as an organization... Where should you store the artifacts you have built yourself?<br/><br/>
Also, there are open source libraries you might want to use for your project which are not published at Maven Central,
but only available at one of the alternative repositories we saw before.
How can you arrange easy access to more than one remote repository?<br/><br/>
And then buildservers: often all servers used within an organization are shielded from the evil outside world by a firewall
and surrounded with a [DMZ](https://en.wikipedia.org/wiki/DMZ_%28computing%29).
So public repositories like Maven Central are often not even accessible for the buildserver.</small>


## Introducing &mdash; the Repository Manager</span>

The [adviced solution](https://maven.apache.org/repository-management.html) to these issues is to use a **Repository Management** tool.

There are some alternatives for this, the most popular being 
[Nexus](https://www.sonatype.org/nexus/go/) by Sonatype
and [Artifactory](https://www.jfrog.com/open-source) by JFrog.
Both of them offer a free version that works well for casual usage, plus a commercial version that beyond the basics offers functionality you'd use in a big professional environment.

If you're interested in the differences between them, there's a very extensive feature comparison matrix drawn up on [this page](https://binary-repositories-comparison.github.io/).

But let's dive into Artifactory...



## ![artifactory-logo](images/artifactory.png) <span>Artifactory &mdash; Introduction</span>

Artifactory serves as a repository manager mainly for Maven artifacts, 
but the 'pro' version can do the same thing for several other package types like
Bower web packages, Docker images, Microsoft NuGet packages, NPM packages for Node.js, etcetera.

Within each Artifactory server there are multiple repositories hosted, so:

  - Locally produced artifacts are held separate from externally downloaded jars
  - Dependency jars are kept separate from Maven plugins
  - A _virtual_ repository can aggregate multiple _real_ ones to function as if they were one


## ![artifactory-logo](images/artifactory.png) <span>Artifactory &mdash; Browsing a Repository</span>

  - Click in the menu bar on **Artifactory**.<br/>
    <small>_You don't need to log in, everything here is public._</small>
  - In the left menu, select the ![](images/arti_repos.png) icon.<br/>
    <small>_That's the Repository Browser._</small>
  - Select repository `jcenter-cache` from the list.
  - Next to _Artifact Count_, click on **`Show`**

<small>_This repository was empty when you started, now it contains everything that Jenkins (actually Maven) has downloaded<br/>
for your single build. JCenter is a superset of the Maven Central repository, so it also includes libaries hosted elsewhere._</small>


## ![artifactory-logo](images/artifactory.png) <span>Artifactory &mdash; Repository libs-snapshots-local</span>

Jenkins did produce a .war file during the build, and the version has the `-SNAPSHOT` suffix.

  - Select repository `libs-snapshot-local` from the list.<br/>
    <small>_This is the repository where the .war file is expected to land, but it is still empty._</small>



## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; deploy the Artifact to Artifactory (1)</span>

  - Navigate in Jenkins to your **Project** page
  - Select **Configure** (_Configureren_) in the menu on the left
  - Select tab **Post-Build Actions** (_Acties na Bouwpoging_)
  - Unfold the list **Add post-build action** (_Toevoegen actie na bouwpoging_)<br/>
    and select **Deploy artifacts to Artifactory**<br/>
	
	<small>_The added form is quite big. Scroll about one page back upwards.<br/>
	You should select what repositories to deploy to, but the list is still empty._</small>


## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; deploy the Artifact to Artifactory (2)</span>

  - Under the repository fields, on the right click button **Refresh Repositories**
  - Select the following repositories:<br/>
    - Target **releases** repository: `libs-release-local`
    - Target **snapshot** repository: `libs-snapshot-local`
	
	_The rest of this huge form can be left empty._</small>
  - Click **Save** and run the build again.


## ![artifactory-logo](images/artifactory.png) <span>Artifactory &mdash; Behold: your artifact!</span>

The Jenkins build should finish without issues.

  - Switch back to Artifactory and refresh the screen with **F5**.<br/>
    <small>_There should now be a &#9658; sign next to_ `libs-snapshot-local` _to signify it has content._</small>
  - Unfold the folders of our groupId, artifactId and version.<br/>
    <small>_Here you'll find the produced_ `.pom` _and_ `.war` _files, plus a_ `maven-metadata.xml`</small>
  - Dig in deeper, into the `.war` and it's subfolders `WEB-INF/classes`.<br/>
    <small>_This is where your_ `wishlist.txt`, _originally from_ `src/main/resources` _is placed._</small>
  - Check that your own, personal `wishlist.txt` was put into the `.war` file.<br/>
    <small>&nbsp;</small>

### [![slow](images/slow.png)](#/11) &#8656; do \ SonarQube code quality reports / skip &#8658; [![fast](images/fast.png)](#/12)



## ![sonarqube-logo](images/sonar.png) <span>SonarQube &mdash; Introduction</span>

> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


## ![sonarqube-logo](images/sonar.png) <span>SonarQube &mdash; Fix some Code Quality issues</span>

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.



## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; deploy The App</span>

### ... and ...
# WIN !!!
