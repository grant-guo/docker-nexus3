#!/bin/bash

sudo keytool -import -alias grant -file ssl/grant.pem -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/jre/lib/security/cacerts -storepass changeit
