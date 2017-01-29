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

[GitBlit](http://gitblit.com/) is a basic repository management tool for hosting git repositories on your own server. It does not try to be a full collaborative development environment, like <small>[GitBucket](https://gitbucket.github.io/gitbucket-news/about/)</small> it just hosts repositories.
There are plenty other systems <small>([GitHub](https://github.com/), [GitLab](https://about.gitlab.com/), [Phabricator](https://www.phacility.com/), [SCM Manager](https://www.scm-manager.org/), and [Tuleap](https://www.tuleap.org/) to name a few)</small> 
that offer more functionality. But for this workshop GitBlit is just fine.

So let's give it a spin!


## ![gitblit-logo](images/gitblit.png) <span>GitBlit &mdash; Repository Browsing</span>

  - Click in the menu bar on __GitBlit__. The first screen you see is the Dashboard, which is not that interesting.
  - In the top menu pick the second option: **Repositories**. We have pre-loaded a couple repositories into GitBlit. Take a look at for instance repository **jqno/equalsverifier**. 
  - On the **Overview** screen you can see some *commits*, *tags* and *branches*.
  - Also try the menu with *commits*, *tree* <small>(source code)</small> and *docs*.

Don't spend too much time here, there's lots more to do. For instance, you cannot yet reach the most important repository because it needs your authentication. We'll do that next!


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

  - Om the overview screen of our repository `OrdinaJTech/fordintysa-ci` you'll find the attribute **repositorie url**.
  - The quickest way to copy the url is to click on the ![](images/gb_copyurl.png) icon between the words `.git` and `RW+`.
  - Use your favorite tools to make a clone of the repository.



## ![jenkins-logo](images/jenkins.png) <span>Jenkins &mdash; Introduction</span>

Ipsum lorem
