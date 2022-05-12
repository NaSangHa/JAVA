package Codeup_1023;

import java.util.Scanner;

public class Main
{

	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		double num = sc.nextDouble();

		String str = String.valueOf(num);

		String[] strsplit = str.split("\\.");

		System.out.println(strsplit[0]);
		System.out.println(strsplit[1]);

	}
}
