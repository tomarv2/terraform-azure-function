

# Function Basics:

Create Project -> Create Function (use VScode)
Files generated when you create a project:

- `directory` with the Function name
- `host.json`: Lets you configure the Functions host. These settings apply when you're running functions locally and when you're running them in Azure. For more information, see host.json reference.

- `local.settings.json`: Maintains settings used when you're running functions locally. These settings are used only when you're running functions locally. For more information, see Local settings file.
- proxies.json
- requirements.txt

- Run the function by pressing F5 to is to ensure its working.

If you navigate to: `http://localhost:7071/api/helloworld-httpTrigger?name=Functions` it should respond with `Hello Functions`


## References:

- https://docs.microsoft.com/en-us/azure/azure-functions/functions-develop-vs-code?tabs=csharp#generated-project-files

- https://docs.microsoft.com/en-us/azure/azure-functions/functions-reference-python

- https://docs.microsoft.com/en-us/samples/azure-samples/azure-functions-python-list-resource-groups/azure-functions-python-sample-list-resource-groups/
