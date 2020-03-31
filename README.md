# Rocket_Elevators_Controllers
Week 7

Site is now online at http://fellixdallaire.ca/. Rails, mySQL and postgreSQL was used to make this possible.

Admin :     admin@hotmail.com/////123456 
Basic User:       user@hotmail.com/////123456

1- Create the postgres database : rake dataTransfert:create_psql_db
2- Create the tables :            rake dataTransfert:create_pg_table
3- Load the data of the old table :  rake dataTransfert:transfer_for_fact
4- Load the new table with data :  rake dataTransfert:newTableData

Steps to test the API:
/!\ There is already and admin account. For the test, I would suggest to also create an user account to test the authorization.
# twilio
    1- Connect to an admin account.
    2- Go to felixdallaire.ca/admin/elevator.
    3- Choose any elevator and change his status to 'intervention'.
    4- Save and wait for the text message.

# Google Map 
    1- Connect to an user account.
    2- Go to felixdallaire.ca/map.
        *you shouldn't be able to access the page.
    3- Connect to an admin account
    4- Go to felixdallaire.ca/map.
        *you should see a map with all of our customer's building.
        *If the map doesnt appear maybe just try to reload the page.

# Sendgrid
    1- Go to any page (like index)
    2- Fill the contact us form at the bottom.
    3- You should receive an email.
        /!\ Be sure to check your spam folder, trash folder, publicity folder, ... in your mail.

# slack
    1- Connect to an admin account.
    2- Go to felixdallaire.ca/admin/elevator.
    3- Choose any elevator and change its status.
    4- save and you will see a message on this channel of slack: #elevator_operations 
    Appname: ApiTeam5
# Dropbox
    1- Connect to an admin account.
    2- Go to felixdallaire.ca
    3- send a message + attachement via CONNECT section
    4- Go to felixdallaire.ca/admin/Customer and create a new customer with the same EMAIL address
    5- On Dropbox a new folder will be created under the name of the new customer, which include the previously attached file
    Dropbox Account (Email: shahrivari60@gmail.com  / Pass: 123456 / Appname: ApiTeam5)
        **Note 
            The added file has no content. there is still some problem in Active-storage configuration
            These steps are working on local. 

# Zendesk
    1- Go to any page (like index)
    2- Fill the contact us form at the bottom. Or go to the submission page and fill a submission form.
    3- Then access our Zendesk account online at https://www.zendesk.com/login/
    4- Use the credentials already sent to the client
    5- Access the "Views" page to check out the received tickets