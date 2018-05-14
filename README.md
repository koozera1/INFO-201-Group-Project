# INFO201 Group Project:
#  Title : **Crime Data in Los Angeles 2010-Present**
##### Group members: Andrea Koozer, Mustafa Ahamed, Jill Nguyen, Joy Liu


### Project Statement
For our group project, we will be working with the dataset called **Crime Data from 2010 to Present**. We access the dataset at this  [_Data.Gov_](https://catalog.data.gov/dataset/crime-data-from-2010-to-present) website and it is a non-Federal dataset.
 The data is provided by the _local government_ of Los Angeles and was transcribed from crime reports that were written on paper. This means that there may be some inaccuracies within the data. Our main target audience are government officials, however we also want to provide useful information for those who reside in Los Angeles and people who are planning to move to or live in the city. Government officials would mainly be interested in the location of the various crimes and whether the crime frequency is decreasing or increasing.

 The data contains general information such as the date the crime occurred, date the crime was reported, victim's age, victim's gender, location of the crime, etc. Through our project, we want our audience to learn more about crime in Los Angeles:
- Has the number of crimes increased with time?
- Are more victims male or female? And does that change over time?
- Which weapons are used in these crimes? And does this change over time?

### Tackling the issue
We will start our project by reading the Comma Separated Values File (csv file) of the dataset provided by the website. In order to make the data easier to use and decrease the file size, we must select the columns that we wish to use and save the dataset as a new file. This will help decrease the loading time. In addition, we can reshape the dataset to only include the rows where there are no missing data points. We will be using various libraries such as shiny and ggplot2 in order to help build our project. I anticipate that it will be a challenge to load the file onto GitHub due to the large size of the dataset. In addition, as our group starts working at different times we will most likely face a lot of merge conflicts.
