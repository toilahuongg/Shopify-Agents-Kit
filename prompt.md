dịch sang tiếng anh, lưu ý không tự format text, đầu ra phải là plain text

Tạo lại cho tôi command shopify:starter. Mục tiêu đó là tạo ra các tài liệu cần thiết cho việc tạo app Shopify (Dùng agent `technical-document-writer` để viết tài liệu)

Input: Mô tả về app

Phase 1: Analysis (Optional) - Brainstorming, Research, Product Brief
Phase 2: Planning (Required) - Create your requirements (tech-spec or PRD)
Phase 3: Solutioning (Track-dependent) - Design the architecture


Mỗi step cần chạy agent `project-manager` để kiểm tra trước, xem có làm theo các yêu đã xác nhận trước hay không, sau đó xin xác nhận từ người dùng



Chế độ `YOLO mode` là không cần xác nhận từ người dùng, chỉ cần chạy agent `project-manager` để kiểm tra trước, xem có làm theo các yêu đã xác nhận trước hay không. Chế độ này sẽ hỏi ngay sau khi xong step 2