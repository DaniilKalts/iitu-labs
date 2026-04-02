package com.daniilkalts.task2;

import java.io.*;
import java.util.ArrayList;
import java.util.Date;

public class Client {

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
        } finally {
            if (br != null) {
                try { br.close(); } catch (Exception e) { }
            }
        }
        return goodItems;
    }

    static ArrayList<BuyHistory> getBuyHistory() {
        ArrayList<BuyHistory> buyHistory = new ArrayList<BuyHistory>();
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader("buyHistory.txt"));
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 3) {
                    buyHistory.add(new BuyHistory(parts[0], Integer.parseInt(parts[1]), new Date(Long.parseLong(parts[2]))));
                }
            }
        } catch (Exception e) {
        } finally {
            if (br != null) {
                try { br.close(); } catch (Exception e) { }
            }
        }
        return buyHistory;
    }

    static void saveBuyHistory(ArrayList<BuyHistory> buyHistory) {
        BufferedWriter bw = null;
        try {
            bw = new BufferedWriter(new FileWriter("buyHistory.txt"));
            for (int i = 0; i < buyHistory.size(); i++) {
                BuyHistory item = buyHistory.get(i);
                bw.write(item.getGoodName() + "," + item.getGoodPrice() + "," + item.getBuyTime().getTime());
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
        
        while (true) {
            ArrayList<GoodItem> goodItems = getGoodItemList();
            ArrayList<BuyHistory> buyHistory = getBuyHistory();

            System.out.println("PRESS [1] LIST GOODS");
            System.out.println("PRESS [2] BUY GOOD");
            System.out.println("PRESS [3] LIST BUY HISTORY");
            System.out.println("PRESS [0] TO EXIT");
            
            int choice = -1;
            try {
                choice = Integer.parseInt(reader.readLine());
            } catch (NumberFormatException e) {
                System.out.println("Invalid choice. Please enter a number.");
                continue;
            }

            if (choice == 1) {
                System.out.println("--- AVAILABLE PRODUCTS ---");
                for (int i = 0; i < goodItems.size(); i++) {
                    System.out.println(i + ". " + goodItems.get(i).toString());
                }
                System.out.println("--------------------------");
            } else if (choice == 2) {
                System.out.print("Enter index of the product to buy: ");
                try {
                    int index = Integer.parseInt(reader.readLine());
                    if (index >= 0 && index < goodItems.size()) {
                        GoodItem itemToBuy = goodItems.get(index);
                        buyHistory.add(new BuyHistory(itemToBuy.getName(), itemToBuy.getPrice()));
                        saveBuyHistory(buyHistory);
                        System.out.println("Product bought successfully!");
                    } else {
                        System.out.println("Invalid index.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Invalid index format.");
                }
            } else if (choice == 3) {
                System.out.println("--- BUY HISTORY ---");
                for (int i = 0; i < buyHistory.size(); i++) {
                    System.out.println(i + ". " + buyHistory.get(i).toString());
                }
                System.out.println("-------------------");
            } else if (choice == 0) {
                System.out.println("Exiting Client Panel...");
                break;
            } else {
                System.out.println("Invalid choice. Try again.");
            }
        }
    }
}
