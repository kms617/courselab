== README

This is a project for a simple library of online course material. Users can view a collection of courses and add to that collection. The project was built using Ruby 2.1.2 with postgresql for the database.

The CSS used for the card layout is modified from that of Dudley Storey at demosthenes.info, you can view it on Code Pen at: http://codepen.io/dudleystorey/pen/yqrhw

----

User Stories

As a User, I can view a collection of on-line tutorials for MATLab and Simulink. On the index page, I can see a card layout with the course title, image (or default image) and a short description. If I click on the image or title, I can see the specifics of the course.

As a User, I can view the specifics of a course on its own page. I can see the course title, image, url, source, and full description.

As a User, I can also submit a new course. I will be prompted to enter its title, image, url, source and description. If I submit a complete form, I will be alerted that my course has been successfully submitted. If I submit an incomplete form or a form with errors, I will be prompted to correct those errors.

As a User, I can search the title, source and description of all the courses on the site for key terms. Upon searching, I will be provided with an index of the courses that fit my search terms.

----

ER Diagram
```
 +-------------------------+ 
 |  Courses                | 
 +-------------------------+ 
 |  name, :string, NF      | 
 |  url, :string, NF       | 
 |  source, :string, NF    | 
 |  description, :text, NF | 
 |  image, :text, default  | 
 |                         | 
 |  time stamps            | 
 |                         | 
 |  index_name             | 
 |  index_url              | 
 +-------------------------+ 

```
---
```

# To Do (time permitting):
* add edit and delete options to the courses
* add an option to enter an image url
* create more unique css styling
* make design responsive

```
---
