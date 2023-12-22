package com.example.myapplication_0606;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;
import java.util.ArrayList;
import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.content.Context;

public class MainActivity extends AppCompatActivity {
    ListView listview;
    ArrayList<String> items;
    private ArrayList<String> mNames; // mName 값들을 저장할 리스트
    EditText text;
    Button add, modify, delete, sec_jump;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        text = findViewById(R.id.text);
        add = findViewById(R.id.add);
        modify = findViewById(R.id.modify);
        delete = findViewById(R.id.delete);
        sec_jump = findViewById(R.id.sec_jump);

        // 데이터베이스 헬퍼 인스턴스 생성
        DBHelper helper = new DBHelper(getApplicationContext());
        // 데이터베이스 객체 가져오기
        SQLiteDatabase sqlDB = helper.getWritableDatabase();

        items = new ArrayList<>();
        mNames = new ArrayList<>(); // mName 값들을 저장하기 위한 리스트 초기화
        final ArrayAdapter adapter = new ArrayAdapter(this, android.R.layout.simple_list_item_single_choice, items);
        listview = findViewById(R.id.View_1);
        listview.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
        listview.setAdapter(adapter);

        // 추가
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int count = adapter.getCount();
                String itemName = text.getText().toString();
                if (!itemName.isEmpty()) {
                    items.add(Integer.toString(count + 1) + ") " + itemName);
                    mNames.add(itemName); // mName 값 추가
                    adapter.notifyDataSetChanged();
                    text.setText("");

                    // 데이터베이스에 mName 값 입력
                    //ContentValues values = new ContentValues();
                    //values.put("mname", itemName);
                    //long insertedRowId = sqlDB.insert("groupTBL", null, values);

                    //if (insertedRowId != -1) {
                        Toast.makeText(getApplicationContext(), "이름: "+itemName+" 입력되었습니다.", Toast.LENGTH_SHORT).show();
                    //} else {
                        //Toast.makeText(getApplicationContext(), "데이터베이스 입력 실패", Toast.LENGTH_SHORT).show();
                    //}
                //} else {
                    //Toast.makeText(getApplicationContext(), "아이템 이름을 입력하세요.", Toast.LENGTH_SHORT).show();
                }
            }
        });

        modify.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int check;
                int count = adapter.getCount();
                if (count > 0) {
                    check = listview.getCheckedItemPosition(); //선택 항목 position 얻기
                    if (check > -1 && check < count)
                        items.set(check, Integer.toString(check + 1) + ") " + text.getText() + " (수정됨)");
                    adapter.notifyDataSetChanged();
                    text.setText("");
                }
            }
        });
        // 삭제
        delete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int check, count = adapter.getCount();
                if (count > 0) {
                    check = listview.getCheckedItemPosition();
                    if (check > -1 && check < count) {
                        items.remove(check);
                        mNames.remove(check); // mName 값 삭제
                        listview.clearChoices();
                        adapter.notifyDataSetChanged();
                    }
                }
            }
        });

        sec_jump.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, com.example.myapplication_0606.ProductEditActivity.class);
                intent.putStringArrayListExtra("mNames", mNames); // mName 값 리스트 전달
                startActivity(intent);
            }
        });
    }
}