
public class Test
{

	public static void main(String[] args)
	{
		ApiExamCaptchaNkey api = new ApiExamCaptchaNkey();
		
		String test = api.getJson();
		
		System.out.println(test);

	}

}
