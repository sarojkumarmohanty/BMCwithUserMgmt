package tech.csm.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.Part;

public class FileUploadUtil {

	public static String getFilePath(Part part) {
		File file1=null;
		
		try {
			String fileName = part.getSubmittedFileName();
			File file = new File("d:/utf/");
			if (!file.isDirectory()) {
				file.mkdir();
			}
			file1 = new File("d:/utf/" + fileName);
			InputStream in = part.getInputStream();
			FileOutputStream fos = new FileOutputStream(file1);
			byte[] bytes = new byte[(int) part.getSize()];

			in.read(bytes);
			fos.write(bytes);

			in.close();
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file1.getPath();
	}

}
