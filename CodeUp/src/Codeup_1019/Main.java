package Codeup_1019;

import java.util.Scanner;

public class Main
{

	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		String a = sc.nextLine();

		String[] date = a.split("\\.");

		int y = Integer.parseInt(date[0]);
		int m = Integer.parseInt(date[1]);
		int d = Integer.parseInt(date[2]);

		System.out.printf("%04d.%02d.%02d", y, m, d);

	}
}
