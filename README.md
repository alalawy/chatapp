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
> DELETE
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



**Conversation**

BASE URL
   
    http://127.0.0.1:3000/api/v1/conversation
Show All Conversation
> GET
> Sample Response
 ```json
{
  "status": "SUCCESS",
  "message": "Loaded conversations",
  "data": [
    {
      "id": 10,
      "idCreator": "1",
      "idReceiver": "9",
      "created_at": "2021-01-25T16:03:03.159Z",
      "updated_at": "2021-01-25T16:03:03.159Z"
    },
  ]
}
```
Create New Conversation
> POST
> Header 	: Conten-Type : application/json
> Sample Request
```json
{
   "idCreator": 5,
   "idReceiver": 1
}
```
> Sample Response
```json
{
  "status": "SUCCESS",
  "message": "conversation saved",
  "data": {
    "id": 5,
    "idCreator": "5",
    "idReceiver": "1",
    "created_at": "2021-01-25T13:10:55.372Z",
    "updated_at": "2021-01-25T13:10:55.372Z"
  }
}
```
Delete Conversation
> DELETE
> `http://127.0.0.1:3000/api/v1/conversation/:idConversation`
> Sample Response
```json
{
  "status": "SUCCESS",
  "message": "Conversation deleted",
  "data": {
    "id": 1,
    "idCreator": "2",
    "idReceiver": "3",
    "created_at": "2021-01-25T13:09:48.046Z",
    "updated_at": "2021-01-25T13:09:48.046Z"
  }
}
```
Get User Conversation
> GET
> `http://127.0.0.1:3000/api/v1/conversation/user_conversation/:idUser`
> Sample Response
```json
{
  "status": "SUCCESS",
  "message": "Loaded conversation",
  "data": [
    {
      "id": 4,
      "idCreator": "2",
      "idReceiver": "4",
      "created_at": "2021-01-25T13:10:11.362Z",
      "updated_at": "2021-01-25T13:10:11.362Z"
    },
    {
      "id": 6,
      "idCreator": "1",
      "idReceiver": "2",
      "created_at": "2021-01-25T15:54:30.851Z",
      "updated_at": "2021-01-25T15:54:30.851Z"
    }
  ]
}
```



**Messages**

BASE URL
   
    http://127.0.0.1:3000/api/v1/messages
Show Message List
> GET
> `http://127.0.0.1:3000/api/v1/messages/list/:idConversation`
> Sample Response
 ```json
{
  "status": "SUCCESS",
  "message": "Loaded message",
  "data": [
    {
      "id": 2,
      "idConversation": "2",
      "idSender": "1",
      "message": "hi, david disini",
      "messageType": "Text",
      "status": 1,
      "created_at": "2021-01-25T15:34:55.498Z",
      "updated_at": "2021-01-26T11:35:41.547Z"
    },
    {
      "id": 1,
      "idConversation": "2",
      "idSender": "1",
      "message": "hi, david disini",
      "messageType": "Text",
      "status": 1,
      "created_at": "2021-01-25T15:31:45.918Z",
      "updated_at": "2021-01-26T11:35:42.556Z"
    }
  ]
}
```
Send Message Without Auto Check Conversation
> POST
> `http://127.0.0.1:3000/api/v1/messages/sendmessage`
> Header 	: Conten-Type : application/json
> Sample Request
```json
{
   "idConversation": 10,
   "idSender": 1,
   "message" : "hi, ars disini"
}
```
> Sample Response
```json
{
  "status": "SUCCESS",
  "message": "message sent",
  "data": {
    "id": 14,
    "idConversation": "10",
    "idSender": "1",
    "message": "hi, ars disini",
    "messageType": "Text",
    "status": 0,
    "created_at": "2021-01-26T11:41:27.752Z",
    "updated_at": "2021-01-26T11:41:27.752Z"
  }
}
```
Send Message With Auto Check Conversation
> POST
> `http://127.0.0.1:3000/api/v1/messages/sendmessageauto`
> Header 	: Conten-Type : application/json
> Sample Request
```json
{
   "idSender": 1,
   "idReceiver": 9,
   "message" : "hi, ars disini"
}
```
> Sample Response
```json
{
  "status": "SUCCESS",
  "message": "message sent",
  "data": {
    "id": 14,
    "idConversation": "10",
    "idSender": "1",
    "message": "hi, ars disini",
    "messageType": "Text",
    "status": 0,
    "created_at": "2021-01-26T11:41:27.752Z",
    "updated_at": "2021-01-26T11:41:27.752Z"
  }
}
```
Delete Message
> DELETE
> `http://127.0.0.1:3000/api/v1/messages/:idMessage`
> Sample Response
```json
{
  "status": "SUCCESS",
  "message": "Message deleted",
  "data": {
    "id": 1,
    "idConversation": "2",
    "idSender": "1",
    "message": "hi, david disini",
    "messageType": "Text",
    "status": 1,
    "created_at": "2021-01-25T15:31:45.918Z",
    "updated_at": "2021-01-26T11:35:42.556Z"
  }
}
```
Get Unread Message Count
> GET
> `http://127.0.0.1:3000/api/v1/messages/unread/:idConversation/:idUser`
> Sample Response
```json
{
  "status": "SUCCESS",
  "message": "unread message count",
  "data": 1
}
```
Set Unread Message to Read
> GET
> `http://127.0.0.1:3000/api/v1/messages/read/:idConversation/:idUser`
> Sample Response
```json
{
  "status": "SUCCESS",
  "message": "read message",
  "data": 1
}
```
