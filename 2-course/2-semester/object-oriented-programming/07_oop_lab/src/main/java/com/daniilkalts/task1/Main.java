package com.daniilkalts.task1;

import java.io.*;
import java.util.ArrayList;

public class Main {

    static ArrayList<User> getUsersList() {
        ArrayList<User> users = new ArrayList<User>();
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader("memory.txt"));
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    users.add(new User(Integer.parseInt(parts[0]), parts[1], parts[2]));
                }
            }
        } catch (Exception e) {
            // File might not exist yet, or parsing error, just return empty list
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (Exception e) {
                }
            }
        }
        return users;
    }

    static void saveUsersList(ArrayList<User> users) {
        BufferedWriter bw = null;
        try {
            bw = new BufferedWriter(new FileWriter("memory.txt"));
            for (int i = 0; i < users.size(); i++) {
                User u = users.get(i);
                bw.write(u.getId() + "," + u.getLogin() + "," + u.getPassword());
                bw.newLine();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (bw != null) {
                try {
                    bw.close();
                } catch (Exception e) {
                }
            }
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        ArrayList<User> users = getUsersList();

        while (true) {
            System.out.println("PRESS [1] TO ADD USERS");
            System.out.println("PRESS [2] TO LIST USERS");
            System.out.println("PRESS [3] TO DELETE USERS");
            System.out.println("PRESS [4] TO EXIT");
            
            int choice = -1;
            try {
                choice = Integer.parseInt(reader.readLine());
            } catch (NumberFormatException e) {
                System.out.println("Invalid choice. Please enter a number.");
                continue;
            }

            if (choice == 1) {
                try {
                    System.out.print("Enter ID: ");
                    int id = Integer.parseInt(reader.readLine());
                    System.out.print("Enter login: ");
                    String login = reader.readLine();
                    System.out.print("Enter password: ");
                    String password = reader.readLine();
                    users.add(new User(id, login, password));
                    saveUsersList(users);
                    System.out.println("User added and saved successfully!");
                } catch (NumberFormatException e) {
                    System.out.println("Invalid ID. It must be a number.");
                }
            } else if (choice == 2) {
                System.out.println("--- USERS LIST ---");
                for (int i = 0; i < users.size(); i++) {
                    System.out.println(i + ". " + users.get(i).toString());
                }
                System.out.println("------------------");
            } else if (choice == 3) {
                System.out.print("Enter index to delete: ");
                try {
                    int index = Integer.parseInt(reader.readLine());
                    if (index >= 0 && index < users.size()) {
                        users.remove(index);
                        saveUsersList(users);
                        System.out.println("User deleted successfully.");
                    } else {
                        System.out.println("Invalid index.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Invalid index. It must be a number.");
                }
            } else if (choice == 4) {
                System.out.println("Exiting...");
                break;
            } else {
                System.out.println("Invalid choice. Try again.");
            }
        }
    }
}
