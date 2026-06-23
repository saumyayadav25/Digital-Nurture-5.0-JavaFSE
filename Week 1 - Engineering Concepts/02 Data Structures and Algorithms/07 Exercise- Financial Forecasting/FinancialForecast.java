import java.util.Scanner;

public class FinancialForecast {

    public static double predictFutureValue(double currValue, double growthRate, int years) {
        if (years == 0) {
            return currValue;
        }
        return predictFutureValue( currValue * (1 + growthRate), growthRate, years - 1);
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter current value: ");
        double currValue = sc.nextDouble();

        System.out.print("Enter annual growth rate (%): ");
        double growthRate = sc.nextDouble() / 100;

        System.out.print("Enter number of years: ");
        int years = sc.nextInt();

        double futureValue = predictFutureValue(currValue, growthRate, years);

        System.out.println("\nPredicted Future Value: " + futureValue);

        sc.close();
    }
}