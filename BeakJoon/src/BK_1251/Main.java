package BK_1251;

import java.util.Random;
import java.util.Scanner;

public class Main
{
	public static void main(String[] args)
	{
		Main m = new Main();
		Scanner sc = new Scanner(System.in);
		Random random = new Random();

		String str = "mabitel";

	}

	public String reverse(String str)
	{
		String reStr = "";

		for (int i = str.length() - 1; i >= 0; i--)
		{
			reStr += str.charAt(i);
		}

		return reStr;
	}

	public char findFirstCha(String str)
	{
		String newStr = str.substring(0, str.length() - 2);
		int num = Math.min(newStr.charAt(0), newStr.charAt(1));

		for (int i = 0; i < newStr.length(); i++)
		{
			num = Math.min(num, newStr.charAt(i));
		}

		return (char) num;
	}

	public char findFirstChaNum(String str, char c)
	{
		int i = 0;
		
		while(true)
		{
			if(str.charAt(i) == c)
			{
				
			}
		}
	}
}