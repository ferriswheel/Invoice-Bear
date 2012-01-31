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

You will need to have [MySql server](http://dev.mysql.com/downloads/mysql/) + [client](http://dev.mysql.com/downloads/mysql/) installed on your machine before proceeding. **YOU MUST HAVE YOUR ROOT MYSQL USER NOT REQUIRE A PASSWORD!**

Additionally, if you are working off a fresh Ubuntu install you will need to install the MySql ruby and client libraries. Fire up the good 'ole terminal and paste in:

    sudo apt-get install libmysql-ruby libmysqlclient-dev

cd in to the Invoice-Bear application, and run

    bundle install

Once that is successful, create & migrate your database

    rake db:create

    rake db:migrate

