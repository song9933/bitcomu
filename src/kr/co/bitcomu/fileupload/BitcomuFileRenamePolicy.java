package kr.co.bitcomu.fileupload;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class BitcomuFileRenamePolicy implements FileRenamePolicy {
	public static void main(String[] args) {
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String filePath = "/board" + sdf.format(new Date());
		File f = new File("c:/java/bitupload" + filePath);
		System.out.println(f.getParent());
		String name = f.getName();
		int index = name.lastIndexOf(".");
//		System.out.println(index); //index 가 -1일 경우: 확장자가 없음
		String extName = "";
		if (index != -1) extName = name.substring(index);
//		System.out.println(UUID.randomUUID().toString() + extName);
//		
//		System.out.println(name);
	}

	@Override
	public File rename(File f) {
		String name = f.getName();
		int index = name.lastIndexOf(".");
		String extName = "";
		if (index != -1) extName = name.substring(index);

		return new File(f.getParent(), UUID.randomUUID().toString() + extName);
	}
}
