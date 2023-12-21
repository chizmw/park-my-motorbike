# create a DocumentDB in AWS
resource "aws_docdb_cluster" "cluster" {
  cluster_identifier      = "${local.app_slug}-cluster"
  engine                  = "docdb"
  master_username         = "docdbadmin"
  master_password         = random_password.password.result
  backup_retention_period = 5
  preferred_backup_window = "03:00-06:00"


  lifecycle {
    create_before_destroy = true
    ignore_changes        = [master_password]
  }
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "${local.app_slug}-instance-${count.index}"
  cluster_identifier = aws_docdb_cluster.cluster.id
  instance_class     = "db.t3.medium"
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
