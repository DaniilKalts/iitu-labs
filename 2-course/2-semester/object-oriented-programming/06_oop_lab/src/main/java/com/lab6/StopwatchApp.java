package com.lab6;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.util.Duration;

public class StopwatchApp {

    private int elapsedSeconds = 0;
    private Timeline timeline;
    private boolean isRunning = false;

    public void start(Stage stage) {
        Label timeLabel = new Label("00:00:00");
        timeLabel.setStyle("-fx-font-size: 48px; -fx-font-family: 'Monospaced';");

        Button startButton = new Button("Start");
        startButton.setPrefWidth(100);
        startButton.setPrefHeight(40);

        Button clearButton = new Button("Clear");
        clearButton.setPrefWidth(100);
        clearButton.setPrefHeight(40);

        timeline = new Timeline(new KeyFrame(Duration.seconds(1), e -> {
            elapsedSeconds++;
            timeLabel.setText(formatTime(elapsedSeconds));
        }));
        timeline.setCycleCount(Timeline.INDEFINITE);

        startButton.setOnAction(e -> {
            if (!isRunning) {
                timeline.play();
                isRunning = true;
                startButton.setText("Pause");
            } else {
                timeline.pause();
                isRunning = false;
                startButton.setText("Resume");
            }
        });

        clearButton.setOnAction(e -> {
            timeline.stop();
            isRunning = false;
            elapsedSeconds = 0;
            timeLabel.setText("00:00:00");
            startButton.setText("Start");
        });

        HBox buttonRow = new HBox(15, startButton, clearButton);
        buttonRow.setAlignment(Pos.CENTER);

        VBox root = new VBox(20, timeLabel, buttonRow);
        root.setAlignment(Pos.CENTER);
        root.setPadding(new Insets(30));

        Scene scene = new Scene(root, 350, 200);
        stage.setTitle("Stopwatch");
        stage.setScene(scene);
        stage.show();
    }

    private String formatTime(int totalSeconds) {
        int hours = totalSeconds / 3600;
        int minutes = (totalSeconds % 3600) / 60;
        int seconds = totalSeconds % 60;
        return String.format("%02d:%02d:%02d", hours, minutes, seconds);
    }
}
