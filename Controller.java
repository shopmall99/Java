import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Scanner;

public class Controller {

	private boolean RUN = true;
	
	View view;
	Model2 model;
	Scanner scanner;
	String inputText = "";
	Memo memo;
	int index;
	
	public Controller() {
		view = new View(this);
		model = new Model2();
		scanner = new Scanner(System.in);
	}
	
	public void run() {
		while(RUN) {
			view.intro();
			inputText = scanner.nextLine();
			switch(inputText) {
				case "c": 
				 	memo = view.create();
				 	model.add(memo);
					break;
				case "r":
					index = view.inputMemoIndex();
					memo = model.getOne(index);
					view.showMemo(memo);
					break;
//				case "u":
//					view.update(scanner);
//					break;
				case "d":
					index = view.delete(scanner);
					break;
				case "l":
					List<Memo> data = model.read();
					view.showList(data);
					break;
				case "x":
					view.print("시스템 종료");
					finish();
					break;
			}
		}
		scanner.close();
	}
	
	public int setIndex(List<Memo> list) {
		return list.size()+1;
	}

	// 데이트 format
	public String dateFormat(long date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
		return sdf.format(date);
	}
	
	public void finish() {
		RUN = false;
	}
}
