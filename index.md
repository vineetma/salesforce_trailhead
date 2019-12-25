---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

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

