#creating_a rds server for database

resource "aws_db_instance" "prj2_mysql" {
  allocated_storage    = 10
  db_name              = "terraform_db"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "terraform"
  password             = "tejaswi123"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
