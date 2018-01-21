package com.runloop.www.runloop;

import android.databinding.DataBindingUtil;
import android.support.v4.app.FragmentActivity;
import android.os.Bundle;
import android.widget.SeekBar;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.runloop.www.runloop.databinding.ActivityPlanRunBinding;

public class PlanRunActivity extends FragmentActivity implements OnMapReadyCallback {

    private GoogleMap mMap;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_plan_run);
        // Obtain the SupportMapFragment and get notified when the map is ready to be used.
        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager()
                .findFragmentById(R.id.map);
        mapFragment.getMapAsync(this);
    }

    ActivityPlanRunBinding binding =
            DataBindingUtil.setContentView(this, R.layout.activity_plan_run);
    SeekBar distanceControl = binding.distanceBar;
    int nWaypoints = 1;

    public void onProgressChanged(SeekBar distanceControl, int progress, boolean fromUser){
        if (fromUser)
            nWaypoints = progress;
    }

    public void onStartTrackingTouch(SeekBar distanceControl) {
        // TODO Auto-generated method stub
    }

    public void onStopTrackingTouch(SeekBar distanceControl) {
        //Something
    }


    /**
     * Manipulates the map once available.
     * This callback is triggered when the map is ready to be used.
     * This is where we can add markers or lines, add listeners or move the camera. In this case,
     * we just add a marker near Sydney, Australia.
     * If Google Play services is not installed on the device, the user will be prompted to install
     * it inside the SupportMapFragment. This method will only be triggered once the user has
     * installed Google Play services and returned to the app.
     */
    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;

        // Add a marker in Sydney and move the camera
        LatLng montreal = new LatLng(45.5, -75.5);
        mMap.addMarker(new MarkerOptions().position(montreal).title("Marker in Montreal"));
        mMap.moveCamera(CameraUpdateFactory.newLatLng(montreal));
    }
}
