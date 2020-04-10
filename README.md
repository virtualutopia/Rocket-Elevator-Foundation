# Rocket_Elevators_Controllers
Week 9 - Consolidation

Site is now online at https://faridrocket.com/.

Admin,  role: employee :    admin@hotmail.com/////111111 (6 times 1)
User,   role: user :        user@hotmail.com/////111111  (6 times 1)

# Intervention page
The intervention section is only accessible to the "employees". So please login with Admin Email to check this page.
you may want to check the intevention form in the code at app>views>intervention>_form.html.rb
related controller is at app>controller>interventions_controller.rb
Here are the main part of this section:
- A new scaffold for interventions (model, views and controller)
- A new form based on the requirements
- Cascade menue style in the form


Steps to test the API:
/!\ There is already and admin account. For the test, I would suggest to also create an user account to test the authorization.
# Zendesk
    1- log in as an employee using admin credentials (provided above)
    2- Fill a new intervention form at https://faridrocket.com/interventions/new
    3- Then access our Zendesk account online at https://www.zendesk.com/login/
    4- Use the credentials already sent to the client
    5- Access the "Views" page to check out the received tickets

# REST API
    There is a separate GitHub repository for this API at https://github.com/virtualutopia/Rocket-Elevator-Foundation-RESTapi.git
    
    The requested requirements for managing interventions are: 
    1- Retrieving list of pending intervention using  => 
    GET:  https://restapirocketelevator.azurewebsites.net/api/intervention/pending 

    2- Changing the status of a specific intervention to “Inprogress” using => 
    PUT: https://restapirocketelevator.azurewebsites.net/api/intervention/Inprogress/{id}
    Just put an empty {} in the body. The start date and status will be updated; 

    3- Changing the status of a specific intervention to “Completed” using => 
    PUT: https://restapirocketelevator.azurewebsites.net/api/intervention/ completed /{id}
    Just put a {} in the body. The end date and status will be updated; 


    You may  also have the following option 

    -  List of interventions using => GET…/api/intervention; 

    - Delete a specific intervention using => DELETE …/api/intervention/{id} 




Should you need any further information, do not hesitate to contact me.
Farid 