# cdk

Create new folder:
```bash
mkdir my-python-app
cd my-python-app
```

initialize the cdk: 
```bash
cdk init sample-app --language python
```

Activate the virtual environment:
```bash
source .venv/bin/activate
```

Install the required packages:
```bash
pip3 install -r requirements.txt
```

Generate cloud formation template: 
```bash
cdk synth
```

Deploys the CDK toolkit stack into an AWS environment:
```bash
cdk bootstrap
```

Compares the specified stack with the deployed:
```bash
cdk diff
```

Deploy the stack:
```bash
cdk deploy
```

Destroy the stack:
```bash
cdk destroy
```

---

Cleanup CDK deployment from AWS:
```bash
./cleanup.sh default ap-south-1
```
