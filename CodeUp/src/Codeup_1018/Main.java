package Codeup_1018;

import java.util.Scanner;

public class Main
{

	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		String in = sc.nextLine();
		String[] date = in.split(".");
		
		System.out.printf("%s.%s.%s", date[0], date[1], date[2]);

	}
}
