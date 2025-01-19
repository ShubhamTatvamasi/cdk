# cdk

Create new folder:
```bash
mkdir myapp
cd myapp
```

initialize the cdk: 
```bash
cdk init app --language go
```

Download go dependencies:
```bash
go mod tidy
```

Deploys the CDK toolkit stack into an AWS environment:
```bash
cdk bootstrap
```

Generate cloud formation template: 
```bash
cdk synth
```

Deploy the code:
```bash
cdk deploy
```

---

Cleanup CDK deployment from AWS:
```bash
./cleanup.sh default ap-south-1
```
