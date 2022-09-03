
import ./scorper/http/streamserver
import ./scorper/http/httprequest
import ./scorper/http/streamclient
import ./scorper/http/httpcore, chronos
import os
import asynctest, strformat
include ./cert

const source = staticRead(currentSourcePath.parentDir / "range.txt")

var server: Scorper

suite "test send file with https":
  setup:
    let address = "127.0.0.1:0"
    server = newScorper(address, default(ScorperCallback), isSecurity = true,
    privateKey = HttpsSelfSignedRsaKey,
    certificate = HttpsSelfSignedRsaCert)
    server.start()
  teardown:
    server.stop()
    server.close()
    await server.join()
  test "testSendFIle":
    proc handler(request: Request) {.async.} =
      await request.sendFile(currentSourcePath.parentDir / "range.txt")
    server.setHandler handler
    proc request(server: Scorper): Future[AsyncResponse] {.async.} =
      let
        client = newAsyncHttpClient()
      let testUrl = fmt"https://127.0.0.1:{server.local.port}"
      let clientResponse = await client.request(testUrl)
      await client.close()

      return clientResponse

    let
      response = await request(server)
      body = await response.readBody()
    doAssert(response.code == Http200)
    doAssert body == source

