import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    # TiDB Cloud Database Configuration
    DB_HOST = 'gateway01.ap-southeast-1.prod.aws.tidbcloud.com'
    DB_PORT = 4000
    DB_USER = '212XEoDUzm5eTcz.root'
    DB_PASSWORD = '6XMhSTi7v4pYi5nn'
    DB_NAME = 'Portofolio'
    
    MYSQL_CONFIG = {
    'host': DB_HOST,
    'port': DB_PORT,
    'user': DB_USER,
    'password': DB_PASSWORD,
    'database': DB_NAME,
    'ssl_ca': os.path.join(os.path.dirname(__file__), 'isrgrootx1.pem'),
    'ssl_verify_cert': True,
    'ssl_verify_identity': True
}
    
    
    # Flask Configuration
    SECRET_KEY = os.getenv('SECRET_KEY', 'your-secret-key-change-in-production')
    DEBUG = os.getenv('FLASK_DEBUG', 'True').lower() == 'true'
    
    # Cloudinary Configuration (Dipecah agar lebih clean)
    # Jika CLOUDINARY_URL ada, kita bisa parse, tapi manual lebih aman untuk typing
    CLOUDINARY_CLOUD_NAME = os.getenv('CLOUDINARY_CLOUD_NAME', 'daknwopl3')
    CLOUDINARY_API_KEY = os.getenv('CLOUDINARY_API_KEY', '884765233771594')
    CLOUDINARY_API_SECRET = os.getenv('CLOUDINARY_API_SECRET', 'qOYvn2w1TsW_ipwEzhgqB8RRTKE')
    
    # Resend API Configuration
    RESEND_API_KEY = os.getenv('RESEND_API_KEY', 're_XnPH3oZD_5BhSyqTvgDi6hBFJBrmfw8Xr')