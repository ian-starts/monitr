import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:convert';


class HttpRequestState extends State<HttpRequest> {
  var apiToken = 'cf729296a9771aa58656fb4da93a3306';
//  var apiToken;
  var defaultWorkspaceId;



  var workspaces;
  var projects;


  void authenticate() async{
    // getting api token and default workspace id
    var url = "https://www.toggl.com/api/v8/me";
//    var basicAuth = 'Basic ' + base64Encode(utf8.encode('$userName:$password'));
    var basicAuth = 'Basic ' + base64Encode(utf8.encode('$apiToken:api_token'));

    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: basicAuth,
        HttpHeaders.contentTypeHeader: "application/json"
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var body = json.decode(response.body);
    apiToken = body["data"]["api_token"];
    defaultWorkspaceId = body["data"]["default_wid"];
    workspaces = body["data"]["workspaces"];
  }

  void startExampleTimer() async{
    var url = "https://www.toggl.com/api/v8/time_entries/start";
    var basicAuth = 'Basic ' + base64Encode(utf8.encode('$apiToken:api_token'));

    var description = "test timer";
    var start = "2020-04-06T15:35:47+02:00";
    var projectId = projects[0]["id"];

    var response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: basicAuth,
        HttpHeaders.contentTypeHeader: "application/json"
      },

      body: '{"time_entry":{"description":"$description","created_with":"monitr","start":"$start","wid":$defaultWorkspaceId,"pid":$projectId}}'
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  void getWorkspaceIds() async{
    // for adding multiple workspaces (bit redundant since you get them in authenticate)
    var url = "https://www.toggl.com/api/v8/workspaces";
    var basicAuth = 'Basic ' + base64Encode(utf8.encode('$apiToken:api_token'));

    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: basicAuth,
        HttpHeaders.contentTypeHeader: "application/json"
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    workspaces = json.decode(response.body);
    print(workspaces);
  }

  void getProjects() async{
    // for adding multiple workspaces (bit redundant since you get them in authenticate)
    var url = "https://www.toggl.com/api/v8/workspaces/$defaultWorkspaceId/projects";
    var basicAuth = 'Basic ' + base64Encode(utf8.encode('$apiToken:api_token'));

    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: basicAuth,
        HttpHeaders.contentTypeHeader: "application/json"
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    projects = json.decode(response.body);
    print(projects);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http'),
      ),

      body: Center(
        child: Row(
         children: [
           FlatButton(
             onPressed: (){
              authenticate();
             },
              child: Text(
              "authenticate",
               ),
            ),

           FlatButton(
             onPressed: (){
               getProjects();
             },
             child: Text(
               "projects",
             ),
           ),

           FlatButton(
             onPressed: (){
               startExampleTimer();
             },
             child: Text(
               "set timer",
             ),
           ),
      ]
        )
     )
    );
  }
}

class HttpRequest extends StatefulWidget {
  @override
  HttpRequestState createState() => HttpRequestState();
}