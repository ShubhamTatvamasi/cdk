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

Generate cloud formation template: 
```bash
cdk synth
```

Deploy the code:
```bash
cdk deploy
```
