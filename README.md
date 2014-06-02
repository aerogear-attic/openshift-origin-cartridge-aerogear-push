# OpenShift WildFly Cartridge

This cartridge is running WildFly 8.1.0.Final

This cartridge is based on the JBoss AS cartridge found in OpenShift Origin [here](https://github.com/openshift/origin-server/tree/master/cartridges/openshift-origin-cartridge-jbossas).  

Pretty much everything seems to be working fine, but it can still use some testing.  

If you find any issues, please log them in the [issues](https://github.com/openshift-cartridges/openshift-wildfly-cartridge/issues) section of the [github](https://github.com/openshift-cartridges/openshift-wildfly-cartridge) project.  

This cartridge will act very similarly to the jbossas-7 cartridge that you can create a gear with.  
You should be able to modify the code in the /src directory of the git repository, and do a git add, git commit, and git push and have it deployed as ROOT.war.  
You can also remove the pom.xml and /src directories and place a war file in the deployments directory and they should deploy like they do on JBoss AS 7  

### Create a new WildFly app

There are a few ways to get started quickly on OpenShift. To create a new WildFly app using the OpenShift Web Console, click on "Deploy Now" [here](https://www.openshift.com/quickstarts/wildfly-8). If you'd like to use the OpenShift [command line tools](https://www.openshift.com/get-started) instead, the following command can be used:

	rhc app create wildfly https://cartreflect-claytondev.rhcloud.com/reflect?github=openshift-cartridges/openshift-wildfly-cartridge
	
It will take a few minutes to build, so be patient.

### Create a new WildFly app based on an existing app

If you already have an existing WildFly OpenShift application, you can create a new WildFly app based on the existing one using the RHC --from-app command. First, make sure you have the latest version of the OpenShift command line tools:

    gem update rhc

Then, create your new WildFly app:

    rhc app create <NEW_WILDFLY_APP> --from-app <OLD_WILDFLY_APP>

This creates an application that's a clone of your existing one (i.e., same gear size, scaling configuration, environment variables, git repository, etc.). This means that your new WildFly application will have the same configuration and deployment(s) as your existing application.

It will take some time to complete, so be patient.

### JBoss CLI

This cartridge provides an OpenShift compatible wrapper of the JBoss CLI tool on the gear PATH, located at $OPENSHIFT_WILDFLY_DIR/bin/tools/jboss-cli.sh. Use the following command to connect to the WildFly instance with the CLI tool:

        jboss-cli.sh -c --controller=$OPENSHIFT_WILDFLY_IP:$OPENSHIFT_WILDFLY_MANAGEMENT_HTTP_PORT

###Super Secret Hint (Don't tell anyone)

If you run the rhc port-forward command, you can access the WildFly management interface on port 9990.  
A username and password is created when you install this cartridge.  
If you don't write it down, fear not, the following environment variables will contain them.  
$OPENSHIFT_WILDFLY_USERNAME  
$OPENSHIFT_WILDFLY_PASSWORD

	corey$ rhc port-forward wildfly
	Checking available ports ... done
	Forwarding ports ...

	To connect to a service running on OpenShift, use the Local address

	Service Local               OpenShift
	------- -------------- ---- -------------------
	java    127.0.0.1:8080  =>  127.13.118.129:8080
	java    127.0.0.1:9990  =>  127.13.118.129:9990
	java    127.0.0.1:9999  =>  127.13.118.129:9999
	
In this example, you would visit 127.0.0.1:9990 to access the WildFly Admin Console from your local computer.

### Markers

Adding marker files to `.openshift/markers` will have the following effects:

    java8                Will run WildFly with Java 8 if present

    java7                Will run WildFly with Java 7 if present

New WildFly apps will default to using Java 8.

### Thanks to the following:
Stian Thorgersen for this blog article that helped get this going!
https://community.jboss.org/people/stianst/blog/2013/06/13/run-wildfly-on-openshift-using-the-diy-cartridge

Also thanks to the OpenShift team, and the users on the #wildfly channel on Freenode for helping answer questions and helping troubleshoot inter-gear management connection issues.


