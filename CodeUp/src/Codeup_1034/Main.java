package Codeup_1034;

import java.util.Scanner;

public class Main
{

	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		String str = sc.nextLine();
		String[] arr = str.split("");
		int[] arr_int = new int[str.length()];
		int result = 0;

		for (int i = 0; i < str.length(); i++)
		{
			arr_int[i] = Integer.parseInt(arr[i]);

			for (int j = 0; j < str.length() - (1 + i); j++)
			{
				arr_int[i] *= 8;
			}


		}

		for (int e : arr_int)
		{
			result += e;
		}
	}

}
