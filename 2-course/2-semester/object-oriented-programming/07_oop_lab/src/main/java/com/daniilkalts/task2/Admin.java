package com.daniilkalts.task2;

import java.io.*;
import java.util.ArrayList;

public class Admin {

    static ArrayList<GoodItem> getGoodItemList() {
        ArrayList<GoodItem> goodItems = new ArrayList<GoodItem>();
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader("goodItems.txt"));
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 2) {
                    goodItems.add(new GoodItem(parts[0], Integer.parseInt(parts[1])));
                }
            }
        } catch (Exception e) {
            // Ignored, file might not exist
        } finally {
            if (br != null) {
                try { br.close(); } catch (Exception e) { }
            }
        }
        return goodItems;
    }

    static void saveGoodItems(ArrayList<GoodItem> goodItems) {
        BufferedWriter bw = null;
        try {
            bw = new BufferedWriter(new FileWriter("goodItems.txt"));
            for (int i = 0; i < goodItems.size(); i++) {
                GoodItem item = goodItems.get(i);
                bw.write(item.getName() + "," + item.getPrice());
                bw.newLine();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (bw != null) {
                try { bw.close(); } catch (Exception e) { }
            }
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        ArrayList<GoodItem> goodItems = getGoodItemList();

        while (true) {
            System.out.println("PRESS [1] ADD GOOD");
            System.out.println("PRESS [2] LIST GOODS");
            System.out.println("PRESS [3] DELETE GOOD");
            System.out.println("PRESS [0] TO EXIT");
            
            int choice = -1;
            try {
                choice = Integer.parseInt(reader.readLine());
            } catch (NumberFormatException e) {
                System.out.println("Invalid choice. Please enter a number.");
                continue;
            }

            if (choice == 1) {
                try {
                    System.out.print("Enter product name: ");
                    String name = reader.readLine();
                    System.out.print("Enter product price: ");
                    int price = Integer.parseInt(reader.readLine());
                    goodItems.add(new GoodItem(name, price));
                    saveGoodItems(goodItems);
                    System.out.println("Product added successfully!");
                } catch (NumberFormatException e) {
                    System.out.println("Invalid price. It must be a number.");
                }
            } else if (choice == 2) {
                System.out.println("--- PRODUCTS LIST ---");
                for (int i = 0; i < goodItems.size(); i++) {
                    System.out.println(i + ". " + goodItems.get(i).toString());
                }
                System.out.println("---------------------");
            } else if (choice == 3) {
                System.out.print("Enter index to delete: ");
                try {
                    int index = Integer.parseInt(reader.readLine());
                    if (index >= 0 && index < goodItems.size()) {
                        goodItems.remove(index);
                        saveGoodItems(goodItems);
                        System.out.println("Product deleted successfully.");
                    } else {
                        System.out.println("Invalid index.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Invalid index format.");
                }
            } else if (choice == 0) {
                System.out.println("Exiting Admin Panel...");
                break;
            } else {
                System.out.println("Invalid choice. Try again.");
            }
        }
    }
}
