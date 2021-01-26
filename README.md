**Users**

BASE URL
   
    http://127.0.0.1:3000/api/v1/users
Show All Users
> GET
> Sample Response
 ```json
{
  "status": "SUCCESS",
  "message": "Loaded users",
  "data": [
    {
      "id": 1,
      "nama": "alawy",
      "nomorHp": "08198721313",
      "status": 0,
      "created_at": "2021-01-25T12:09:27.081Z",
      "updated_at": "2021-01-25T12:09:27.081Z"
    }
  ]
}
```
Create New User
> POST
> Header 	: Conten-Type : application/json
> Sample Request
```json
{
   "nama": "alawy",
   "nomorHp": "08198721313"
}
```
> Sample Response
```json
{
  "status": "SUCCESS",
  "message": "user saved",
  "data": {
    "id": 1,
    "nama": "alawy",
    "nomorHp": "08198721313",
    "status": 0,
    "created_at": "2021-01-25T12:09:27.081Z",
    "updated_at": "2021-01-25T12:09:27.081Z"
  }
}
```
Delete User
> GET
> `http://127.0.0.1:3000/api/v1/users/:idUser`
> Sample Response
```json
{
  "status": "SUCCESS",
  "message": "User deleted",
  "data": {
    "id": 1,
    "nama": "alawy",
    "nomorHp": "08198721313",
    "status": 0,
    "created_at": "2021-01-25T12:09:27.081Z",
    "updated_at": "2021-01-25T12:09:27.081Z"
  }
}
```
Set User Online
> GET
> `http://127.0.0.1:3000/api/v1/users/:idUser/online`
> Sample Response
```json
{
  "status": "SUCCESS",
  "message": "User online",
  "data": {
    "status": 1,
    "id": 2,
    "nama": "alawy",
    "nomorHp": "08198721313",
    "created_at": "2021-01-26T15:45:49.914Z",
    "updated_at": "2021-01-26T15:46:05.784Z"
  }
}
```
Set User Offline
> GET
> `http://127.0.0.1:3000/api/v1/users/:idUser/offline`
> Sample Response
```json
{
  "status": "SUCCESS",
  "message": "User offline",
  "data": {
    "status": 0,
    "id": 2,
    "nama": "alawy",
    "nomorHp": "08198721313",
    "created_at": "2021-01-26T15:45:49.914Z",
    "updated_at": "2021-01-26T15:46:05.784Z"
  }
}
```

