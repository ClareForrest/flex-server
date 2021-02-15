# Flex-Physio Server
A booking system for a fictional small physiotherapy business completed with one of my Coder Academy co-students - Chris.

## Links 
- Here's a link to our Deployed Website: [Flex Physio](https://flex-physio.netlify.app/)
- Here's a link to our GitHub Repo: [Frontend](https://github.com/ClareForrest/flex-frontend) and 
- GitHub Repo: [Backend](https://github.com/ClareForrest/flex-server)

## Setup Instructions:
**Pre-installation:** Users must have both Rails and React.js installed to run this code
- Clone this repo
- Bundle install to install all required dependencies. 
These are;
  - gem 'stripe'
  - gem 'sendgrid-ruby'
  - gem 'knock'
  - gem 'rspec-rails'
  - gem 'factory_bot_rails' gem 'bcrypt '
  - gem 'byebug'
- Rake db:setup to create local database migrate and seed
- Please ensure your gemfile has the 
- Rails s to run the rails server
- Load http://localhost:3000/ in the browser

**You will also need to complete the setup instructions for the front-end**
The link can be found [here](https://github.com/ClareForrest/flex-frontend)

## Login details:
Employee user:
**Username:** olivia@hotmail.com **Password:** 123456
Client-User:
**Username:** noah@hotmail.com **Password:** 123456

## Developer Journal:
### Management system: Trello:
Link to our [Trello Board](https://trello.com/b/6qhxWy0R/final-assessment)
Clare and Chris utilised an AGILE project management strategy in the production of the site. We frequently employed the use of the Kanban tool Trello in pursuing this strategy.
Trello has a number of features that we utilised, these being;
- The ability to create category columns
- The ability to add in cards under each column Colour coded labels
- Member avatars
- Checklists
- Due Date
- The ability to add Attachments

Category columns allowed us to group tasks under broad categories. Some of the categories we used were, "testing", "working on", "checklist for code", "completed" etc. as well as a general "to do".
Beginning with a general checklist allowed us to easily monitor all tasks that required completion. This contained information on what was not currently being worked on, but required completion. Additionally, the working on category contained work both of us actively worked on and allowed us to track, and easily identify the progress and tasks our respective partner had undertaken.
Beyond this, we had two categories of completed work, one relating to PART B of the assessment, and the other belonging to PART A , which allowed further clarification on progress in developing the application. The final category was future, wherein possible adaptations could be implemented, after the 1.0 launch.
Adding in cards under each column allowed us to create tasks to be completed.
On each of those cards, we utilised the colour coded labels to easily identify tasks classed as "easy", "medium" and "hard" and assigned tasks with the use of the member avatars.
The Trello board also allowed us to create check-lists within each card. This allowed us to measure progress, and easily identify what was being worked on and how that work was progressing. It also ensured we didn't miss anything.
Due Date was also a feature we used quite frequently throughout the development stage. This was helpful in ensuring time sensitive tasks were completed as the Due Date allows for reminders to be sent to the assigned team member via email as well as a visual cue on the board.
We also utilized the ability to add attachments to cards. This was helpful in sharing links and images that each other would need.
    
### Discord:
Outside of Trello, Clare and Chris frequently took advantage of Discord, to discuss work, plan and implement the features of the application in daily stand-ups. Typically we would begin the day by discussing what was being worked on in the morning, and any issues we were having. This process would be repeated throughout various intervals across the day, such as a post-break discussion of what work we would undertake for the rest of the day. Discord provided an invaluable communication tool, that allowed Clare and Chris to collaborate on work and tackle problems together.

### git and GitHub:
Clare and Chris opted for a Feature Branch Workflow using both git and GitHub.
We each created a new feature branch from the most up to date main branch and named it according to the task to be complete/code to be written.
We both agreed to follow the following process;
- pull latest code from git
- create a separate branch for each task
- create a pull request when done
- the OTHER person merge that pull request (so we were not merging our own work). This was in an effort to keeps us across each others work and aware of any conflicts/double ups etc. 
- create a pull request at the end of each day with final work

### Task Delegation:
Clare and Chris separated tasks based on skills strength and on a component by component basis.
In doing this, we aimed to avoid conflicts and other related problems. For instance, during the development of the application, Clare undertook development of distinct components of the Booking system, with the associated front-end and back-end features. Whereas Chris implemented these same features for another area of the application, the Profile system. This allowed both developers to work quickly and effectively.
Similarly, at the end of the development life-cycle, facets of the post-development work were divided in this manner. For instance, Clare undertook creating the stakeholder presentation, to demonstrate the Application and updating the Trello for post-launch updates. 
    
 
## Testing:
Clare and Chris used a combination of testing methods in the development of their application.
Clare used Rspec for backend unit and integration tests and some manual testing was completed by both Chris, Clare and our fictitious Flex-Physio client.
Here are some links to our [Manual Testing Sheets](https://docs.google.com/spreadsheets/d/10eFEz3Vz9W_3WQCIav5fjmle-BqDFeKPGa4Tnuqq1is/edit?usp=sharing)
