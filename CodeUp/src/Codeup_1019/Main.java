package Codeup_1019;

import java.util.Scanner;

public class Main
{

	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		String a = sc.nextLine();
		String[] time = a.split(":");
		
		System.out.printf("%s:%s", time[0], time[1]);

	}
}
