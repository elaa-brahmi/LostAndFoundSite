package services.cloudinary;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Map;
import java.util.UUID;

public class CloudinaryServices {
    public CloudinaryServices() {
    }

    public String uploadToCloudinary(Part imagePart) throws IOException {

        if (imagePart == null || imagePart.getSize()==0) {
            System.out.println("No image provided, skipping upload.");
            return "no image is found";  // Prevent uploading if no image
        }

// Get the Cloudinary instance
        Cloudinary cloudinary = CloudinaryConfig.getCloudinary();
        String fileName = getSubmittedFileName(imagePart);
        String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;
        Path tempFile = Files.createTempFile("upload_", uniqueFileName);

        // Copy the image data to the temporary file
        try (InputStream input = imagePart.getInputStream()) {
            Files.copy(input, tempFile, StandardCopyOption.REPLACE_EXISTING);
        }

        // Upload to Cloudinary
        File fileToUpload = tempFile.toFile();
        Map uploadResult = cloudinary.uploader().upload(fileToUpload, ObjectUtils.asMap(
                "folder", "lost_found_items",
                "resource_type", "auto",
                "public_id", uniqueFileName.substring(0, uniqueFileName.lastIndexOf('.'))
        ));

        // Delete the temporary file
        Files.delete(tempFile);

        // Return the secure URL of the uploaded image
        return (String) uploadResult.get("secure_url");
    }
    public String getSubmittedFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "unknown_filename";
    }
}
