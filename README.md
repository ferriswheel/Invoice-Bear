# InvoiceBear 

InvoiceBear allows freelancers, independent contractors, and small businesses the ability to create and manage their invoices. InvoiceBear provides an affordable way for business to track their paid, unpaid, and overdue invoices all online, without the hassle of storing various files locally.

So whatcha waitin' for?? Lets get this application installed on your local machine. 

### Installation

Please make sure that you have Git installed, as well as Ruby 1.9.2 or higher

To install the appliation on your local machine and create a local repository:

    git clone git@github.com:kcollignon/Invoice-Bear.git

This will create a working directory of files in your present directory. Then go in to the folder created:

    cd Invoice-Bear

### Configuring MySql Database

You will need to have [MySql server](http://dev.mysql.com/downloads/mysql/) + [client](http://dev.mysql.com/downloads/mysql/) installed on your machine before proceeding. 

**YOU MUST HAVE YOUR ROOT MYSQL USER NOT REQUIRE A PASSWORD!**

Additionally, if you are working off a fresh Ubuntu install you will need to install the MySql ruby and client libraries. Fire up the good 'ole terminal and paste in:

    sudo apt-get install libmysql-ruby libmysqlclient-dev

cd in to the Invoice-Bear application, and run

    bundle install

Once that is successful, create & migrate your database

    rake db:create

    rake db:migrate

The first command will create 3 MySql databases (invoicebear_production, invoicebear_test, invoicebear_dev) each for their respective environment. The second command will run the rails database migrations to bring your databases to the current state.

### Starting and Stopping the application

cd in to your Invoice-Bear directory, and run

    rails server

This will startup the Webrick web server on port 3000. You can now access the application at

    http://localhost:3000

To stop the rails server, go back in to terminal and press *CTRL + C*

### Committing Changes & Pulling New Code

When working with a team of developers, it is good to establish a good workflow for pulling/pushing code. These basic steps are the workflow for using Git:

1. Check for any un-pulled code

    git fetch

2. Reset your working files to include the new code

    git rebase origin/master

3. Add Changes to Git

    git add .

4. Commit with a message of what you did

    git commit -m "Message about what was changed"

5. Push to central repository on GitHub

    git push origin

