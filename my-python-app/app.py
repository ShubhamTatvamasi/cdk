#!/usr/bin/env python3

import aws_cdk as cdk

from my_python_app.my_python_app_stack import MyPythonAppStack


app = cdk.App()
MyPythonAppStack(app, "MyPythonAppStack")

app.synth()
