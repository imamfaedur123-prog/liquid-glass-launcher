package com.example.liquidglasslauncher

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.unit.dp

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { HomeScreen() }
    }
}

@Composable
fun HomeScreen() {
    Box(
        Modifier.fillMaxSize().background(
            Brush.verticalGradient(listOf(Color(0xFF0B0D12), Color(0xFF1A1F2E)))
        )
    ) {
        Column(Modifier.fillMaxSize().padding(16.dp)) {
            Text("Liquid Glass Launcher", color = Color.White)
            Spacer(Modifier.height(8.dp))
            Text("Home screen scaffold — extend with grid, dock, widgets, Shizuku app discovery.", color = Color.White.copy(alpha = 0.7f))
        }
    }
}
