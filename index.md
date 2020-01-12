---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: My Notes
layout: home
---

## Motivation for learning Salesforce

a. If platform is so good, why people have to code so much
b. Why is it that team spends lot of effort in code merge
c. Ability to use command line tools
d. What is the capabilit of tests available, why we need to depend upon Selenium so much

## Challenge in connecting VSCode to the trailhead

One has to use Trailhead org, which is empowered to authorise and use of APIs.

## Awesome TrailHead

Used TrailMixes to define my own [learning path](https://trailhead.salesforce.com/users/vmaheshwari6/trailmixes/vineet-quick-learning-path)

Focussing on:

a. Administrator module (Beginner)
b. Apex programming
c. Testing
d. Integrations

## Working with Visual Code

Update the code to salesforce org:

* Authorize the org
* Deploy this source to org

Question: How can I upload multiple files to the org

Run the tests on org

* Ensure that the source code for test and code is deployed to org
* Invoke Tests

To get the code coverage

* ```sdfc force:apex:test:run -c -u debuggerOrg -r human```
* ```-c``` stands for code coverage
* note that this command runs all the tests. Question: I want only selected tests to run
* ```human``` -- indicates the output is captured on the terminal. You can specify csv as well there.

To get the report without running the tests

* command

```
sfdx force:data:soql:query -q \
    'select ApexTestClass.Name,
    TestMethodName,
    ApexClassOrTrigger.Name,
    NumLinesUncovered,
    NumLinesCovered,
    Coverage from ApexCodeCoverage -u debuggerOrg -t -r human
```

## Use of Date

Date as it may appear to be a class and hence use of ```new Date()```. It is not. It is a primitive and one has to call it as ```Date.newInstance(arg1, arg2, arg3)```

## Use of Boolean

Boolean variable unless initialised, like any other variable also remains initialised to ```null```

## Use of data from org

This is not enabled by default. All inserts/updates to org data is temporary and is discarded as soon as tests end. It can be enabled by passing argument to ```isTest(SeeAllData = true)```

## Use of Asynchronous Programming

Four types:

* Future -- Timing is not guaranteed
* Batchable -- Large records, maintenance kind of activity
* Queueable -- Can sequence
* Scheduled -- Schedule at particular time

Testing in this:

Two new directives learnt:

* @testSetup
* testmethod (if written before the return type)

Class must implement for batchable functionality:

* start
 * this returns Database.QueryLocator
 * getQueryLocator is a useful function here which would contain SOQL to fetch the records to be used
 * this contains argument -- 'Database.BatchableContext

* execute
 * this intakes BatchableContext as the argument and also the scope which would be List of the records of
 type that are returned in start

* finish
 * Use AsynJobQueue to query the status of all the jobs and print, once all is done


For all the asynchronous jobs, use startTest and stopTest to ensure that asynchronous work is done synchronously.