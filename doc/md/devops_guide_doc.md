#  QTO DEVOPS GUIDE
* [1. GUIDING PRINCIPLE'S](#1-guiding-principle's)
  * [1.1. USE COMMON SENSE](#11-use-common-sense)
  * [1.2. PERSONAL RESPONSIBILITY](#12-personal-responsibility)
  * [1.3. ATTEMPT FOR 100% TEST COVERAGE TO ACHIEVE RELIABILITY](#13-attempt-for-100%-test-coverage-to-achieve-reliability)
  * [1.4. IT SHOULD JUST WORK](#14-it-should-just-work)
  * [1.5. NAMING CONVENTIONS](#15-naming-conventions)
  * [1.6. BE FRIENDLY TO ALL](#16-be-friendly-to-all)
  * [1.7. AIM FOR SIMPLICITY](#17-aim-for-simplicity)
  * [1.8. DO NOT ALLOW BROKEN WINDOWS](#18-do-not-allow-broken-windows)
  * [1.9. DO NOT ADD A COMMIT WITHOUT PASSING ALL THE REGRESSION TESTS](#19-do-not-add-a-commit-without-passing-all-the-regression-tests)
* [2. ETL OPERATIONS](#2-etl-operations)
  * [2.1. DB DATA BACKUP AND RESTORE](#21-db-data-backup-and-restore)
  * [2.2. RUN INCREASE-DATE ACTION](#22-run-increase-date-action)
  * [2.3. LOAD XLS ISSUES TO DB AND FROM DB](#23-load-xls-issues-to-db-and-from-db)
  * [2.4. DIRS NAMING CONVENTIONS](#24-dirs-naming-conventions)
* [3. NAMING CONVENTIONS](#3-naming-conventions)
  * [3.1. PRODUCT INSTANCE DIRECTORIES](#31-product-instance-directories)
  * [3.2. ROOT DIRS NAMING CONVENTIONS](#32-root-dirs-naming-conventions)
  * [3.3. DABASE NAMING CONVENTIONS](#33-dabase-naming-conventions)
* [4. SOURCE CODE MANAGEMENT](#4-source-code-management)
  * [4.1. CONFIGURE AND USE GIT ALWAYS BY USING SSH IDENTITIES](#41-configure-and-use-git-always-by-using-ssh-identities)
  * [4.2. AIM FOR TRACEABILITY BETWEEN USER-STORIES, REQUIREMENTS, FEATURES AND FUNCTIONALITIES](#42-aim-for-traceability-between-user-stories-requirements-features-and-functionalities)
  * [4.3. ZERO TOLERANCE FOR BUGS, ESPECIALLY CRASHES](#43-zero-tolerance-for-bugs-especially-crashes)
  * [4.4. ALWAYS START WITH A TEST UNIT CREATION](#44-always-start-with-a-test-unit-creation)
  * [4.5. BRANCH FOR COMMON DEVELOPMENT - DEV](#45-branch-for-common-development--dev)
  * [4.6. INTEGRATION TESTING IN THE TST BRANCH](#46-integration-testing-in-the-tst-branch)
  * [4.7. PRODUCTION IN THE PRD BRANCH](#47-production-in-the-prd-branch)
  * [4.8. MASTER BRANCH - THE SINGLE TRUTH FOR CURRENT STABLE VERSION OF THE SOFTWARE](#48-master-branch--the-single-truth-for-current-stable-version-of-the-software)
* [5. SOURCE CODE STYLING](#5-source-code-styling)
  * [5.1. SPACES AND NOT TABS](#51-spaces-and-not-tabs)
  * [5.2. PERL SOURCE CODE STYLING](#52-perl-source-code-styling)
    * [5.2.1. Spacing after variable asignments](#521-spacing-after-variable-asignments)
    * [5.2.2. Set 3 spaces for a tab](#522-set-3-spaces-for-a-tab)
    * [5.2.3. Empty lines](#523-empty-lines)
* [6. WAY OF WORKING](#6-way-of-working)
  * [6.1. CHAT / IRC](#61-chat-/-irc)
  * [6.2. DEFINITION OF DONE](#62-definition-of-done)
  * [6.3. E-MAIL COMMUNICATION](#63-e-mail-communication)
  * [6.4. ISSUES MANAGEMENT](#64-issues-management)
  * [6.5. DOCUMENTATION](#65-documentation)
* [7. TESTING](#7-testing)
  * [7.1. CHECKING THE PERL SYNTAX](#71-checking-the-perl-syntax)
  * [7.2. RUNNING UNIT TESTS](#72-running-unit-tests)
  * [7.3. RUNNING FUNCTIONAL TESTS](#73-running-functional-tests)
  * [7.4. RUNNING INTEGRATION TESTS](#74-running-integration-tests)
  * [7.5. USER-STORY CREATION](#75-user-story-creation)
* [8. FEATURE IMPLEMENTATION WORKFLOW](#8-feature-implementation-workflow)
  * [8.1. PROBLEM REGISTRATION](#81-problem-registration)
  * [8.2. REQUIREMENTS CREATION](#82-requirements-creation)
  * [8.3. ISSUE CREATION](#83-issue-creation)
  * [8.4. FEATURE BRANCH CREATION](#84-feature-branch-creation)
  * [8.5. CREATE A TEST-ENTRY POINT](#85-create-a-test-entry-point)
  * [8.6. IMPLEMENTATION OF PROOF OF CONCEPT ( OPTIONAL )](#86-implementation-of-proof-of-concept-(-optional-))
  * [8.7. PROTOTYPE IMPLEMENTATION ( OPTIONAL )](#87-prototype-implementation-(-optional-))
  * [8.8. UNIT AND / OR INTEGRATION TEST CREATION](#88-unit-and-/-or-integration-test-creation)
  * [8.9. IMPLEMENTATION ](#89-implementation-)
  * [8.10. DEPLOYMENT AND TEST TO THE TEST ENVIRONMENT](#810-deployment-and-test-to-the-test-environment)
  * [8.11. DEPLOYMENT AND TEST TO THE PRODUCTION ENVIRONMENT](#811-deployment-and-test-to-the-production-environment)
  * [8.12. QUALITY ASSURANCE ITERATION](#812-quality-assurance-iteration)
  * [8.13. DOD CHECK-LIST WALKTHROUGH](#813-dod-check-list-walkthrough)
  * [8.14. THE FEATURE OR FUNCTIONALITY CURRENT DESCRIPTION IS ADDED IN THE DOCS](#814-the-feature-or-functionality-current-description-is-added-in-the-docs)
    * [8.14.1. Regenerate the md docs](#8141-regenerate-the-md-docs)
    * [8.14.2. Regenerate the pdf docs](#8142-regenerate-the-pdf-docs)
    * [8.14.3. Regenerate the msft docs](#8143-regenerate-the-msft-docs)
  * [8.15. THE RELATED REQUIREMENT IS ADDED IN THE REQUIREMENTS DOCUMENT](#815-the-related-requirement-is-added-in-the-requirements-document)
  * [8.16. AT LEAST 2 TIMES PASSED FUNCTIONAL AND JS TESTS RUN ](#816-at-least-2-times-passed-functional-and-js-tests-run-)
  * [8.17. AT LEAST 2 TIMES PASSED INTEGRATION TESTS  IN EACH ENVIRONMENT INSTANCE](#817-at-least-2-times-passed-integration-tests-in-each-environment-instance)
  * [8.18. DEPLOYMENT TO THE TEST ENVIRONMENT](#818-deployment-to-the-test-environment)
  * [8.19. CHECK THAT ALL THE FILES IN THE DEPLOYMENT PACKAGE ARE THE SAME AS THOSE IN THE LATEST COMMIT OF THE DEV GIT BRANCH. ](#819-check-that-all-the-files-in-the-deployment-package-are-the-same-as-those-in-the-latest-commit-of-the-dev-git-branch-)
  * [8.20. RESTART THE APPLICATION LAYER](#820-restart-the-application-layer)
* [9. DEVBOX SETUP ( OPTIONAL )](#9-devbox-setup-(-optional-))
  * [9.1. THE TMUX TERMINAL MULTIPLEXER](#91-the-tmux-terminal-multiplexer)
  * [9.2. THE VIM IDE](#92-the-vim-ide)
* [10. DEBUGGING](#10-debugging)
  * [10.1. ENABLE DEBUGGING IN MOJOLICIOUS](#101-enable-debugging-in-mojolicious)
  * [10.2. ENABLE DEBUGGING IN DBI](#102-enable-debugging-in-dbi)
  * [10.3. DEBUGGING IN THE UI](#103-debugging-in-the-ui)
* [11. SECURITY](#11-security)
  * [11.1. AUTHENTICATION](#111-authentication)
    * [11.1.1. JWT based native authentication](#1111-jwt-based-native-authentication)
    * [11.1.2. Session based native authentication](#1112-session-based-native-authentication)
    * [11.1.3. RBAC based native authentication](#1113-rbac-based-native-authentication)
  * [11.2. AUTHORISATION](#112-authorisation)
    * [11.2.1. Generic role-based access control list based authorisation](#1121-generic-role-based-access-control-list-based-authorisation)
* [12. KNOWN ISSUES AND WORKAROUNDS](#12-known-issues-and-workarounds)
    * [12.1. The RBAC based native authorisation](#121-the-rbac-based-native-authorisation)
  * [12.1. ALL TESTS FAIL WITH THE 302 ERROR](#121-all-tests-fail-with-the-302-error)
  * [12.2. MORBO IS STUCK](#122-morbo-is-stuck)
    * [12.2.1. Probable root cause](#1221-probable-root-cause)
    * [12.2.2. Kill processes](#1222-kill-processes)
    * [12.2.3. Problem description](#1223-problem-description)
  * [12.3. THE PAGE LOOKS BROKEN - PROBABLY THE NEW CSS IS NOT RE-LOADED](#123-the-page-looks-broken--probably-the-new-css-is-not-re-loaded)
  * [12.4. THE VUE UI DOES NOT UPDATE PROPERLY ](#124-the-vue-ui-does-not-update-properly-)
  * [12.5. NGINX FAILS WITH 502 BAD GATEWAY ERROR AND PROBABLY CRASHES THE SITE](#125-nginx-fails-with-502-bad-gateway-error-and-probably-crashes-the-site)
  * [12.6. WHY HAVING ALL THE HASSLE WITH THIS DIRECTORY STRUCTURE - IS OVERKILL ?!!](#126-why-having-all-the-hassle-with-this-directory-structure--is-overkill-)
* [13. FAQ](#13-faq)




    

## 1. GUIDING PRINCIPLE'S
This section might seem too philosophical for a start, yet all the development in the qto has ATTEMPTED to follow the principles described bellow. If you skip this section now you might later on wander many times why something works and it is implemented as it is ... and not "the right way". 
Of course you are free to not follow these principles, the less you follow them the smaller the possibility to pull features from your instance(s) - you could even use the existing functionality to create a totally different fork with different name and start developing your own toll with name X - the authors give you the means to do that with this tool ... , but if you want to use and contribute to THIS tool than you better help defined those leading principles and follow them. 

    

### 1.1. Use common sense
Use common sense when applying all those principles. Of course they are not engraved in stone and you should be flexible enough for the actual situation, problem, issue etc.

    

### 1.2. Personal responsibility
Any given instance of the qto should have ONE and only ONE person which is responsible at the end for the functioning of THE instance - so think carefully before attempting to take ownership of an instance. The author(s) of the code are not responsible for the operation, bugs or whatever happens to a new instance. As a responsible owner of an instance you could create, share and assign issues to the authors of the source code, yet there is no Service Level Agreement, only openly stated attempt to assist when possible.
Qto is design to make version updates fully vertically integrated and as automated as possible, yet YOU will be responsible for increasing the versions, taking backups, applying database migrations and so on ... 

    

### 1.3. Attempt for 100% test coverage to achieve reliability
The more you increase your test coverage the greater the confidence that the code will work as expected. 
Do not write a single function without first implementing the testing call for that function - this has been proven really, really difficult, yet the more features are added the less the time wasted in troubleshooting of bugs and un-expected behaviour when proper testing is implemented. 
Testing ensures the consistency and future expandability of the functionalities. Our velocity increases with the WORKING features and functionalities added over time. ANYTHING, which is not working, or not even sure about how it should be working MUST be [fixed](fixed/deleted.) 

    

### 1.4. It should just work
Any instance of the qto should simply work as promised - no less, no more. 
Any instance is the combination of code, configurations, binaries in the System and data - that is the instance you are using should just work for the set of functionalities promised. 

    

### 1.5. Naming conventions
All the names used in the code and the configurations MUST BE human readable and expandable - that is name the objects from the greater realm to the smaller - for example &lt;&lt;env&gt;&gt;_&lt;&lt;db_name&gt;&gt; , because the concept of operational IT environments ( dev , test , qas , prd ) is broader than the concept of a application databases ... 
Before you start a new concept for example code for a new run-time spent some time first for some initial planning :
 - how-many objects are there going to be after 10 years !!
 - how about searching through those objects - how easy will it be 
 - are you naming data, configuration, binary or source code objects ?

    

### 1.6. Be friendly to all
Especially to technical personnel, as you cannot achieve user-friendliness for the end-users unless your developers and technical personnel are happy while interacting with your artefacts. 

    

### 1.7. Aim for simplicity
Things should be as simple as possible, but not simpler - if Einstein said it it makes sense - having lost so much time in endless loops of IT complexity - the older we get the more it gets more rational. 

    

### 1.8. Do not allow broken windows
A broken windows is any peace of code or documentation which is hanging around not included in the integration tests suite and not matching the most up-to-date standards for work deliverables. Either bring it up to the standard level or get rid of it. 
As soon as you find a bug, write a test for it, if you can't create the needed testing setup invest in time developing the needed skills.

    

### 1.9. Do not add a commit without passing ALL the regression tests
Even in your personal branch. Really. Because after the application has surpassed the mark of having 200 000 lines of code the complexity added to a "broken machine" WILL NOT justify the breaking of an existing feature. If you do not consider the feature / functionality tested as important than feel free to REMOVE it ( both implementations AND tests ) in that very same commit.

    

## 2. ETL OPERATIONS


    

### 2.1. Db data backup and restore
Check maintenance_guide_doc-23

    

### 2.2. Run increase-date action
You track the issues of your projects by storing them into xls files in "daily" proj_txt dirs. 
Each time the day changes by running the increase-date action you will be able to clone the data of the previous date and start working on the current date.

    bash src/bash/qto/qto.sh -a increase-date

### 2.3. Load xls issues to db and from db
To load xls issues to db run the following one-liner:

    bash src/bash/qto/qto.sh -a xls-to-db
    
    

### 2.4. Dirs naming conventions
The dir structure should be logical and a person navigating to a dir should almost understand what is to be find in thre by its name .. 

    

## 3. NAMING CONVENTIONS


    

### 3.1. Product instance directories


    

### 3.2. Root Dirs naming conventions
The root dirs and named as follows:
bin - contains the produced binaries for the project
cnf - for the configuration
dat - for the data of the app
lib - for any external libraries used
src - for the source code of the actual projects and subprojects

    

### 3.3. Dabase naming conventions
Each database must start with it's environment prefix - dev, tst or prd. And yes this is so fundamentally in-build into qto that changing this naming convention will definitely destroy your application.

    

## 4. SOURCE CODE MANAGEMENT
The qto is a derivative of the wrapp tool - this means that development and deployment process must be integrated into a single pipeline. 

    

### 4.1. Configure and use git ALWAYS by using ssh identities
You probably have access to different corporate and public git repositories. Use your personal ssh identity file you use in GitHub to push to the qto project. The following code snippet demonstrates how you could preserve your existing git configurations ( even on corporate / intra boxes ) , but use ALWAYS the personal identity to push to the qto...

    # create the company identity file
    ssh-keygen -t rsa -b 4096 -C "first.last@corp.com" -f ~/.ssh/id_rsa.corp.`hostname -s`
    
    ~/.ssh/id_rsa.corp.`hostname -s` 
    # copy paste this one into your githubs, private keys
    
    # set alias for the git command to avoid overtyping ...
    alias git='GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa.corp.`hostname -s` " git'
    
    # clone a repo 
    git clone git@git.in.corp.com:corp/project.git
    
    export git_msg="my commit msg with my corporate identity, explicitly provide author"
    git add --all ; git commit -m "$git_msg" --author "MeFirst MeLast <first.last@corp.com>"
    git push 
    
    # and verify 
    clear ; git log --pretty --format='%h %ae %<(15)%an ::: %s

### 4.2. Aim for traceability between user-stories, requirements, features and functionalities
Once the issues are defined and you start working on your own branch which is named by the issue-id aim to map one on one each test in your code with each listed requirement in confluence and / or JIRA. 

    

### 4.3. Zero tolerance for bugs, especially crashes
As soon as bugs are identified and reproduceable, register them as issues and resolve them with prio ( aka priority ) 1.
After resolution, think about the root cause of the bug, the mear fact that the bug occurred tells that something in the way of working has to be improved , what ?!
Bugs are like broken windows the more you have them the faster the value of your building will be down to zero. 

    

### 4.4. ALWAYS Start with a test unit creation
Do not ever never write code without starting first the unit test on how-to test the code. Period. 
This is he only way to avoid braking old functionalities when the application code base grows larger. 
Each time a new bug is found fix it by adding new Unit Test!

    

### 4.5. Branch for COMMON development - dev
No code should be merged into the development branch without broad testing coverage and approval from the owner of the instance - as the owner of the instance is at the end responsible personally for the whole instance, since once a change has been merged to develop it must pass as quickly as possible to tst, prd and master.

    

### 4.6. Integration testing in the tst branch
The tst branch is dedicated for integration testing of all the tests, the deployment, performance testing and configuration changes. Should you need to perform bigger than a small hotfix changes you must branch the tst branch into a separate dev--feature branch and re-run the integration testing and approval all over. 
At the end all the integration tests should be behind this shell call. 

    bash src/bash/qto/qto.sh -a run-integration-tests

### 4.7. Production in the prd branch
The prd branch is the one deployed to the production environment. This code is NOT straight merged into the master branch , but after certain time depending on the dynamic of the tool with bugless operation merged. 

    

### 4.8. master branch - the single truth for current stable version of the software
Once the business has approved a new version - it should be moved to the master branch and all other branches including the separate feature branches MUST be REBASED ( and NOT MERGED !!! ) from the master branch to accommodate any hotfixes, configuration related adjustments or quick bug fixes detected in production only. 

    

## 5. SOURCE CODE STYLING
This section is going to be the one to be debated and hated the most ...

    

### 5.1. Spaces and not tabs


    

### 5.2. Perl source code styling


    

#### 5.2.1. Spacing after variable asignments
You might want to use spacing after variable assignments if you have a lot of variables assigned ... it improves the readability of the code ....

    

#### 5.2.2. Set 3 spaces for a tab
Why ????!!!!!
Because 2 is too little and 4 is too much and line legth of 80 to 100 is too small to be wasted or packed with too much stuff ... 
Also 3 is a magical number ...

    

#### 5.2.3. Empty lines
Empty lines improve readability, when used in a standard way: 
Use 2 empty lines between functions and 1 empty line between logical blocks within functions.

    

## 6. WAY OF WORKING
This section describes the way of working within a team working on the qto project. 
The work on the qto project is conducted by using the Scrum methodology, thus the Scrum

    

### 6.1. Chat / IRC
Should you want a quicker respond than 2 hours use a chat tool. Do not expect people to answer you straight away, it takes 5 to 20 min to reach the most productive flow state, thus not answering your question might be the more productive option from the point of view of the organisation.

    

### 6.2. Definition of Done
Each issue must have a tangible artifact. An issue without tangible artifact is a thought thrown in the air.
The DoD must be iterated and updated during each Sprint Review. 

    

### 6.3. E-mail communication
Do not use e-mail communication for code style, testing, developing etc. Issues which could be achieved with the code review interface of the source code management system. 
Before writing an e-mail think first could you find a way to avoid writing it at all. 
Do not expect answer of your e-mail within 2 hours. 
Use e-mail when you have to get an written evidence on agreed matters, which might cause later on discussions. 

    

### 6.4. Issues management
At the end of the month you should move the completed issues to the yearly_issues table as follows:


    psql -d tst_qto -c "
    INSERT INTO yearly_issues
    ( guid  , id  , type  , category  , status  , prio  , name  , description  , owner  , update_time)
    SELECT
    guid  , id  , type  , category  , status  , prio  , name  , description  , owner  , update_time
    FROM monthly_issues WHERE 1=1 and status='09-done'
    ON CONFLICT (id) DO UPDATE
    SET
    guid = excluded.guid ,id = excluded.id ,type = excluded.type ,category = excluded.category ,status = excluded.status ,prio = excluded.prio, name = excluded.name ,description = excluded.description ,owner = excluded.owner ,update_time = excluded.update_time
    ;
    "

### 6.5. Documentation
Undocumented feature is not a feature. 

    

## 7. TESTING
Why the testing section is before the coding one ??!!!
Because in order for you to be able to add more functionalities to the qto application you MUST first understand how to ensure that you are not causing regression bugs - aka the application "works" according to one of the main principle - it must just work, no more and no less.

    

### 7.1. Checking the perl syntax
Before running any tests check the perl syntax ... as follows:

    bash src/bash/qto/qto.sh -a check-perl-syntax
    # starts echoging something like this...
    ...
     ::: running: cd src/perl/qto ; perl -MCarp::Always -I /hos/opt/qto/qto.0.8.1.dev.ysg/src/perl/qto -I /hos/opt/qto/qto.0.8.1.dev.ysg/src/perl/qto/lib -wc "./t/lib/Qto/App/Utils/TestInitiator.t" ; cd -

### 7.2. Running unit tests


     bash src/bash/qto/qto.sh -a run-unit-tests

### 7.3. Running functional tests


     bash src/bash/qto/qto.sh -a run-functional-tests

### 7.4. Running integration tests


     bash src/bash/qto/qto.sh -a run-integration-tests

### 7.5. User-Story creation
Use the following template while creating the user story:
As an &lt;&lt;role&gt;&gt;
In order to &lt;&lt;achieve something/ bring value by&gt;&gt; 
I want to to be able to &lt;&lt;action-description&gt;&gt; 

    

## 8. FEATURE IMPLEMENTATION WORKFLOW
This section describes the common workflow for implementing a feature. 
As in other places the main principle to follow is "use common sense" , thus try to follow this workflow for feature implementation, but challenge it as soon as it defies the common sense. 

    

### 8.1. Problem registration
Should you have problems or bugs, or even questions register them first into the qto application. Problems are often hint from the reality on the actual work, which has to be performed, yet problems are not yet issues. Issues are meant to be derived from problems in structured way, so that the deliverable of each issue must be testable and distinguishable, as well as the work.
The reason the problem registration is on top of this subsection is the fact that bugs and problems should be dealt with higher priority, to minimise the technical debt of the application.

    

### 8.2. Requirements creation
Depending on the size and agility of your organisation formal requirements exist.

    

### 8.3. Issue creation
Even if you do not have a defined documentation artefact - create a new issue, which could be the start for a an action affecting the run-state, configuration , data , features and functionalities or other aspects of the qto application. 
An issue could be a bug, a request for a feature or even simply an undefined combination of problems and solution which could quickly be formalised by defining a new requirement, another issue, feature-request

    

### 8.4. Feature branch creation
Create the feature branch by using the following naming convention:
 - dev--&lt;&lt;short-feature-title&gt;&gt;

    git branch -a
    * dev
    dev--qto-18050801-add-order-by-in-select-ctrlr
    master
    ...
    
    

### 8.5. Create a test-entry point
Even the smallest proof of concept needs a small test-entry point. Start always with the testing and the testing scalability in mind. 

    

### 8.6. Implementation of Proof of Concept ( optional )
Aim to create a small POC for the new concept, feature or functionality - for example a page having a lot of hardcoding, which constrains the scope for ONLY this new thing. 
POC small "projects" are extremely useful when new ui controls are to be integrated into the common base - check the public/poc directory for the the subdirectories containing the iterative approaches while introducing different controls into the project.
Strive however to use the same naming convention, and implement with future integrations within the end truly dynamic code. 

    

### 8.7. Prototype implementation ( optional )
The same instructions as the POC apply, but the prototype contains a certain and broader level of integration with the dynamic parts of the System.

    

### 8.8. Unit and / or integration test creation
Strive to create always unit and / or integration test(s).

    

### 8.9. Implementation 
Implement by quick unit test runs. Constantly improve both the code , configuration changes and the test code. Think about re-usability and scalability during implementation, but do not overgeneralise.

    

### 8.10. Deployment and test to the test environment
Deploy to the test environment a new instance with the current version as follows:

    # deploy to the tst environment
    bash src/bash/qto/qto.sh -a to-tst
    
    # go to the product instance dir of the tst env for this version
    cd ../qto.<<version>>.tst.<<owner>>
    bash src/bash/qto/qto.sh -a run-integration-tests
    bash src/bash/qto/qto.sh -a run-functional-tests

### 8.11. Deployment and test to the production environment
Repeat the same to the production environment. As the current version is usually work in progress your stable version will be one level bellow and thanks to the architecture of the tool you could test in the production environment ( as soon as you have proper configuration ).

    

### 8.12. Quality assurance iteration
This phase might be longer depending on the feature. Some of the features stay in quality assurance mode EVEN if they have been deployed to production.

    

### 8.13. DoD check-list walkthrough
Perform the DoD checklist as follows.

    

### 8.14. The feature or functionality current description is added in the docs
The feature or functionality current description is added in the Features and Functionalities document. Check also the end user guide - it might to be changed as well. It might pay off to revisit the ReadMe as well, which is the landing and more of a "selling" point.

    

#### 8.14.1. Regenerate the md docs


    # instead of the product instance dir you could also use different documents root 
    export docs_root_dir=/hos/opt/csitea/qto/qto.0.7.7.dev.ysg
    # Action !!!
    bash src/bash/qto/qto.sh -a generate-md-docs

#### 8.14.2. Regenerate the pdf docs
Regenerate the pdf docs by issuing the following one-liner

    # instead of the product instance dir you could also use different documents root 
    export docs_root_dir=/hos/opt/csitea/qto/qto.0.7.7.dev.ysg
    
    bash src/bash/qto/qto.sh -a generate-pdf-docs

#### 8.14.3. Regenerate the msft docs
Regenerate the Microsoft docx files by issuing the following shell one-liner:

    # instead of the product instance dir you could also use different documents root 
    export docs_root_dir=/hos/opt/csitea/qto/qto.0.7.7.dev.ysg
    # Action !!!
    bash src/bash/qto/qto.sh -a generate-msft-docs

### 8.15. The related requirement is added in the requirements document
The related requirement is added in the requirements document - there might be one or more requirements added. 

    

### 8.16. At least 2 times passed functional and js tests run 
Use the following shell actions ( Note that since v0.6.7 as authentication is required for most of the web-actions the QTO_ONGOING_TEST environmental variable has to be set to 1 to run those separately) :

    bash src/bash/qto/qto.sh -a run-js-tests
    bash src/bash/qto/qto.sh -a run-functional-tests

### 8.17. At least 2 times passed integration tests  in each environment instance
At least 2 times passed unit tests run in each environment instance - run the unit tests at least twice per environment. Should the run behave differently start all over from dev. Since v0.6.7 as authentication is required for most of the web-actions the QTO_ONGOING_TEST environmental variable has to be set to 1 to run those separately. 

    bash src/bash/qto/qto.sh -a run-integration-tests

### 8.18. Deployment to the test environment
Deploy to the test environment as shown in the code snippet bellow. Re-run the tests via the tests shell actions. 

    # deploy to the tst environment
    bash src/bash/qto/qto.sh -a to-tst
    
    # go to the product instance dir of the tst env for this version
    cd ../qto.<<version>>.tst.<<owner>>
    

### 8.19. Check that all the files in the deployment package are the same as those in the latest commit of the dev git branch. 
Deploy to the test environment as follows:

    # deploy to the tst environment
    bash src/bash/qto/qto.sh -a to-tst
    
    # go to the product instance dir of the tst env for this version
    cd ../qto.<<version>>.tst.<<owner>>
    

### 8.20. restart the application layer
Well just chain the both commands. 

    bash src/bash/qto/qto.sh -a mojo-morbo-stop ; bash src/bash/qto/qto.sh -a mojo-morbo-start

## 9. DEVBOX SETUP ( optional )
Every developer has his/her own development setup - this section is completely optional - your setup might be much more developed than the one suggested here ... You might find it 

    # run the automatic personal setup
    curl https://raw.githubusercontent.com/YordanGeorgiev/ysg-confs/master/src/bash/deployer/setup-bash-n-vim.sh | bash -s yordan.georgiev@gmail.com

### 9.1. The tmux terminal multiplexer
In this setup the tmux.conf contains all the instructions on the shortcut mappings, which enable quick navigation from one UI terminal window to multiple sessions with multiple windows etc. ...

    cat ~/.tmux.conf

### 9.2. The vim IDE
Once again we DO NOT encourage "religious wars", if you happen to be using or interested about the setup used for development, check the .vimrc at the root of the project, which will point you to all the plugins, shortcuts and settings used.

    # to check the syntax in the current file:
    :make
    
    # to check the syntax in the whole project from the proj root:
    bash ./src/bash/qto/qto.sh -a check-perl-syntax

## 10. DEBUGGING
Debugging is bad - it almost means that you have already lost the battle with the complexity of the code and MUST slow down to grasp what is actually happening ... 
But .. if you are already here than use the following hints ...

    

### 10.1. Enable debugging in Mojolicious
Set the env var(s) and restart morbo.
Check the following list of the Mojolicous env vars:
https://github.com/mojolicious/mojo/wiki/%25ENV

    # stop the application layer run-time if it is already running
    bash src/bash/qto/qto.sh -a mojo-morbo-stop
    
    # set the env var
    export MOJO_MODE=development
    # ... or any other of the variables above ...
    
    # restart the application layer 
    bash src/bash/qto/qto.sh -a mojo-morbo-start

### 10.2. Enable debugging in DBI
Set the DBI_TRACE env variable and restart the application layer. Check the dbitrace.log for your exact statement.

    # stop the application layer run-time if it is already running
    bash src/bash/qto/qto.sh -a mojo-morbo-stop
    
    # set the env var
    DBI_TRACE=1=dbitrace.log
    export DBI_TRACE
    
    # restart the application layer 
    bash src/bash/qto/qto.sh -a mojo-morbo-start

### 10.3. Debugging in the UI
The  mojo *html.ep DO contain a lot of JavaScript code, which IS RUN on the client AFTER it is run on the server side, thus the good old console.log or console.error work ... Quite often it makes sense to debug large JS objects, especially those related to VueJS.


    console.log(this.$parent)
    console.log("what exactly my parent control contains")
    console.log("todo:<<me>> remember to remove this ^^^")
    // ^^^ this one might seem like overkill , BUT you will be amazed
    // how-often you will have more than 5 console.log statements, which 
    // you would have to hunt down, after the completion of the feature by:
    find . -type f -name '*.html.ep' -exec grep -nHi console.log {} \;

## 11. SECURITY


    

### 11.1. Authentication
You might want to refresh the following security related links from time while reading this section:

http://self-issued.info/docs/draft-jones-json-web-token-06.html
https://metacpan.org/pod/Mojo::JWT
https://tools.ietf.org/html/rfc6749#section-1.5

    

#### 11.1.1. JWT based native authentication
Theory chk the following links:
http://self-issued.info/docs/draft-jones-json-web-token-06.html
https://metacpan.org/pod/Mojo::JWT
https://tools.ietf.org/html/rfc6749#section-1.5

    

#### 11.1.2. Session based native authentication
The session based authentication works basically as follows:
 - non-authenticated users requests a resource from the application layer
 - the application layer , runs the controller specified in the route
 - each controller is derived from the BasedController, which has the isAuthenticated metho
 - which returns 1 or 0 based on Mojo::Session stored data

So as of v0.7.8 - no roles, no permissions are implemented - the users are either authenticated or not. Once authenticated they can CRUD anything they have access to from the UI.

    

#### 11.1.3. RBAC based native authentication
The RBAC based native authentication works as follows:
- during start-up or meta-data reload the Guardian component saves the RBAC list into the Redis
- the User authenticates against the System via the login
- The System grants the list of roles to the JWT token of the user

    

### 11.2. Authorisation
As of v0.8.1 the Roles-Based Access Control List is being implemented. You might want to refresh your RBAC theoretical skills:
https://searchsecurity.techtarget.com/definition/role-based-access-control-RBAC

    

#### 11.2.1. Generic role-based access control list based authorisation
Start by defining your roles in the list/roles page. Keep the number of roles in the beginning to the absolute minimum - you could easily re-do the whole RBAC list re-population later on.
Who has access to what is defined in the following table: items_roles_permissions. 
You could initially load this table by running the following scripts bellow. 
https://stackoverflow.com/a/58009983/65706

    # populate the list of tables into the meta_tables table
    psql -d dev_qto < /src/sql/pgsql/scripts/admin/populate-meta_tables.sql
    
    # populate the items roles_permissions
    psql -d dev_qto < src/sql/pgsql/scripts/admin/populate-items_roles_permissions.sql

## 12. KNOWN ISSUES AND WORKAROUNDS


    

#### 12.1. The RBAC based native authorisation
The RBAC based native authentication works as follows:
 - during start-up or meta-data reload the Guardian component saves the RBAC list into the Redis
 - the User requests a resource from the System
 - The Guardian component takes the role claims from the Users JWT
 - The Guardian component builds the role-page resource id and checks that it exists from the RBAC list in Redis
 - if the request role-page resources id exists the Guardian passes the User to fetch the resource
 - if the request role-page resource id DOES NOT exist : 
    -- the Guardian redirects the user to the login page if the user is not authenticated
    -- the Guardian redirect the user to the search / home pager if the user is authenticated

    

### 12.1. All tests fail with the 302 error
 This one is actually a bug ... all the tests not requiring non-authentication mode should set it in advance ...

    # disable authentication during testing
    export QTO_NO_AUTH=1
    
    # call the test once again
    perl src/perl/qto/t/lib/Qto/Controller/TestHiCreate.t

### 12.2. Morbo is stuck


    

#### 12.2.1. Probable root cause
This one occurs quite often , especially when the application layer is restarted, but the server not 

    # the error msg is 
     [INFO ] 2018.09.14-10:23:14 EEST [qto][@host-name] [4426] running action :: mojo-morbo-start:doMojoMorboStart
    (Not all processes could be identified, non-owned process info
     will not be shown, you would have to be root to see it all.)
    tcp        0      0 0.0.0.0:3001            0.0.0.0:*               LISTEN      6034/qto
    tcp        0      0 0.0.0.0:3002            0.0.0.0:*               LISTEN      7626/qto
    Can't create listen socket: Address already in use at /usr/local/share/perl/5.26.0/Mojo/IOLoop.pm line 130.
     [INFO ] 2018.09.14-10:23:16 EEST [qto][@host-name] [4426] STOP FOR qto RUN with:
     [INFO ] 2018.09.14-10:23:16 EEST [qto][@host-name] [4426] STOP FOR qto RUN: 0 0 # = STOP MAIN = qto
    qto-dev ysg@host-name [Fri Sep 14 10:23:16] [/vagrant/opt/csitea/qto/qto.0.4.9.dev.ysg] $

#### 12.2.2. Kill processes
List the running perl processes which run the morbo and kill the instances

    ps -ef | grep -i perl
    
    # be carefull what to kill 
    kill -9 <<proc-I-know-is-the-one-to-kill>>

#### 12.2.3. Problem description
This one occurs quite often , especially when the application layer is restarted, but the server not 

    # the error msg is 
     [INFO ] 2018.09.14-10:23:14 EEST [qto][@host-name] [4426] running action :: mojo-morbo-start:doMojoMorboStart
    (Not all processes could be identified, non-owned process info
     will not be shown, you would have to be root to see it all.)
    tcp        0      0 0.0.0.0:3001            0.0.0.0:*               LISTEN      6034/qto
    tcp        0      0 0.0.0.0:3002            0.0.0.0:*               LISTEN      7626/qto
    Can't create listen socket: Address already in use at /usr/local/share/perl/5.26.0/Mojo/IOLoop.pm line 130.
     [INFO ] 2018.09.14-10:23:16 EEST [qto][@host-name] [4426] STOP FOR qto RUN with:
     [INFO ] 2018.09.14-10:23:16 EEST [qto][@host-name] [4426] STOP FOR qto RUN: 0 0 # = STOP MAIN = qto
    qto-dev ysg@host-name [Fri Sep 14 10:23:16] [/vagrant/opt/csitea/qto/qto.0.4.9.dev.ysg] $

### 12.3. The page looks broken - probably the new css is not re-loaded
This problem is quite oftenly experienced and a real time-burner, so keep those shortcuts bellow in mind. 
To apply the newest css do a hard reload in Chrome with the shortcut COMMAND + SHIFT + R.
The other option is to keep the SHIFT button and press the reload button the Chrome address bar ( this one has been buggy from time to time as well. ... )

    COMMAND + SHIFT + R
    SHIT + CLICK ON RELOAD BUTTON

### 12.4. The vue UI does not update properly 
Due to the vue reactivity system - basically the more the complex the ui control, the better to have some kind of id to set in the v-for ... 

    <div v-for="item in filteredItems" :key="item.id">
    
    // use also in every CRUD operation ...
    this.$forceUpdate()
    // or even 
    this.$parent.$forceUpdate()

### 12.5. NginX fails with 502 Bad Gateway error and probably crashes the site
Might be due to the following error found in the journal log: 
"nginx.service: Failed to parse PID from file /run/nginx.pid: Invalid argument"

    sudo mkdir /etc/systemd/system/nginx.service.d
    printf "[Service]\
    ExecStartPost=/bin/sleep 0.1\
    " | \
        sudo tee /etc/systemd/system/nginx.service.d/override.conf
    sudo systemctl daemon-reload
    sudo systemctl restart nginx

### 12.6. Why having all the hassle with this directory structure - is overkill ?!!
Every software project has a scope. Qto as a project aims to provide the fully vertically integrated code base for deployment, operation and maintenance, which is not possible without the use of multiple run-times within the project ( such as bash, perl, python, terraform, npm ... )
Having a project with a directory structure for a specific run-time enforcing that directory structure to all the other runtimes is a a mess.

    

## 13. FAQ
This section contains the most probable frequently asked questions.

    

