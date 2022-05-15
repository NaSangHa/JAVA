package Codeup_1045;

import java.util.Scanner;

public class Main
{

	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		long a = sc.nextInt();
		long b = sc.nextInt();
		double res = (double) a / (double) b;

		System.out.println(a + b);
		System.out.println(a - b);
		System.out.println(a * b);
		System.out.println(a / b);
		System.out.println(a % b);
		System.out.printf("%.2f", res);

	}

}