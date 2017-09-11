import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

public class Model2 {
	
	List<Memo> list;
	
	private static final String ROOT = "D:\\androidSchool4\\workspace\\file";
	private static final String FILE_NAME = "text.txt";
	private static final String INDEX_COUNT = "index.txt";
	private static final String SEP = "::";
	private int count = 0;
	
	File tempFile = new File(ROOT+"\\"+FILE_NAME);
	File indexFile = new File(ROOT+"\\"+INDEX_COUNT);
	
	// 추가
	public void add(Memo memo) {
		
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
		
		setCount();
		addCount();
		
		// byte로 만들기 위해 String 변환
		String oneLine = count+SEP+memo.title+SEP+memo.content+SEP+memo.date+"\n";
		
		// 만든 파일에 oneLine 값 넣어주기
		try {
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(tempFile, true)));
			bw.append(oneLine);
			bw.flush();	// 
			bw.close();
		} catch(Exception e) {
			
		}	
	}
	
	// 전체 조회
	public List<Memo> read(){
		if(list != null)
		list.clear();
		list = new ArrayList<>();

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
		return list;
	}

	public Memo getOne(int index) {
		if(list == null) read();
		
		Memo temp = null;
		for(Memo memo : list) {
			if(memo.no == index) {
				temp = memo;
			}
		}
		return temp;
	}
	
	public void addCount() {
		
		// 파일이 없다면 생성
		if(!indexFile.exists()) {
			try {
				indexFile.createNewFile();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}

		// 파일을 새로 생성하므로 초기화 된 값 +1
		count++;
	
		// 저장소 수정
		try {
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(indexFile)));
			bw.write(count+"");
			bw.flush();
			bw.close();
		} catch(IOException e) {
			
		}
	}
	
	public void setCount() {
		// 아무 값도 입력되지 않은 상황이 아니라면 count 값을 저장소의 값으로 초기화 해 준다
		if(indexFile.exists()) {
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
		}
	}
}
