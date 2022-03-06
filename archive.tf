data "archive_file" "zip_dir" {
  count = var.source_dir != null ? 1 : 0

  type        = var.archive_type
  source_dir  = var.source_dir
  output_path = var.output_path
  excludes    = var.exclude_files
}
