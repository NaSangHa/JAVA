package Codeup_1026;

import java.util.Scanner;

public class Main
{

	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		String[] arr = sc.nextLine().split(".");
		
		int min = Integer.parseInt(arr[1]);

		System.out.printf("%d", min);

	}

}
