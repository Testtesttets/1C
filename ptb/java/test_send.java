OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{\r\n\"PlatformVersion\": \"8.3.18.1128\",\r\n\"UserName\": \"admin\",\r\n\"Description\": \"���� ������� ���������� ��� ������ (����������)\",\r\n\"NumberRow\": \"5\",\r\n\"SourceString\": \"���������� = ������������;\",\r\n\"ModuleName\": \"web2 ���������.�����������������������.�����.�����.�����\",\r\n\"Client\": \"Client\"\r\n}");
Request request = new Request.Builder()
  .url("http://localhost:8532/hs/webroot/fortest")
  .method("POST", body)
  .addHeader("Authorization", "Basic YWRtaW46")
  .addHeader("Content-Type", "application/json")
  .build();
Response response = client.newCall(request).execute();