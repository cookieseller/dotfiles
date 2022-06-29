import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class HelloWorld {

  public static void main(String[] args) {
    // Ausgabe Hello World!
    System.out.println("Hello World!");
  }

  public void whenWriteStringUsingBufferedWritter_thenCorrect() throws IOException {



    String str = "Hello";
    BufferedWriter writer = new BufferedWriter(new FileWriter("test"));
    writer.write(str);

    writer.close();
  }
}
