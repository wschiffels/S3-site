<html>
  <head>
    <title>Hello Rubarb</title>
  </head>
<body>
  Hello Rubarb.

  => We're running on environment: ${environment}.</br>
  => The URL is https://${sanatized_bucket_name}.${aws-region}.amazonaws.com<br>
  => The Bucket is %{ if enable_bucket_encryption == "true" }encrypted%{ else }not encrytped%{ endif }.</br>
  => Logging is %{ if enable_logging == "true" }enabled%{ else }not enabled%{ endif }.</br>
  => Versioning is %{ if enable_versioning == "true" }enabled%{ else }not enabled%{ endif }.</br>
  => The sanitized bucket name is: ${sanatized_bucket_name}</br>
  => %{ if enable_logging == "true" }The logging bucket name is: ${sanatized_logging_bucket_name}%{ endif }
  </br>
  ¯\_(ツ)_/¯
</body>
</html>

