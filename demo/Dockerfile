# Bước 1: Chọn Base Image (Nền tảng để chạy Java)
# Sử dụng phiên bản Java 17 rất nhẹ (alpine) để tiết kiệm tài nguyên
FROM openjdk:17-jdk-alpine

# Bước 2: Tạo User Không phải Root (Thực tiễn bảo mật tốt)
RUN adduser -D -s /bin/sh appuser
USER appuser

# Bước 3: Cấu hình cho JVM
# Cho phép JVM sử dụng /tmp cho các file tạm thời
VOLUME /tmp

# Bước 4: Copy file JAR đã build vào container
# Khai báo biến trỏ đến file JAR của bạn
# Đảm bảo đường dẫn này đúng: target/*.jar
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Bước 5: Khai báo Cổng
# Spring Boot thường chạy trên cổng 8080
EXPOSE 8080

# Bước 6: Lệnh Khởi chạy Ứng dụng (Entrypoint)
# -Xmx400m: Giới hạn RAM tối đa là 400MB. Rất quan trọng để không vượt quá giới hạn 512MB của Koyeb Free Tier.
ENTRYPOINT ["java", "-Xmx400m", "-jar", "/app.jar"]