# Problem Statement
Develop an iOS Application that would let user purchase ticket for boarding Metro at Delhi Metro

# Components

## Backend
[metroBookingBackend | https://github.com/runaalam/metroBooking/tree/master/metroBookingBackend] is the backend skelton server written in Django/Python to return station data using REST endpoints


### How to run
- Go to project directory from command line
- Create a virtual environment and install Django by following command
```	
virtualenv any_name
source any_name/bin/activate
python -m pip install Djang
```  
- Run server
```	
python manage.py runserver
```	

## iOS
[metroBookingSystem | https://github.com/runaalam/metroBooking/tree/master/MetroBookingSystem] is the iOS application

### How to run
- metroBookingBackend must be running by following the above instructions before running the iOS app
- Open the file `MetroBookingSystem.xcworkspace` in xCode and then run the app from the editor.

### Architecture
- The main project is based on MVC pattern
- Delegation pattern is used for reusable views

## Known Issues
Due to time restrctions there are few limitations for this implementation from the proposed spec: 
- The current fare algorithm is not generic and only implemented for the sample data set.
- Push notification is not implemented
