package com.example.myapplication_0606;


import android.app.PendingIntent;
import android.content.ContentValues;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.nfc.NfcAdapter;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;

public class ProductEditActivity extends AppCompatActivity {
    DBHelper dbHelper;
    EditText edtName, edtNumber, edtNameResult, edtNumberResult;
    Button btnInit, btnInsert, btnSelect, btn1;
    SQLiteDatabase sqlDB;

    NfcAdapter nfcAdapter;
    PendingIntent pendingIntent;
    IntentFilter[] intentFiltersArray;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);
        setTitle("사용자 관리");

        // EditText와 Button 위젯들을 초기화합니다.
        edtName = (EditText) findViewById(R.id.edtName);
        edtNumber = (EditText) findViewById(R.id.edtNumber);
        edtNameResult = (EditText) findViewById(R.id.edtNameResult);
        edtNumberResult = (EditText) findViewById(R.id.edtNumberResult);
        btnInit = (Button) findViewById(R.id.btnInit);
        btnInsert = (Button) findViewById(R.id.btnInsert);
        btnSelect = (Button) findViewById(R.id.btnSelect);
        btn1 = (Button) findViewById(R.id.btn1);
        nfcAdapter = NfcAdapter.getDefaultAdapter(this);

        ArrayList<String> mNames = getIntent().getStringArrayListExtra("mNames");



        // myDBHelper 인스턴스를 생성합니다.
        dbHelper = new DBHelper(getApplicationContext());
        sqlDB = dbHelper.getWritableDatabase();
        // 데이터베이스 객체 가져오기

        // 입력값 삭제 버튼 클릭 시, 입력된 값을 삭제합니다.
        btnInit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String name = edtName.getText().toString();
                String number = edtNumber.getText().toString();

                if (!name.isEmpty() && !number.isEmpty()) {
                    sqlDB = dbHelper.getWritableDatabase();
                    sqlDB.execSQL("DELETE FROM groupTBL WHERE gcard = '" + name + "' AND gNumber = " + number + ";");
                    sqlDB.close();

                    Toast.makeText(getApplicationContext(), "입력된 값이 삭제되었습니다.", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(getApplicationContext(), "이름과 수량을 입력하세요.", Toast.LENGTH_SHORT).show();
                }
            }
        });

        // 삽입 버튼 클릭 시, 입력한 값을 데이터베이스에 삽입합니다.
        btnInsert.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String gCard = edtName.getText().toString();
                String gNumber = edtNumber.getText().toString();


                if (!gCard.isEmpty() && !gNumber.isEmpty()) {
                    ContentValues values = new ContentValues();
                    values.put(DBHelper.COLUMN_GCARD, gCard);
                    values.put(DBHelper.COLUMN_GNUMBER, gNumber);

                    ArrayList<String> mNames = getIntent().getStringArrayListExtra("mNames");

                    if (mNames != null && !mNames.isEmpty()) {
                        String selectedMName = mNames.get(0); // 첫 번째 항목을 사용하도록 수정하세요.
                        values.put(DBHelper.COLUMN_MNAME, selectedMName);
                    }
                    long insertedRowId = sqlDB.insert(DBHelper.TABLE_NAME, null, values);
                    if (insertedRowId != -1) {
                        Toast.makeText(getApplicationContext(), "데이터베이스에 입력되었습니다.", Toast.LENGTH_SHORT).show();
                    } else {
                        Toast.makeText(getApplicationContext(), "데이터베이스 입력 실패", Toast.LENGTH_SHORT).show();
                    }
                } else {
                    Toast.makeText(getApplicationContext(), "이름과 수량을 입력하세요.", Toast.LENGTH_SHORT).show();
                }
            }
        });

        /*btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String name = edtName.getText().toString();
                String number = edtNumber.getText().toString();
                String birth = edtupdate.getText().toString();

                if (!name.isEmpty() && !number.isEmpty()) {
                    sqlDB = dbHelper.getWritableDatabase();
                    sqlDB.execSQL("UPDATE groupTBL SET gcard = " + number + ", gNumber = " + name + " WHERE gName = '" + birth + "';");
                    sqlDB.close();

                    Toast.makeText(getApplicationContext(), "입력된 값이 수정되었습니다.", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(getApplicationContext(), "이름과 수량을 입력하세요.", Toast.LENGTH_SHORT).show();
                }
            }
        });*/

        // 조회 버튼 클릭 시, 데이터베이스에서 모든 항목을 조회하여 EditText에 표시합니다.
        btnSelect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sqlDB = dbHelper.getReadableDatabase();
                Cursor cursor;
                cursor = sqlDB.rawQuery("SELECT * FROM groupTBL;", null);

                StringBuilder strNames = new StringBuilder("사용자 리스트\r\n\r\n");
                StringBuilder strNumbers = new StringBuilder("면허번호\r\n\r\n");

                while (cursor.moveToNext()) {
                    strNames.append(cursor.getString(0)).append("\r\n");
                    strNumbers.append(cursor.getString(1)).append("\r\n");
                }

                edtNameResult.setText(strNames.toString());
                edtNumberResult.setText(strNumbers.toString());

                cursor.close();
                sqlDB.close();
            }
        });
        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (nfcAdapter != null) {
                    enableNfcForegroundDispatch(); // NFC 전송을 위해 포그라운드 디스패치 활성화
                } else {
                    Toast.makeText(getApplicationContext(), "NFC가 지원되지 않는 기기입니다.", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
    private void enableNfcForegroundDispatch() {
        Intent intent = new Intent(this, getClass());
        intent.addFlags(Intent.FLAG_RECEIVER_REPLACE_PENDING);
        pendingIntent = PendingIntent.getActivity(this, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT);
        intentFiltersArray = new IntentFilter[]{new IntentFilter(NfcAdapter.ACTION_NDEF_DISCOVERED)};
        String[][] techListsArray = new String[][]{{android.nfc.tech.Ndef.class.getName()}};
        nfcAdapter.enableForegroundDispatch(this, pendingIntent, intentFiltersArray, techListsArray);
    }

    @Override
    protected void onPause() {
        super.onPause();
        if (nfcAdapter != null) {
            nfcAdapter.disableForegroundDispatch(this);
        }
    }
}
