package com.lab6;

import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class CalculatorApp {

    private String currentInput = "0";
    private double storedValue = 0;
    private String pendingOperator = "";
    private boolean startNewInput = true;
    private boolean isError = false;

    private double repeatOperand = 0;
    private String repeatOperator = "";

    private Label display;

    public void start(Stage stage) {
        display = new Label("0");
        display.setStyle(
            "-fx-font-size: 36px; -fx-font-family: 'Helvetica';" +
            "-fx-background-color: #000; -fx-text-fill: white;" +
            "-fx-padding: 10 15 10 15; -fx-min-height: 70;"
        );
        display.setMaxWidth(Double.MAX_VALUE);
        display.setAlignment(Pos.CENTER_RIGHT);

        GridPane buttonGrid = createButtonGrid();

        VBox root = new VBox(display, buttonGrid);
        VBox.setVgrow(buttonGrid, Priority.ALWAYS);
        root.setStyle("-fx-background-color: #333;");

        Scene scene = new Scene(root, 280, 420);
        stage.setTitle("Calculator");
        stage.setScene(scene);
        stage.setResizable(false);
        stage.show();
    }

    private GridPane createButtonGrid() {
        GridPane grid = new GridPane();
        grid.setHgap(1);
        grid.setVgap(1);
        grid.setPadding(new Insets(1));

        for (int i = 0; i < 4; i++) {
            ColumnConstraints col = new ColumnConstraints();
            col.setPercentWidth(25);
            grid.getColumnConstraints().add(col);
        }

        String[][] buttonLabels = {
            {"AC", "+/-", "%", "\u00F7"},
            {"7",  "8",   "9", "\u00D7"},
            {"4",  "5",   "6", "\u2212"},
            {"1",  "2",   "3", "+"},
        };

        for (int row = 0; row < buttonLabels.length; row++) {
            for (int col = 0; col < buttonLabels[row].length; col++) {
                String label = buttonLabels[row][col];
                Button button = createButton(label, getButtonStyle(label));
                button.setOnAction(e -> handleButtonPress(label));
                grid.add(button, col, row);
            }
        }

        Button zeroButton = createButton("0", getButtonStyle("0"));
        zeroButton.setOnAction(e -> handleButtonPress("0"));
        grid.add(zeroButton, 0, 4, 2, 1);

        Button dotButton = createButton(".", getButtonStyle("."));
        dotButton.setOnAction(e -> handleButtonPress("."));
        grid.add(dotButton, 2, 4);

        Button equalsButton = createButton("=", getButtonStyle("="));
        equalsButton.setOnAction(e -> handleButtonPress("="));
        grid.add(equalsButton, 3, 4);

        return grid;
    }

    private Button createButton(String text, String style) {
        Button button = new Button(text);
        button.setMaxSize(Double.MAX_VALUE, Double.MAX_VALUE);
        button.setPrefHeight(65);
        button.setStyle(style);
        GridPane.setHgrow(button, Priority.ALWAYS);
        GridPane.setVgrow(button, Priority.ALWAYS);
        return button;
    }

    private String getButtonStyle(String label) {
        String baseStyle = "-fx-font-size: 20px; -fx-border-color: #555; -fx-border-width: 0.5;";

        if (label.equals("\u00F7") || label.equals("\u00D7") || label.equals("\u2212") ||
            label.equals("+") || label.equals("=")) {
            return baseStyle + "-fx-background-color: #FF9500; -fx-text-fill: white;";
        }

        if (label.equals("AC") || label.equals("+/-") || label.equals("%")) {
            return baseStyle + "-fx-background-color: #A5A5A5; -fx-text-fill: black;";
        }

        return baseStyle + "-fx-background-color: #505050; -fx-text-fill: white;";
    }

    private void handleButtonPress(String label) {
        if (isError && !label.equals("AC")) {
            return;
        }

        switch (label) {
            case "AC":
                handleClear();
                break;
            case "+/-":
                handleToggleSign();
                break;
            case "%":
                handlePercent();
                break;
            case "\u00F7": handleOperator("/"); break;
            case "\u00D7": handleOperator("*"); break;
            case "\u2212": handleOperator("-"); break;
            case "+": handleOperator("+"); break;
            case "=":
                handleEquals();
                break;
            case ".":
                handleDecimalPoint();
                break;
            default:
                handleDigit(label);
                break;
        }
    }

    private void handleDigit(String digit) {
        if (startNewInput) {
            currentInput = digit;
            startNewInput = false;
        } else {
            if (currentInput.equals("0")) {
                currentInput = digit;
            } else if (currentInput.equals("-0")) {
                currentInput = "-" + digit;
            } else {
                currentInput += digit;
            }
        }
        updateDisplay(currentInput);
    }

    private void handleDecimalPoint() {
        if (startNewInput) {
            currentInput = "0.";
            startNewInput = false;
        } else if (!currentInput.contains(".")) {
            currentInput += ".";
        }
        updateDisplay(currentInput);
    }

    private void handleOperator(String operator) {
        if (!startNewInput) {
            if (!pendingOperator.isEmpty()) {
                double currentValue = parseDisplay();
                double result = calculate(storedValue, currentValue, pendingOperator);
                if (isError) return;
                storedValue = result;
                currentInput = formatResult(storedValue);
                updateDisplay(currentInput);
            } else {
                storedValue = parseDisplay();
            }
        }
        
        pendingOperator = operator;
        startNewInput = true;
        repeatOperator = "";
    }

    private void handleEquals() {
        if (!pendingOperator.isEmpty()) {
            double currentValue = startNewInput ? storedValue : parseDisplay();
            
            repeatOperand = currentValue;
            repeatOperator = pendingOperator;

            double result = calculate(storedValue, currentValue, pendingOperator);
            if (isError) return;
            
            pendingOperator = "";
            storedValue = result;
            currentInput = formatResult(result);
            updateDisplay(currentInput);
            startNewInput = true;
        } else if (!repeatOperator.isEmpty()) {
            double result = calculate(storedValue, repeatOperand, repeatOperator);
            if (isError) return;
            
            storedValue = result;
            currentInput = formatResult(result);
            updateDisplay(currentInput);
            startNewInput = true;
        }
    }

    private void handleClear() {
        currentInput = "0";
        storedValue = 0;
        pendingOperator = "";
        startNewInput = true;
        isError = false;
        repeatOperator = "";
        repeatOperand = 0;
        updateDisplay("0");
    }

    private void handleToggleSign() {
        if (currentInput.startsWith("-")) {
            currentInput = currentInput.substring(1);
        } else {
            if (!currentInput.equals("0")) {
                 currentInput = "-" + currentInput;
            } else {
                 currentInput = "-0";
            }
        }
        updateDisplay(currentInput);
    }

    private void handlePercent() {
        double value = parseDisplay();
        value /= 100.0;
        currentInput = formatResult(value);
        startNewInput = true;
        updateDisplay(currentInput);
    }

    private double calculate(double left, double right, String operator) {
        switch (operator) {
            case "+": return left + right;
            case "-": return left - right;
            case "*": return left * right;
            case "/":
                if (right == 0) {
                    setErrorState();
                    return 0;
                }
                return left / right;
            default: return right;
        }
    }

    private void setErrorState() {
        isError = true;
        currentInput = "Error";
        updateDisplay("Error");
    }

    private double parseDisplay() {
        try {
            return Double.parseDouble(currentInput);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private String formatResult(double value) {
        if (Double.isNaN(value) || Double.isInfinite(value)) {
            setErrorState();
            return "Error";
        }
        
        if (value == (long) value) {
            return String.valueOf((long) value);
        }
        
        return String.valueOf(value);
    }

    private void updateDisplay(String text) {
        display.setText(text);
    }
}
