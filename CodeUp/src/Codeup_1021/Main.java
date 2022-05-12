package Codeup_1021;

import java.util.Scanner;

public class Main
{

	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		String num = sc.nextLine();
		String[] arr = num.split("\\-");

		int n0 = Integer.parseInt(arr[0]);
		int n1 = Integer.parseInt(arr[1]);

		System.out.printf("%06d%07d", n0, n1);

	}
}
