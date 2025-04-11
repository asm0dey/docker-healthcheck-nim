import httpclient, os, strutils

proc main() =
  if paramCount() < 1:
    stderr.writeLine("No URL provided")
    quit(1)

  let url = paramStr(1)
  var client = newHttpClient()

  try:
    let response = client.request(url, httpMethod = HttpGet)
    echo "Status code is ", response.status
    quit(if response.status.startsWith("200"): 0 else: 1)
  except Exception as e:
    stderr.writeLine("Error: ", e.msg)
    quit(1)

main()
