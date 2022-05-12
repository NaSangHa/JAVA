package Codeup_1026;

import java.util.Scanner;

public class Main
{

	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
//		String str = sc.nextLine();
//
//		String[] arr = new String[str.length()];
//		int[] arr_int = new int[str.length()];
//
//		for (int i = 0; i < str.length(); i++)
//		{
//			arr[i] = str.substring(i, i + 1);
//
//			arr_int[i] = Integer.parseInt(arr[i]);
//
//			for (int j = 0; j < str.length() - (i + 1); j++)
//			{
//				arr_int[i] *= 10;
//			}
//		}
//
//		for (int i : arr_int)
//			System.out.printf("[%d]\n",i);
		
		////////////////////////////////////////////////////
		
		String[] str = sc.nextLine().split("");
		
		System.out.println("["+Integer.parseInt(str[0]) * 10000+"]");
		System.out.println("["+Integer.parseInt(str[1]) * 1000+"]");
		System.out.println("["+Integer.parseInt(str[2]) * 100+"]");
		System.out.println("["+Integer.parseInt(str[3]) * 10+"]");
		System.out.println("["+Integer.parseInt(str[4]) * 1+"]");
		
	}

}
