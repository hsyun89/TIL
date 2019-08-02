package hdfsexam;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class TomcatLogHDFS_Save {
	public static void main(String[] args) {
		try {
			String PATH = "C:/HS/eclipse_workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/logs/";
			BufferedReader in = null;
			PrintWriter out = null;

				File folder = new File(PATH);
				File[] listFile = folder.listFiles();
				out = new PrintWriter(new FileWriter("c:/temp/testHadoop.txt"));
				String line = null;
				for (File file : listFile) {
					in = new BufferedReader(new FileReader(file));
					while ((line = in.readLine()) != null) {
						out.write(line);
						out.println();
						System.out.println(line);
					}
				}
				out.close();
				in.close();
           //위에꺼는 파일 합치기
				Configuration conf = new Configuration();
				conf.set("fs.defaultFS", "hdfs://192.168.111.120:9000");
				FileSystem hdfs = FileSystem.get(conf);
				File f = new File("c:/temp/testHadoop.txt");
				if (!f.exists()) {
					System.out.println("파일이 없음!!");
					return;
				}
				Path path = new Path("/edudata/tomcat_access_log.txt");
				if (hdfs.exists(path)) {
					hdfs.delete(path, true);
				}
				long size = f.length();
				FileReader fr = new FileReader(f);
				char[] content = new char[(int) size];
				fr.read(content);
				FSDataOutputStream outStream = hdfs.create(path);
				BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outStream));
				writer.write(content);
				writer.close();
				outStream.close();
				fr.close();
				System.out.println(size + " 크기의 데이터 출력 완료!!");
			} catch (Exception e) {
				e.printStackTrace();
			}
			//	
	}
}
