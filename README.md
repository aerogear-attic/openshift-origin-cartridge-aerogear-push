# OpenShift Wildfly Cartridge

This cartridge is running Wildfly 8.0.0.Beta1

This cartridge is based on the JBoss AS cartridge found in OpenShift Origin [here](https://github.com/openshift/origin-server/tree/master/cartridges/openshift-origin-cartridge-jbossas).  

Pretty much everything seems to be working fine, but it can still use some testing.  

If you find any issues, please log them in the [issues](https://github.com/developercorey/openshift-wildfly-cartridge/issues) section of the [github](https://github.com/developercorey/openshift-wildfly-cartridge) project.  

This cartridge will act very similarly to the jbossas-7 cartridge that you can create a gear with.  
You should be able to modify the code in the /src directory of the git repository, and do a git add, git commit, and git push and have it deployed as ROOT.war.  
You can also remove the pom.xml and /src directories and place a war file in the deployments directory and they should deploy like they do on JBoss AS 7  


You can build a gear using this cartridge with the following command:

	rhc app create wildfly https://raw.github.com/developercorey/openshift-wildfly-cartridge/master/metadata/manifest.yml
	
It will take a few minutes to build, so be patient.


## Thanks to the following:
Stian Thorgersen for this blog article that helped me get going!
https://community.jboss.org/people/stianst/blog/2013/06/13/run-wildfly-on-openshift-using-the-diy-cartridge

Also thanks to the OpenShift team, and the users on the #wildfly channel on Freenode for helping answer my questions and help me troubleshoot inter-gear management connection issues.


