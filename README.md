# Board_MVC_Files
MVC 패턴으로 구현, Files 저장소 게시판


#### Files 초기 정보

```java
private static final String ROOT = "D:\\androidSchool4\\workspace\\file";
private static final String FILE_NAME = "text.txt";
private static final String INDEX_COUNT = "index.txt";
private static final String SEP = "::";
```

#### 디렉토리, 파일 생성
```java
File dir = new File(ROOT);

// 가장 먼저 파일 디렉토리가 있는지 검사하고 없으면 디렉토리를 만든다
if(!dir.exists()) {
	dir.mkdir();
}

// tempFile이 없으면 파일 생성
if(!tempFile.exists()) {
	try {
		tempFile.createNewFile();
	} catch (IOException e) {
		e.printStackTrace();
	}
}
```

#### Write

```java
String oneLine = count+SEP+memo.title+SEP+memo.content+SEP+memo.date+"\n";

// 만든 파일에 oneLine 값 넣어주기
try {
	BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(tempFile, true)));
	bw.append(oneLine);
	bw.flush();	// BF 사용하였기 때문에 flush 해주지 않으면 값이 출력되지 않을 수 있다
	bw.close();
} catch(Exception e) {

}
```

#### Read

```java
try {
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(tempFile)));
		String tempLine = "";
		while((tempLine = br.readLine()) != null) {
			Memo memo = new Memo();
			String[] splitElement = tempLine.split(SEP);
			memo.no = Integer.parseInt(splitElement[0]);
			memo.title = splitElement[1];
			memo.content = splitElement[2];
			memo.date = Long.parseLong(splitElement[3]);
			list.add(memo);
		}
		br.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
```
#### 인덱스는 따로 저장한다

```java
BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(indexFile)));
			bw.write(count+"");
			bw.flush();
			bw.close();
```
```java
try {
		FileInputStream fis = new FileInputStream(indexFile);
		char index = (char) fis.read();
		System.out.println(index);
		String strIndex = Character.toString(index);
		count = Integer.parseInt(strIndex);
		fis.close();
	} catch(IOException e) {
		e.printStackTrace();
	}
```
