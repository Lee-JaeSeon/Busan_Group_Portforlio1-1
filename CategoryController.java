package view;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;
import application.Message;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.stage.Stage;
import model.DBConnect;
import model.Singleton;

// 메소드 주소  부산진구 카테고리 에 대한 객체를 매개변수로 가지고 있어야하고  db검색할때 ?로 들어가
public class CategoryController implements Initializable {

	@FXML
	private ComboBox<String> Address_ci;

    @FXML
    private ComboBox<String> Address_gu;

    @FXML
    private Button Restaurant;

    @FXML
    private Button Cafe;

    @FXML
    private Button Store;


    @FXML
    void nextResList(ActionEvent event) throws IOException {
    	message();//밑에 만든 메소드 이름
    	if(condition==true){//message메소드의 msg가 나오면 true를 리턴하여 현재 이 조건문이 실행
    		condition = false;//조건=false를 받고
    		return;//리턴을 만나 메소드 밖으로 빠져나감
    	}
    	Singleton.setCategory(1);
    	next();
    }


    @FXML
    void nextCafeList(ActionEvent event) throws IOException {
    	message();//밑에 만든 메소드 이름
    	if(condition==true){//message메소드의 msg가 나오면 true를 리턴하여 현재 이 조건문이 실행
    		condition = false;//조건=false를 받고
    		return;//리턴을 만나 메소드 밖으로 빠져나감
    	}
    	Singleton.setCategory(2);
    	next();
    }


    @FXML
    void nextStoreList(ActionEvent event) throws IOException {
    	message();//밑에 만든 메소드 이름
    	if(condition==true){//message메소드의 msg가 나오면 true를 리턴하여 현재 이 조건문이 실행
    		condition = false;//조건=false를 받고
    		return;//리턴을 만나 메소드 밖으로 빠져나감
    	}
     	Singleton.setCategory(3);
     	next();
    	}

//액션이벤트에 쓰일 메소드 구현
    Message msg = new Message();
    Boolean condition= false;

    public void message(){
    	if(Address_ci.getValue() == null && Address_gu.getValue() == null) {
		msg.setMessage("주소를 확인해주세요");
		condition = true;
	}
	else if(Address_ci.getValue() == null){
		msg.setMessage("시를 선택해주세요");
		condition = true;
	}
	else if(Address_gu.getValue() == null){
		msg.setMessage("구를 선택해주세요");
		condition = true;
	}
  }

//액션이벤트에 쓰일 메소드 구현
    public void next() {
	   	Restaurant.getScene().getWindow().hide();
    	Stage resList = new Stage();
   		Parent root;
		try {
			root = FXMLLoader.load(getClass().getResource("../view/ShopListCard.fxml"));
			Scene scene = new Scene(root);
			resList.setTitle("가게 리스트");
			resList.setScene(scene);
			resList.show();
		} catch (IOException e) {
			System.out.println("리스트페이지이동에러:"+e.getMessage());
		}
 }

//DB에서 콤보 밖스로 담을 메소드 구현
    DBConnect connect = new DBConnect();

    public void getLocalList(){
    	String sql = "SELECT * FROM local";
    	ObservableList<String> ciList = FXCollections.observableArrayList(); // 위의 sql에서 셀렉트된 것의 ci부분을 넣어줄 콤보리스트를 만듬
    	ObservableList<String> guList = FXCollections.observableArrayList(); // 위의 sql에서 셀렉트된 것의 gu부분을 넣어줄 콤보리스트를 만듬

    	Connection conn = connect.getConnection();
    	Statement stmt;
    	ResultSet rs;

    	try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ciList.add(rs.getString("ci"));  //리스트에 select된 것의 ci 부분을 넣음
				guList.add(rs.getString("gu"));  //리스트에 select된 것의 gu 부분을 넣음
			}
		} catch (Exception e) {
			System.out.println("콤보박스 리스트 삽입에러:"+e.getMessage());
		}
    	Address_ci.setItems(ciList);  //콤보박스에 리스트에 넣은 ci를 지정
    	Address_gu.setItems(guList);  //콤보박스에 리스트에 넣은 gu를 지정
    }

//initialize에 메서드를 넣음으로써 화면에 보이게 표현
	@Override
    public void initialize(URL location, ResourceBundle resources) {
		getLocalList();
    }

    public void comboChange(ActionEvent event) {
    }


}

