# Classroom Registration

1. Download and install Rails:
   http://railsinstaller.org/en

2. Clone the project
3. Open CMD en cd to the project
4. bundle install
5. rake db:migrate
6. rails s
7. For now: http://localhost:3000/calendars

#JSON

Sign up (/users) [POST]:
{
	"user": {
		"email": "0861020@hr.nl",
		"password": "Test1324",
		"password_confirmation": "Test1324"
	}
}