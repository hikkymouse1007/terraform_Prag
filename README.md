# terraform_Prag
ver1.4に書き換えたもの

## 2.3
環境変数の設定

```
provider "aws" {
  access_key = "XXXXXX"
  secret_key = "YYYYYYYYYYY"
  region     = "ap-northeast-1"
}
```

## 3.2.2　注意点
リソースの一部を変更すると、インスタンスが破棄され、
新しいインスタンスになることがあるので、
terraform planで変更されるリソースを確認すること。

## 3.3　variable
変数は、terraform.tfvarsに定義した環境変数を
他のファイル(vars.tf)から呼び出すことも可能。

```
.
├── main.tf
---
variable "example_instance_type" {
  default = "t3.micro"
}

resource "aws_instance" "example" {
  ami = "ami-0f9ae750e8274075b"
  instance_type = var.example_instance_type
}

---
├── provider.tf
---
provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_REGION
}
---
├── terraform.tfvars
---
AWS_ACCESS_KEY = "XXXXXXXXXXXXXXXXXXXXX"
AWS_SECRET_KEY = "YYYYYYYYYYYYYYYYYYYYYYYY"
AWS_REGION     = "ap-northeast-1"
---
└── vars.tf
---
variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
}
---
```

3.4.2条件分岐
環境変数によってデプロイするデータを変更可能

```
terraform plan -var 'env=prod'
terraform plan -var 'env=dev'
```

3.7.2 module

```
├── http_server
│ └── main.tf (module)
└── main.tf (file using module)
```

terraform getを実行するとmodules.jsonが作成される

```
$terraform get

.
├── .terraform
│   └── modules
│       └── modules.json
├── http_server
│   └── main.tf
├── main.tf
├── provider.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── terraform.tfvars
├── vars.tf
└── version.tf
```
