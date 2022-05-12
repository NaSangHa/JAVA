package Codeup_1028;

import java.util.Scanner;

public class Main
{

	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		String str = sc.nextLine();
		String[] arr = str.split("\\.");

		int year = Integer.parseInt(arr[0]);
		int month = Integer.parseInt(arr[1]);
		int date = Integer.parseInt(arr[2]);

		System.out.printf("%02d-%02d-%04d", date, month, year);

	}

}
