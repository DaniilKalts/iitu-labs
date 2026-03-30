package com.lab6;

import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class ConverterApp {

    private static final double MILES_TO_KM = 1.60934;

    public void start(Stage stage) {
        TextField milesField = new TextField();
        milesField.setPromptText("Enter miles");

        TextField kmField = new TextField();
        kmField.setPromptText("Enter kilometers");

        milesField.setOnAction(e -> convertMilesToKm(milesField, kmField));

        kmField.setOnAction(e -> convertKmToMiles(milesField, kmField));

        GridPane grid = new GridPane();
        grid.setHgap(10);
        grid.setVgap(10);
        grid.setPadding(new Insets(20));
        grid.setAlignment(Pos.CENTER);

        grid.add(new Label("Mile:"), 0, 0);
        grid.add(milesField, 1, 0);
        grid.add(new Label("Kilometer:"), 0, 1);
        grid.add(kmField, 1, 1);

        Scene scene = new Scene(grid, 350, 150);
        stage.setTitle("Unit Converter");
        stage.setScene(scene);
        stage.show();
    }

    private void convertMilesToKm(TextField milesField, TextField kmField) {
        try {
            double miles = Double.parseDouble(milesField.getText().trim());
            double km = miles * MILES_TO_KM;
            kmField.setText(String.format("%.4f", km));
        } catch (NumberFormatException ex) {
            kmField.setText("Invalid input");
        }
    }

    private void convertKmToMiles(TextField milesField, TextField kmField) {
        try {
            double km = Double.parseDouble(kmField.getText().trim());
            double miles = km / MILES_TO_KM;
            milesField.setText(String.format("%.4f", miles));
        } catch (NumberFormatException ex) {
            milesField.setText("Invalid input");
        }
    }
}
