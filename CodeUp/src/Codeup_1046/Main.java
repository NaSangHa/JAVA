package Codeup_1046;

import java.util.Scanner;

public class Main
{

	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		long a = sc.nextInt();
		long b = sc.nextInt();
		long c = sc.nextInt();
		
		double avg = (double)(a + b + c) / 3;

		System.out.println(a+b+c);
		System.out.printf("%.1f", avg);

	}

}