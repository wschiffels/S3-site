<html>
  <head>
    <title>Hello Rubarb</title>
  </head>
<body>
  Hello Rubarb.

  We're running on environment: ${environment}.</br>
  The Bucket is %{ if enable_bucket_encryption == "true" }encrypted%{ else }not encrytped%{ endif }.</br>
  Logging is %{ if enable_logging == "true" }enabled%{ else }not enabled%{ endif }.</br>
  Versioning is %{ if enable_versioning == "true" }enabled%{ else }not enabled%{ endif }.</br>
  </br>
  ¯\_(ツ)_/¯
</body>
</html>

