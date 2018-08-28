package com.diallo

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        register_editButton.setOnClickListener {

            val username =  username_edit_register.text.toString()
            val email =   email_edit_register.text.toString()
            val password = password_edit_register.text.toString()
            Log.d( "MainActivity" ,  "Username is: " + username )
            Log.d(  "MainActivity" ,  "Email is: " +  email )
            Log.d( "MainActivity" ,  " The Password is:  $password " )

        }

         already_have_an_account_textView.setOnClickListener {

              Log.d( "MainActivity" ,  "Try to show login activity" )

             //Launch the login Activity to from this function..;

              val intent =  Intent( this, LoginActivity::class.java)
             startActivity(intent)

         }

    }






}
