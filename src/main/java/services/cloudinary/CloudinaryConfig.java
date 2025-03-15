package services.cloudinary;

import com.cloudinary.Cloudinary;

import java.util.HashMap;
import java.util.Map;

public class CloudinaryConfig {
    private static Cloudinary cloudinary;

    static {
        // Configure Cloudinary with your credentials
        Map<String, String> config = new HashMap<>();
        config.put("cloud_name", "dpgw4y0cv");
        config.put("api_key", "861356143397483");
        config.put("api_secret", "2Y7s7tZICNaOmVLvMp6MRfsX_Ps");

        cloudinary = new Cloudinary(config);
    }

    public static Cloudinary getCloudinary() {
        return cloudinary;
    }
}
