package test;

public class PrintAlpha {
	public static void main(String[] args) {
		int k = 0;
		for (int i = 0; i < 5; i++) {
			for (int j = 0; j < i + 1; j++) {
				System.out.printf("%c", 65 + k);
				k++;
			}
			System.out.println();
		}
	}
}
