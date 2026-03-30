class Employee {
    protected String name;
    protected int age;
    protected int workHours;
    protected int salaryPerHour;

    Employee(){}    
    Employee(String name, int age, int workHours, int salaryPerHour){
        this.name = name;
        this.age = age;
        this.workHours = workHours;
        this.salaryPerHour = salaryPerHour;
    }    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getWorkHours() {
        return workHours;
    }

    public void setWorkHours(int workHours) {
        this.workHours = workHours;
    }
    
    public double calculateSalary() {
        return workHours * salaryPerHour;
    }

    @Override
    public String toString() {
        return "Name: " + name + "; Salary: " + calculateSalary() + "\n";
    }
}

class Manager extends Employee {
    private int bonus;

    Manager() {}
    Manager(String name, int age, int workHours, int salaryPerHour, int bonus) {
        super(name, age, workHours, salaryPerHour);
        this.bonus = bonus;
    }
   
    @Override
    public double calculateSalary() {
        return super.calculateSalary() + bonus;
    }
}

interface iOutSourcable {
    int calculateCost();
}

class Developer extends Employee implements iOutSourcable {
    private int KPI;

    Developer() {}
    Developer(String name, int age, int workHours, int salaryPerHour, int KPI) {
        super(name, age, workHours, salaryPerHour);
        this.KPI = KPI;
    }

    @Override
    public double calculateSalary() {
        return super.calculateSalary() + super.calculateSalary() * KPI;
    }

    @Override
    public int calculateCost() {
        return 40 - super.workHours * 100;
    }
}

class Company implements iOutSourcable {
    String name;
    int projects;

    Company(){}
    Company(String name,  int projects) {
        this.name = name;
        this.projects = projects;
    }

    @Override
    public int calculateCost() {
        return projects * 1000;
    }
}

public class Main {
    public static void main(String[] args) {
        Employee[] employees = new Employee[] {
            new Manager("Alisher", 19, 20, 10, 500),
            new Manager("Zhandaulen", 18, 40, 10, 500),
            new Developer("Daniil", 19, 30, 10, 20),
            new Developer("Dias", 19, 50, 10, 20),
        };

        for (int i = 0; i < employees.length; i++) {
            System.out.println("Employee #" + (i + 1) + ": " + "Name = " + employees[i].getName() + ", Working Hours = " + employees[i].getWorkHours() + ", Salary = " +  employees[i].calculateSalary()); 
        }

        System.out.println();

        int youngestId = 0;
        for (int i = 1; i < employees.length; i++) {
            if (employees[youngestId].getAge() > employees[i].getAge()) {
                youngestId = i;
            }
        }

        System.out.println("Youngest Employee #" + (youngestId + 1) + ": " + "Name = " + employees[youngestId].getName() + "Salary = " +  employees[youngestId].calculateSalary()); 

        int totalHours = 0;
        for (int i = 0; i < employees.length; i++) {
            totalHours +=  employees[i].workHours;
        }

        System.out.println("In average employees work: " + totalHours / employees.length + " hours \n");
        
        for (int i = 0; i < employees.length; i++) {
            int mostHardWorkingID = i;
            for (int j = i; j < employees.length; j++) {
                if (employees[j].workHours > employees[mostHardWorkingID].workHours) {
                   mostHardWorkingID = j; 
                }
            }
            Employee tmp = employees[i];
            employees[i] = employees[mostHardWorkingID];
            employees[mostHardWorkingID] = tmp;
        }

        System.out.println("WE'VE MADE SOME SORTINGNGNGNGN:");
        for (int i = 0; i < employees.length; i++) {
            System.out.println("Employee #" + (i + 1) + ": " + "Name = " + employees[i].getName() + ", Working Hours = " + employees[i].getWorkHours() + ", Salary = " +  employees[i].calculateSalary()); 
        }

        Company myCompany = new Company("IITU CRACKER", 8);
        Double employeesTotalCost = 0.0;

        for (int i = 0; i < employees.length; i++) {
            employeesTotalCost += employees[i].calculateSalary();
        }

        double[] totalOutsouringCost = new double[]{
            myCompany.calculateCost(),
            employeesTotalCost
        };

        System.out.println("\nIn total the company have earned: " + totalOutsouringCost[0] + ". In total employees have earned: " + totalOutsouringCost[1]);
    }
}