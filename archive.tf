data "archive_file" "zip" {
  type        = var.archive_type
  source_dir  = var.source_file
  output_path = var.output_file_path
}

