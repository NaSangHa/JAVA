package Codeup_1020;

import java.util.Scanner;

public class Main
{

	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		String str = sc.nextLine();

		String[] arr = new String[str.length()];
		
		for(int i = 0; i <str.length(); i++)
		{
			arr[i] = str.substring(i, i+1);
		}
		
		
		for (String s: arr)
			System.out.print(s);
	}
}
