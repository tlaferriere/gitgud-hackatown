package com.runloop.www.runloop;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

public class WelcomeScreenActivity extends AppCompatActivity {

    // Used to load the 'native-lib' library on application startup.
    static {
        System.loadLibrary("native-lib");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_welcome_screen);
    }

    /** Called when the user taps the Run button */
    public void begin(View view) {
        Intent intent = new Intent(this, PlanRunActivity.class);
        System.out.println("Intent has been clarified.");
        startActivity(intent);
        System.out.println("Activity started (or not)");
    }
}
