package com.lab6;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class MainMenu extends Application {

    @Override
    public void start(Stage primaryStage) {
        Label title = new Label("OOP Lab 6 — JavaFX Applications");
        title.setStyle("-fx-font-size: 18px; -fx-font-weight: bold;");

        Button converterButton = createLaunchButton("Task 1: Unit Converter", () -> new ConverterApp().start(new Stage()));
        Button stopwatchButton = createLaunchButton("Task 2: Stopwatch", () -> new StopwatchApp().start(new Stage()));
        Button calculatorButton = createLaunchButton("Task 3: Calculator", () -> new CalculatorApp().start(new Stage()));

        VBox root = new VBox(15, title, converterButton, stopwatchButton, calculatorButton);
        root.setAlignment(Pos.CENTER);
        root.setPadding(new Insets(30));

        Scene scene = new Scene(root, 350, 250);
        primaryStage.setTitle("OOP Lab 6 — Main Menu");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    private Button createLaunchButton(String text, Runnable action) {
        Button button = new Button(text);
        button.setPrefWidth(250);
        button.setPrefHeight(40);
        button.setStyle("-fx-font-size: 14px;");
        button.setOnAction(e -> action.run());
        return button;
    }

    public static void main(String[] args) {
        launch(args);
    }
}
