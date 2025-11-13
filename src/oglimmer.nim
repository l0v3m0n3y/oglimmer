import asyncdispatch, httpclient, json, strutils, uri

const api = "https://math.oglimmer.de/v1"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36",
    "Host": "math.oglimmer.de",
    "Accept": "application/json"
})

proc calculate_expression*(expression: string, variables: string = ""): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  
  var url = api & "/calc?expression=" & encodeUrl(expression)
  
  if variables != "":
    url &= "&" & encodeUrl(variables)
  
  try:
    let response = await client.get(url)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc simplify_expression*(expression: string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  
  let url = api & "/simplify?expression=" & encodeUrl(expression)
  
  try:
    let response = await client.get(url)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc solve_equation*(equation: string, variable: string = "x"): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  
  var url = api & "/solve?equation=" & encodeUrl(equation)
  url &= "&variable=" & encodeUrl(variable)
  
  try:
    let response = await client.get(url)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc derivative*(expression: string, variable: string = "x"): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  
  var url = api & "/derivative?expression=" & encodeUrl(expression)
  url &= "&variable=" & encodeUrl(variable)
  
  try:
    let response = await client.get(url)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc integral*(expression: string, variable: string = "x"): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  
  var url = api & "/integral?expression=" & encodeUrl(expression)
  url &= "&variable=" & encodeUrl(variable)
  
  try:
    let response = await client.get(url)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc factor_expression*(expression: string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  
  let url = api & "/factor?expression=" & encodeUrl(expression)
  
  try:
    let response = await client.get(url)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
