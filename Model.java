import java.util.ArrayList;
import java.util.List;

public class Model {
	
	public static List<Memo> data = new ArrayList<>();
	
	
	// 추가
	public void add(Memo memo) {
		data.add(memo);
	}
	
	// 조회
	public Memo getOne(int index) {
		Memo temp = null;
		for(Memo memo : data) {
			if(memo.no == index) {
				temp = memo;
			}
		}
		return temp;
	}
	
	// 전체 조회
	public List<Memo> getAll(){
		return data;
	}
	
	// 삭제
	public void delete(Memo memo) {
		data.remove(memo);
	}
	

}
