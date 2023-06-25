

Run below AWS CLI Command to enter number of items you want to create:

Example:

aws dynamodb put-item \
    --table-name <table-name> \
    --item '{
        "id": {"N": "1"},
        "EmployeeID": {"N": "1001"},
        "EmployeeName": {"S": "John Doe"},
        "Status": {"S": "Active"},
        "Level": {"S": "L1"}
    }'

To verify if above item is copied inside your table. Run below command:

aws dynamodb scan --table-name <table-name>