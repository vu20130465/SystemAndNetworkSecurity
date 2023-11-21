/*
 Navicat Premium Data Transfer

 Source Server         : web_ban_trai_cay
 Source Server Type    : MariaDB
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : web_ban_trai_cay

 Target Server Type    : MariaDB
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 21/11/2023 23:56:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_status
-- ----------------------------
DROP TABLE IF EXISTS `account_status`;
CREATE TABLE `account_status`  (
  `id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_status
-- ----------------------------

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rold_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'thơm/dứa');
INSERT INTO `category` VALUES (2, 'dưa hấu');
INSERT INTO `category` VALUES (3, 'chuối');
INSERT INTO `category` VALUES (4, 'đu đủ');
INSERT INTO `category` VALUES (5, 'chanh leo');
INSERT INTO `category` VALUES (6, 'cam');
INSERT INTO `category` VALUES (7, 'bơ');
INSERT INTO `category` VALUES (8, 'bưởi');
INSERT INTO `category` VALUES (9, 'ổi');
INSERT INTO `category` VALUES (10, 'xoài');
INSERT INTO `category` VALUES (11, 'thanh long');
INSERT INTO `category` VALUES (12, 'dưa lê');
INSERT INTO `category` VALUES (13, 'việt quất');
INSERT INTO `category` VALUES (14, 'tầm bóp');
INSERT INTO `category` VALUES (15, 'vú sữa');
INSERT INTO `category` VALUES (16, 'dưa lưới');
INSERT INTO `category` VALUES (17, 'táo');
INSERT INTO `category` VALUES (18, 'nhãn');
INSERT INTO `category` VALUES (19, 'kiwi');
INSERT INTO `category` VALUES (20, 'lê');
INSERT INTO `category` VALUES (21, 'sung');
INSERT INTO `category` VALUES (22, 'hồng');
INSERT INTO `category` VALUES (23, 'nho');
INSERT INTO `category` VALUES (24, 'quýt');
INSERT INTO `category` VALUES (25, 'lựu');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (1, 1, 'images/Thom (Dua) - 1 trai.jpg');
INSERT INTO `image` VALUES (2, 2, 'images/Dua Hau Co Hat Que Lam - 1kg.jpg');
INSERT INTO `image` VALUES (3, 3, 'images/Chuoi Su - 1kg.jpg');
INSERT INTO `image` VALUES (4, 4, 'images/Du Du Ruot Vang - 1kg.jpg');
INSERT INTO `image` VALUES (5, 5, 'images/Chanh Leo Vang - 500g.jpg');
INSERT INTO `image` VALUES (6, 6, 'images/Cam Sanh - 1Kg.jpg');
INSERT INTO `image` VALUES (7, 7, 'images/Bo 034 Canh Tac - 500g.jpg');
INSERT INTO `image` VALUES (8, 8, 'images/Buoi Dien Organic Moc An.jpg');
INSERT INTO `image` VALUES (9, 9, 'images/Dua Hau Adam Co Hat TN (Org Watermelon) - 1kg.jpg');
INSERT INTO `image` VALUES (10, 10, 'images/Cam Xoan Ngot - 1Kg.jpg');
INSERT INTO `image` VALUES (11, 11, 'images/Bo Booth Org - 1kg.jpg');
INSERT INTO `image` VALUES (12, 12, 'images/Oi Sunny - 1kg.jpg');
INSERT INTO `image` VALUES (13, 13, 'images/Xoai Cat Chu - 1kg.jpg');
INSERT INTO `image` VALUES (14, 14, 'images/Thanh Long Tim Ruot Do Org - 1kg.jpg');
INSERT INTO `image` VALUES (15, 15, 'images/Buoi Da Xanh Loai 1 - 1kg.jpg');
INSERT INTO `image` VALUES (16, 16, 'images/Dua Le Hong Kim - 1kg.jpg');
INSERT INTO `image` VALUES (17, 17, 'images/Viet Quat My - 125g.jpg');
INSERT INTO `image` VALUES (18, 18, 'images/Bo Sap Giong Co - 1Kg.jpg');
INSERT INTO `image` VALUES (19, 19, 'images/Trai Tam Bop Nam My (Golden Berry) - 300g.jpg');
INSERT INTO `image` VALUES (20, 20, 'images/Vu Sua Bo Hong.jpg');
INSERT INTO `image` VALUES (21, 21, 'images/Dua Luoi Giong Nhat Ruot Cam - 1kg.jpg');
INSERT INTO `image` VALUES (22, 22, 'images/Dua Hau Khong Hat SEL Organicfood - 3kg.jpg');
INSERT INTO `image` VALUES (23, 23, 'images/Xoai Cat Hoa Loc Sel Loai Dac Biet - 1kg.jpg');
INSERT INTO `image` VALUES (24, 24, 'images/Tao Juliet Size Nho 125 - 1kg.jpg');
INSERT INTO `image` VALUES (25, 25, 'images/Thanh Nhan - Hop 1kg.jpg');
INSERT INTO `image` VALUES (26, 26, 'images/Kiwi vang - 500g.jpg');
INSERT INTO `image` VALUES (27, 27, 'images/Le Ma Hong Nam Phi - 1kg.jpg');
INSERT INTO `image` VALUES (28, 28, 'images/Trai Sung My Tuoi OrganicFood - 500g.jpg');
INSERT INTO `image` VALUES (29, 29, 'images/Việt Quất Jumpo - 125g.jpg');
INSERT INTO `image` VALUES (30, 30, 'images/Cam Vang Uc - 1kg.jpg');
INSERT INTO `image` VALUES (31, 31, 'images/Hong Gion Han Quoc - Tui 1kg.jpg');
INSERT INTO `image` VALUES (32, 32, 'images/Nho Xanh Ninh Thuan OrganicFood - 1kg.jpg');
INSERT INTO `image` VALUES (33, 33, 'images/Quyt Vang Uc - 1kg.jpg');
INSERT INTO `image` VALUES (34, 34, 'images/Tao Fuji Newzealand - 1kg.jpg');
INSERT INTO `image` VALUES (35, 35, 'images/Luu Thai Lan - 1kg.jpg');
INSERT INTO `image` VALUES (36, 36, 'images/Tao Daisy Girl Organic.jpg');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int(11) NOT NULL,
  `discounted_price` int(11) NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Thơm (Dứa) - 1 trái', 55000, NULL, 1, 'Thơm, Dứa hay khóm (có nơi gọi là khớm) hay gai (miền Trung) hoặc trái huyền nương, tên khoa học Ananas comosus, là một loại quả nhiệt đới. \r\nQuả dứa thực ra là trục của bông hoa và các lá bắc mọng nước tụ hợp lại. Còn quả thật là các \"mắt dứa\".Quả dứa được ăn tươi hoặc đóng hộp dưới dạng khoanh, miếng hoặc đồ hộp nước dứa, hoặc nước quả hỗn hợp. Quả dứa có hàm lượng axit hữu cơ cao (axit malic và axit xitric). \r\nDứa là nguồn cung cấp mangan dồi dào cũng như có hàm lượng Vitamin C và Vitamin B1 khá cao. \r\nTrong quả dứa có chứa enzym bromelain, có thể phân huỷ protein. Do vậy, quả dứa được sử dụng trong chế biến một số món ăn như thịt bò xào, thịt vịt xào để giúp thịt nhanh mềm và tạo hương vị đặc trưng.', 'giảm giá', 50);
INSERT INTO `product` VALUES (2, 'Dưa Hấu Có Hạt Quế Lâm - 1kg', 59000, NULL, 2, 'Dưa hấu hữu cơ Quế Lâm là chủng Dưa hấu Thành Long được trồng hoàn toàn theo hướng hữu cơ, sử dụng 100% phân hữu cơ của tập đoàn Quế Lâm:\r\n\r\n+ Không thuốc diệt cỏ\r\n\r\n+ Không thuốc trừ sâu\r\n\r\n+ Không chất bảo quản\r\n\r\n+ Không chất kích thích tăng trưởng\r\n\r\n+ Không dư lượng hóa chất độc hại.', 'mới', 50);
INSERT INTO `product` VALUES (3, 'Chuối Sứ - 1kg', 65000, NULL, 3, 'Chuối sứ hay gọi là chuối Xiêm, là một giống chuối có nguồn gốc từ Thái Lan, thân chuối ngắn, hai đầu thon nhỏ, phần giữa to tròng, chắc thịt. Tại Organicfood, chuối sứ được chọn từ giống tốt nhất và gieo trồng trong môi trường phù hợp nhất (đất tơi xốp, nhiều mùn, không bị ngập úng, độ pH duy trì ở mức 5 – 7) sẽ giữ nguyên vị ngon và chất dinh dưỡng vốn có.', 'giảm giá', 50);
INSERT INTO `product` VALUES (4, 'Đu Đủ Ruột Vàng - 1kg', 75000, NULL, 4, 'Công dụng: Đu đủ có ruột vàng, ăn có vị ngọt thanh. Ngoài ra, đu đủ có chứa chất chống oxy hóa tốt cho cơ thể là carotenoid, nhất là lycopene, giúp cơ thể hấp thụ tốt hơn các chất chống oxy hóa trong các loại trái cây và rau quả khác. Vitamin C và lycopene có trong đu đủ còn hỗ trợ bảo vệ làn da và giảm các dấu hiệu lão hóa như các nếp nhăn trên da mặt.\r\n\r\nGợi ý sử dụng: Đu đủ có thể ăn trực tiếp, nấu canh với sườn, làm sinh tố,...\r\n\r\nHướng dẫn bảo quản: Bảo quản trong ngăn mát tủ lạnh.\r\n\r\nHạn sử dụng: 3 - 6 ngày tùy điều kiện bảo quản.', 'mới', 50);
INSERT INTO `product` VALUES (5, 'Chanh Leo Vàng - 500g', 75000, NULL, 5, 'Màu sắc Vỏ bóng, mịn, màu vàng. Thịt quả bên trong nhiều nước, màu vàng ươm bắt mắt. Hạt màu đen. Hương vị Hương thơm đặc trưng hấp dẫn của Chanh leo vàng. Vị ngọt thanh. Hàm lượng dưỡng chất Chanh leo vàng chứa nhiều dưỡng chất giá trị cho sức khỏe như: Vitamin C tăng cường sức đề kháng. Vitamin A tốt cho mắt. Kali củng cố hệ cơ xương, giúp cơ thể khỏe mạnh, dẻo dai. Công dụng Giải khát. Làm đẹp da. Chống lão hoá. Ổn định đường huyết. Bảo vệ tim mạch. Ngăn ngừa các bệnh hô hấp. Hỗ trợ phòng và điều trị bệnh ung thư. Cách sử dụng Dùng ngay khi thích. Dùng làm nước giải khát ngày hè. Cách bảo quản Bảo quản nơi thoáng mát, tránh ánh nắng trực tiếp. Để duy trì độ ngọt và tươi, bạn nên để Chanh dây trong ngăn mát tủ lạnh. Nhiệt độ từ 6-8 độ C.', 'giảm giá', 50);
INSERT INTO `product` VALUES (6, 'Cam Sành - 1Kg', 75000, NULL, 6, 'Cam sành hữu cơ là loại cam quen thuộc của vùng nhiệt đới Việt Nam. Quả cam sành rất dễ nhận ra nhờ lớp vỏ dày, sần sùi giống bề mặt mảnh sành, và thường có màu lục nhạt (khi chín có sắc cam), các múi thịt có màu cam. Cam sành tại Organic được chọn lựa kỹ càng từ chính nông trại của Organic được chứng nhận USDA, Organic EU, đảm bảo sạch, không hóa chất, không thuốc tăng trưởng, các chất làm biến đổi gen. Có nhiều size theo cân nặng, đáp ứng đủ các nhu cầu của khách hàng,… Cam trái to, mọng nước, vị ngọt chua thanh mát,…   \r\nCÔNG DỤNG Cam sành giàu vitamin C, vitamin A, canxi, chất xơ… rất bổ dưỡng cho cơ thể phụ nữ mang thai. Vitamin B9 (axit folic) có trong cam sành vô cùng quan trọng, đặc biệt đối với bà bầu hoặc những người đang cố gắng thụ thai. Cam sành giúp ngăn ngừa một số loại khuyết tật bẩm sinh, tăng sức đề kháng và giúp sản xuất các tế bào máu khỏe mạnh. Ngoài ra chất limonoid trong nước cam giúp ngăn ngừa bệnh ung thư và có tác dụng giải độc, lợi tiểu.   \r\nCÁCH BẢO QUẢN Bảo quản lạnh để giữ sản phẩm tươi ngon lâu hơn', 'mới', 50);
INSERT INTO `product` VALUES (7, 'Bơ 034 Canh Tác - 500g', 87500, NULL, 7, 'Bơ 034 được canh tác tại farm đạt #chứng_nhận_hữu_cơ #USDA và #EU. \r\nBơ béo ngậy, dẻo thơm, cơm vàng đậm không chút đắng và không có chỉ đen. Bơ dùng để làm sinh tố béo bùi hấp dẫn lắm ạ, mà cắt ra ăn không để cảm nhận bơ một cách tự nhiên thì rất tuyệt vời. Đối với trẻ ăn dặm thì bơ chính là món ăn bổ dưỡng mà mẹ nên ưu tiên đấy ạ', NULL, 50);
INSERT INTO `product` VALUES (8, 'Bưởi Diễn Mộc Ân', 89000, NULL, 8, 'BƯỞI DIỄN ORGANIC MỘC ÂN\r\nKhác biệt với các loại bưởi miền Nam hay có vị chua, bưởi Diễn có vị ngọt đậm đà, càng để lâu càng ăn ngon. Quả bưởi có kích thước nhỏ, múi bưởi có tôm vàng óng, hạt bên trong se nhỏ, hương thơm thoang thoảng, khi ăn xong, vị ngọt còn lưu mãi ở đầu lưỡi. Loại bưởi này cũng rất giàu vitamin như A, C, E... cùng nhiều axit tự nhiên tốt cho sức khỏe, giúp chống lão hóa, phòng ngừa ung thư, giảm mỡ máu, ngăn ngừa sỏi thận, làm đẹp da. Đặc biệt, chất pectin trong múi bưởi giúp giảm lượng cholesterol trong máu nên hỗ trợ tốt cho người bị béo phì tiểu đường. \r\nBưởi Diễn Mộc Ân là sản phẩm hữu cơ đầu tiên và duy nhất tại Việt Nam đạt tiêu chuẩn hữu cơ/ORGANIC Quốc gia với 8 không: \r\n✔ Không thuốc trừ sâu, \r\n✔ Không phân bón hóa học, \r\n✔ Không thuốc diệt cỏ, \r\n✔ Không sử dụng hóa chất, \r\n✔ Không thuốc kích thích, \r\n✔ Không đánh bồn và sáo xới gốc cây, \r\n✔ Không tiện gốc và cành, \r\n✔ Không quét và bón vôi vào gốc cây.\r\nĐặc biệt hơn, với vai trò là đơn vị phân phối độc quyền Bưởi Diễn Organic Mộc Ân ở miền Nam, Organicfood.vn - Organic Convenience Store hân hạnh mang đến cho những khách hàng “đã lỡ” si mê giống bưởi vừa có mùi thơm thoang thoảng lại có vị ngọt đậm đà này chương trình ưu đãi lên đến 37% nhân dịp khai trương. Đến và trải nghiệm ngay nhé các bạn!', NULL, 50);
INSERT INTO `product` VALUES (9, 'Dưa Hấu Adam Có Hạt  TN (Org Watermelon) - 1kg', 90000, NULL, 2, 'Được trồng tại trang trại được chứng nhận USDA, EU. Là các sản phẩm được canh tác nghiêm ngặt theo tiêu chuẩn Organic, tuyệt đối không sử dụng phân bón hoá học, thuốc trừ sâu, kích thích tăng trưởng,... Rất yên tâm để sử dụng cho cả gia đình, đặc biệt là những người có thể trạng không khỏe mạnh.', NULL, 50);
INSERT INTO `product` VALUES (10, 'Cam Xoàn Ngọt - 1Kg', 95000, NULL, 6, 'Cam xoàn nhà O từ vườn cam xoàn đạt các tiêu chuẩn hữu cơ, có độ tuổi trên 5 năm, nên cho trái già, căng mọng, thơm lừng và ngọt đậm vị tự nhiên.\r\n\r\nToàn bộ trái lứa này to, rám quả, vị ngọt đậm và thơm, đặc biệt vỏ rất mỏng, mọng nước.', NULL, 50);
INSERT INTO `product` VALUES (11, 'Bơ Booth Org - 1kg', 95000, NULL, 7, 'Bơ booth là loại bơ dẻo ngon mới xuất hiện tại Việt Nam vài năm gần đây. Bơ booth được yêu thích bởi thịt dẻo thơm, cùng giá trị dinh dưỡng cao mà nó mang lại.\r\nNghiên cứu gần đây cũng cho thấy khi dùng thêm bơ trong chế biến các món nước sốt, hay trộn salad sẽ giúp cơ thể thúc đẩy quá trình hấp thụ các chất dinh dưỡng khác như alpha-carotene, beta-carotene, carotenoids.', NULL, 50);
INSERT INTO `product` VALUES (12, 'Ổi Sunny - 1kg', 98000, NULL, 9, '- Vỏ Mỏng, Ngọt Thanh\r\n\r\n- Chuẩn Farm USDA/EU Organic.', NULL, 50);
INSERT INTO `product` VALUES (13, 'Xoài Cát Chu - 1kg', 98000, NULL, 10, 'Xoài cát chu với hương thơm nồng nàn quyến rũ, là trái cây có vị ngọt đậm đà hấp dẫn khó chối từ. Xoài cát chu ngọt nhất khi chín vàng, ấn nhẹ tay mềm nhưng chắc. Xoài chứa vitamin dồi dào cung cấp năng lượng, tăng cường đề kháng cho cơ thể khỏe mạnh.', NULL, 50);
INSERT INTO `product` VALUES (14, 'Thanh Long Tím Ruột Đỏ Org - 1kg', 98000, NULL, 11, 'Tác dụng của thanh long đỏ đối với sức khỏe\r\nGiúp tiêu hóa tốt\r\n\r\nThành phần chất xơ chứa trong trái thanh long ruột đỏ cũng rất cao so với các loại trái cây khác, bao gồm cả 2 loại chất xơ không hòa tan (cellulose) và chất xơ hòa tan (pectin) giúp điều hòa hoạt động của hệ tiêu hóa, làm giảm các chất nguy hiểm đối với cơ thể như: các chất béo, cholesterol, các độc chất… làm giảm nguy cơ bị mụn, nhọt trên da.\r\n\r\nTốt cho tim, người mắc chứng tiểu đường\r\n\r\nLượng chất xơ cao trong thanh long tốt cho nghững người mắc bệnh tiểu đường. Ngoài ra, thanh long còn có tác dụng tuyệt vời trong việc làm giảm lượng cholesterol xấu và tăng mức cholesterol tốt trong cơ thể. Thanh long là một nguồn tuyệt vời chất béo không bão hòa đơn, giúp cho trái tim bạn nghỉ ngơi trong tình trạng thái tốt.\r\n\r\nLà loại quả giàu vitamin C\r\nThanh long tươi hoặc sấy khô là nguồn giàu vitamin C, rất cần thiết cho cơ thể trong việc giúp cải thiện hệ miễn dịch và tăng cường sức khỏe.\r\n\r\nPhong phú vitamin nhóm B\r\nTrái thanh long có chứa các loại vitamin nhóm B, như vitamin B1 (thiamine), có tác dụng xử lý carbohydrate (bao gồm chất xơ, tinh bột và đường) một cách nhanh chóng, giúp tạo ra năng lượng cho cơ thể; vitamin B3 (niacien) giúp làn da sáng bóng, mịn màng; vitamin B12 giúp tạo cảm giác ngon miệng, đặc biệt tốt đối với người bệnh trong quá trình điều dưỡng.\r\n\r\nLoại quả giàu protein\r\nThanh long là nguồn phong phú protein – một chất dinh dưỡng thiết yếu giúp cơ thể hình thành các kích thích tố, men tiêu hóa và hóa chất, có tác dụng giúp tăng cường sức khỏe.\r\n\r\nThanh long có nhiều hạt nhỏ chứa chất béo không bão hòa, rất tốt cho sức khỏe, bởi vì nó giúp làm tăng cholesterol tốt và loại bỏ cholesterol xấu. Nhiều khoáng chất có ích: Các khoáng chất chứa trong trái thanh long bao gồm phốt pho và canxi. Cả hai khoáng chất này đóng vai trò thiết yếu trong quá trình hình thành của xương, răng và phát triển các tế bào.\r\n\r\nLoại quả chống oxy hóa cực kỳ tốt\r\nThanh long cũng là nguồn phong phú chất chống oxy hóa, có chức năng ngăn chặn sự tấn công của các gốc tự do gây hại, vốn là tác nhân gây ung thư và các vấn đề sức khỏe khác.\r\n\r\nNgừa táo bón\r\nKhi bị táo bón, bạn có thể cải thiện tình hình nhanh chóng bằng cách ăn thanh long, vì đây là trái chứa nhiều chất xơ.\r\n\r\nKiểm soát đường huyết\r\nCác thành phần chứa trong trái thanh long đã được chứng minh có tác dụng giúp ổn định mức đường huyết, đặc biệt tốt cho những người mắc bệnh tiểu đường típ 2.\r\n\r\nỔn định huyết áp\r\nĂn thanh long có thể giúp ổn định huyết áp, mang lại nhiều lợi ích cho những người có nguy cơ bị nhồi máu cơ tim hoặc đột quỵ.\r\n\r\nTrung hoà độc tố\r\nĐể giúp vô hiệu hóa các loại độc tố trong cơ thể như thủy ngân, thạch tín và những chất khác gây nguy hiểm cho sức khỏe, bạn nên thường xuyên ăn thanh long.\r\n\r\nCải thiện thị lực\r\nCũng như cà rốt, thanh long có chứa nhiều carotene, có tác dụng duy trì và cải thiện thị lực.\r\n\r\nGiảm ho và suyễn\r\nHo và hen suyễn là một số rối loạn hô hấp thường ảnh hưởng đến cả trẻ em và người lớn. Để giảm các triệu chứng khó chịu này, bạn chỉ cần siêng ăn thanh long.\r\n\r\n \r\n\r\nTác dụng của thanh long đỏ trong làm đẹp\r\nLàm đẹp da, giữ gìn vóc dáng\r\nQuả thanh long ruột đỏ có đặc tính hoàn toàn khác so với loại. Thành phần dinh dưỡng của thanh long ruột đỏ được đánh giá là gấp đôi thanh long ruột trắng.\r\n\r\nGiúp giảm béo\r\nThành phần của thanh long ruột đỏ hoàn toàn không chứa chất béo, cùng với mức năng lượng thấp và giàu chất xơ giúp giữ gìn cơ thể tránh khỏi hiện tượng béo phì, kẻ thù nguy hiểm nhất cho sắc đẹp và sức khỏe của phụ nữ.\r\n\r\nBảo vệ tóc khi làm hóa chất\r\nNước trái cây thanh long là một dưỡng chất tuyệt vời cho tóc nhuộm hoặc tóc đã qua xử lý hóa học. Bằng cách thoa nước ép thanh long hoặc một sản phẩm chiết xuất từ quả thanh long lên da đầu của bạn, bạn có thể bảo vệ mái tóc đã nhuộm hoặc đã qua xử lý hóa học của bạn.\r\n\r\nNước ép thanh long giữ cho các nang lông mở, giúp cho mái tóc của bạn khỏe mạnh và mềm mượt.\r\n\r\nNgoài việc dùng làm nước ép, sinh tố, thanh long ruột đỏ còn được chế biến thành nhiều món tráng miệng thú vị: rau câu thanh long, chè thanh long hoặc các món mặn: salad thanh long, gà tiềm thanh long…\r\n\r\nCách bảo quản thanh long\r\nNên rửa sạch vỏ ngoài trái thanh long trước khi ăn, mặc dù chúng ta ăn ở bên trong vỏ. Nhưng để tránh vi khuẩn gây bệnh lây nhiễm khi cắt thanh long, tốt nhất chúng ta vẫn nên rửa sạch.\r\n\r\nTốt nhất chúng ta nên ăn ngay khi mới mua thanh long về, nếu như cần cất giữ thì nên để chỗ thoáng mát.\r\n\r\nKhông nên bảo quản thanh long trong tủ lạnh, để tránh nhiệt độ lạnh làm hư hại dẫn đến biến chất.', NULL, 50);
INSERT INTO `product` VALUES (15, 'Bưởi Da Xanh Loại 1 - 1kg', 110000, NULL, 8, 'Bưởi da xanh tại Organic đươc chọn lựa kỹ càng từ chính nông trại của Organic, đảm bảo sạch, không hóa chất, không thuốc tăng trưởng, các chất làm biến đổi gen. Có nhiều size theo cân nặng, đáp ứng đủ các nhu cầu của khách hàng, cùi vỏ mỏng, múi to, mọng nước, ngọt thơm thanh dịu,… \r\nBưởi da xanh hữu cơ (USDA, EU) vỏ tươi xanh - bày mâm ngũ quả hoặc dâng hương ngày Tết rất sang trọng. Đặc biệt, bưởi bảo quản được lâu, sau Tết dùng khỏi sợ hư như các loại trái cây khác. Bưởi ruột hồng, tép mọng nước, vị ngọt, ăn siêu thích nhé chị em! ', NULL, 50);
INSERT INTO `product` VALUES (16, 'Dưa Lê Hồng Kim - 1kg', 119000, NULL, 12, 'DƯA LÊ HỒNG KIM HỮU CƠ\r\nDưa lê Hồng Kim hay dưa Kim Hồng Ngọc, có xuất xứ từ Thái lan, được canh tác theo phương thức hoàn toàn hữu cơ (organic). Trọng lượng quả tầm 1-1,9kg\r\n\r\nDưa Kim Hồng Ngọc có các đặc điểm như:\r\n- Bên ngoài: hình cầu, vỏ màu vàng chanh.\r\n- Bên trong: ruột cam, mùi thơm nhẹ, vị thanh, thịt rất giòn.\r\n\r\nĂn dưa lê có công dụng gì?\r\n- Dưa không những thơm ngon, ăn mát ruột mà còn giàu chất xơ, giàu vitamin C, A, B, folate…\r\n- Ăn dưa lê thường xuyên sẽ tốt cho mắt, tim mạch, phòng ngừa bệnh ung thư, tăng cường hệ miễn dịch,...\r\n- Dưa có thể dùng trực tiếp hoặc với đá, đường, xay sinh tố, ép lấy nước...', NULL, 50);
INSERT INTO `product` VALUES (17, 'Việt Quất Mỹ - 125g', 119000, NULL, 13, 'Mô tả chung: Việt quất organic Mỹ là loại Việt quất được được chứng nhận hữu cơ bởi USA\r\nThông tin sản phẩm: Việt quất có rất nhiều loại, một số loại có giá trị dinh dưỡng cao và quen thuộc trong cuộc sống hằng ngày như việt quất đen, việt quất xanh, nam việt quất, việt quất đầm lầy,…\r\nQuả việt quất chứa đầy đủ các loại dinh dưỡng thiết yếu để cơ thể hoạt động khỏe mạnh như vitamin K ,E, C, A, các khoáng chất và chất xơ. Đặc biệt loại quả này chứa vitamin B-complex, tức là B-6, pantothenic acid, riboflavin, niacin và acid folic giúp cơ thể chuyển hóa protein, chất béo, carbohydrate.\r\nCác nghiên cứu đã chứng minh rằng khi ăn loại quả việt quất, bạn không những giảm được nguy cơ mắc bệnh béo phì, tiểu đường, tim mạch, mà còn có làn da và mái tóc khỏe mạnh. Bạn sẽ trông tươi trẻ, tràn đầy năng lượng và có một vóc dáng cân đối.\r\nHướng dẫn sử dụng: Dùng trực tiếp hoặc chế biến các món ăn\r\nBảo quản: Bảo quản ở nhiệt độ mát', NULL, 50);
INSERT INTO `product` VALUES (18, 'Bơ Sáp Giống Cổ - 1Kg', 119000, NULL, 7, 'Bơ DakLak tại Organic được chọn lựa kỹ càng từ chính nông trại của Organic, đảm bảo sạch, không hóa chất, không thuốc tăng trưởng, các chất làm biến đổi gen. Có nhiều size theo cân nặng, đáp ứng đủ các nhu cầu của khách hàng,… Bơ trái to, thịt bơ béo ngậy, ruột vàng hấp dẫn,… \r\nCÔNG DỤNG Bơ sáp chứa lượng axit oleic phòng chống bệnh ung thư hiệu quả, không gây béo phì, giúp cải thiện thị lực, nhiều chất xơ và là liệu pháp làm đẹp hiệu quả   \r\nCÁCH BẢO QUẢN Bảo quản lạnh để giữ sản phẩm tươi ngon lâu hơn', NULL, 50);
INSERT INTO `product` VALUES (19, 'Trái Tầm Bóp Nam Mỹ (Golden Berry) - 300g', 119700, NULL, 14, 'Thông tin sản phẩm đang được cập nhật', NULL, 50);
INSERT INTO `product` VALUES (20, 'Vú Sữa Bơ Hồng', 120000, NULL, 15, 'Vú sữa có lượng vitamin C là chất chống oxy hóa cho cơ thể: 100 gram vú sữa cung cấp khoảng 57% lượng vitamin cho cơ thể. Vì vậy, ăn vú sữa giúp tăng sức đề kháng chống lại các tác nhân truyền nhiễm.Vú sữa còn chứa canxi, phốt pho, sắt và magie tốt cho thai phụ và sự phát triển của thai nhi. Vú sữa còn cung cấp năng lượng từ gluxit giúp phát triển tế bào thần kinh. Bên cạnh đó, vú sữa có chứa nhiều nước và hàm lượng chất xơ khá cao, rất phù hợp cho những người muốn giảm cân.Vú sữa nhà Organicfood.vn được trồng tại Tây Ninh, được trồng theo hướng hữu cơ, hoàn toàn không sử dụng chất hóa học trong suốt quá trình trồng cây, mang đến nguồn dưỡng chất tốt cho người dùng.\r\n\r\nĐây có thể được coi là một trong những loại trái cây cung cấp nguồn dưỡng chất vô cùng cần thiết cho cơ thể nên quy trình sản xuất cũng như trồng trọt hết sức nghiêm ngặt.', NULL, 50);
INSERT INTO `product` VALUES (21, 'Dưa Lưới Giống Nhật Ruột Cam - 1kg', 135000, NULL, 16, 'Dưa lưới Biển Hoàng Gia - SeaRoyal được canh tác theo quy trình định hướng Organic đạt tiêu chuẩn JAS Nhật Bản khắt khe đánh giá, Dưa lưới Biển Hoàng Gia - SeaRoyal của DannyGreen cho độ ngọt thanh mà vẫn giữ được hàm lượng dinh dưỡng cao.\r\n - Xuất xứ giống: Nhật Bản. \r\n- Hình dạng: tròn đều, vỏ xanh nhạt có vân lưới nhẹ. \r\n- Bên trong: ruột cam, mềm, vị ngọt thanh. \r\n- Tiêu chuẩn/ Chứng nhận: JAS \r\n- Thời gian sử dụng: Sẵn sàng thưởng thức, bảo quản tốt hơn trong ngăn mát.  \r\n- Nhà sản xuất: Seagull ADC \r\nTheo các nhà nghiên cứu Pháp, thay đổi thói quen dùng dưa lưới mỗi ngày có thể giúp chúng ta giảm tải căng thẳng và mệt mỏi một cách hiệu quả. Lớp vỏ dày bảo vệ bên ngoài nên phần ruột bên trong luôn mọng nước (88%), hàm lượng potassium (300 mg/100g) đáng kể nên dưa lưới có tính năng thanh lọc, lợi tiểu, chất xơ (1g/100g) giúp nhuận trường, ít calories (48 Kcal), Beta- Carotene và vitamin C. \r\n1. Phòng chống ung thư: Dưa lưới là nguồn chứa chất chống oxy hóa dạng polyphenol, phòng bệnh ung thư và tăng cường hệ miễn dịch, có khả năng ngăn ngừa căn bệnh ưng thu ruột và những khối u ác tính khác. \r\n2. Tốt cho hệ tiêu hóa: Lượng Enzyme tiêu hoá trong dưa lưới nhiều hơn cả đu đủ và xoài. Ngoài ra, hàm lượng chất xơ nên có tác dụng nhuận trường và chống táo bón. \r\n3. Ngăn ngừa các bệnh liên quan đến tim mạch: Dưa lưới chứa chất chống oxy hóa dạng polyphenol có tác dụng điều tiết sự hình thành nitric oxit, một chất quan trọng đối với nội mạc và hệ tim mạch. \r\n4. Hỗ trợ làm đẹp: Dưa lưới tốt cho người giảm cân vì không chứa nhiều calories. Chúng ta có thể chế biến nhiều món ăn từ dưa lưới như các món sinh tố/ nước é, đến các món ăn vặt hoặc các ăn đậm chất Tây Âu. Đây còn là nguồn dinh dưỡng phong phú chứa nhiều beta-carotene, axit folic, kali, vitamin C, A, giúp cải thiện làn da khỏe và cải thiện thị lực. \r\n5. Giảm căng thẳng, mệt mỏi: Theo các nhà nghiêm cứu Pháp, trong dưa lưới có Enzyme Superoxyd Dismutase (SOD) giúp cải thiện tình trạng căng thẳng kéo dài về thể chất lẫn tinh thần. SOD được xem như một Enzyme mạnh hơn các vitamin chống oxy hóa khác.', NULL, 50);
INSERT INTO `product` VALUES (22, 'Dưa Hấu Không Hạt SEL 3kg', 144000, NULL, 2, 'Dưa hấu (tên khoa học: Citrullus lanatus) là một loài thực vật trong họ Bầu bí (Cucurbitaceae), một loại trái cây có vỏ cứng, chứa nhiều nước, có nguồn gốc từ miền nam châu Phi và là loại quả phổ biến nhất trong họ Bầu bí. \r\nDưa hấu có tính hàn có thể dùng làm thức ăn giải nhiệt trong những ngày hè nóng nực. \r\nDưa hấu rất đa dạng về hình dạng và màu sắc. có màu xanh nhạt và có những đường kẻ từ trên xuống dưới Hình dạng được xem xét với mặt phẳng cắt ngang từ cuống trái đến đuôi trái dưa. \r\nCó các dạng chính sau: dạng thuôn dài, dạng trái oval, dạng trái tròn. Hạt dưa cũng rất đa dạng về kích cỡ (lớn, trung bình, nhỏ). Màu hạt có màu đen. Dưa hấu không thể thiếu trên bàn thờ tổ tiên ông bà trong những ngày Tết. Là vật liệu cho các tài nhân khắc hình họa lên vỏ của dưa hấu. \r\nDưa hấu tại Organicfood.vn là dưa hấu được trồng theo hướng hữu cơ.', 'mới', 50);
INSERT INTO `product` VALUES (23, 'Xoài Cát Hòa Lộc Sel Loại Đặc Biệt - 1kg', 145000, NULL, 10, 'Xoài Cát Hòa Lộc được một người tá điền tên là Ấp Lời trồng đầu tiên tại xã Hòa Lộc, quận Giáo Đức, tỉnh Định Tường vào năm 1930. Đây là vùng đất phù sa ven sông nên giàu chất dinh dưỡng, rất thích hợp cho loại xoài sinh trưởng và phát triển, và bắt đầu nổi tiếng từ những năm 1939 -1940 sau khi đoạt giải cao trong các cuộc đấu xảo, giống xoài Cát này đã trở thành đặc sản quý, được dâng lên tế lễ nơi đình thần, mà di tích ngày nay là đình thần Hòa Lộc. \r\nĐây là loại xoài cát có dạng quả thuôn dài, tròn mình, eo rốn quả rõ, đỉnh quả nhọn, bầu tròn gần cuống. Vỏ quả khi chín màu vàng tươi, vỏ mỏng, phủ lớp phấn trắng mịn, có đốm nhỏ, màu nâu đen, đốm dạng tròn; thịt quả màu vàng tươi, dày, độ chắc thịt cao, mịn, dẻo, ít xơ. Quả có vị rất ngọt, mùi thơm dịu đặc trưng.', NULL, 50);
INSERT INTO `product` VALUES (24, 'Táo Juliet Size Nhỏ 125 - 1kg', 145000, NULL, 17, 'JULIET là loại táo duy nhất trên thế giới được sản xuất độc quyền trong canh tác hữu cơ. Táo được trồng độc quyền tại Pháp và chỉ được trồng hữu cơ.\r\nTại Pháp, táo Juliet Organic thực sự rất phổ biến và được ưa chuộng. Nó thậm chí có cả nhân vật hoạt hình làm biểu tượng riêng mà chưa giống táo nào khác có\r\nTáo tráng miệng hữu cơ có hương thơm khá thu hút, vị ngọt cân bằng, giòn ngon miệng.\r\n\r\nTáo Juliet được thu hoạch từ đầu tháng 10 đến giữa tháng 11.\r\n\r\nTáo tráng miệng hữu cơ Juliet phù hợp cho các mục đích sử dụng khác nhau: hoàn toàn tự nhiên, nó có thể được ăn cả quả, và không gọt vỏ! Trong nấu ăn, , táo Juliet là một nguyên liệu tuyệt vời trong nấu ăn và làm bánh hoặc nước ép..\r\n\r\nTáo Juliet® được bảo quản trong tủ lạnh ở nhiệt độ 2 ° C. Nhờ lớp da dày, táo Juliet bảo quản khá tốt. Chúng có thể được lưu trữ trong vài tuần, hoặc thậm chí vài tháng, nếu được giữ ở nơi khô, lạnh.', NULL, 50);
INSERT INTO `product` VALUES (25, 'Thanh Nhãn - Hộp 1kg', 145000, NULL, 18, '- Một loại nhãn có tên rất độc đáo, lại đang gây sốt trên thị trường. Hiện đã có mặt tại nhà Org rồi đây ạ. Thanh Nhãn được trồng theo phương thức hữu cơ 100% có lớp cơm dày màu vàng nhạt, xoắn và cuộn lại từng lớp như bắp cải, ăn giòn, có vị ngọt và hạt rất nhỏ. - Thanh Nhãn ngon nhất là khi chín cây trữ ở tủ mát, chúng sẽ có mùi thơm hấp dẫn cùng với độ ngọt lịm khác biệt. Tách vỏ ra, bạn sẽ thấy lớp cơm săn chắc, che khuất hẳn hạt bên trong, ăn đến đâu lại nghiện đến đó.', NULL, 50);
INSERT INTO `product` VALUES (26, 'Kiwi vàng - 500g', 145000, NULL, 19, 'Trái kiwi vốn được coi là loại quả rất tốt cho sức khỏe vì chứa nhiều vitamin và khoáng chất.New Zealand không phải là nước trồng nhiều kiwi nhất trên thế giới nhưng kiwi ZESPRI® của New Zealand lại là loại kiwi số 1 thế giới, chiếm tới 20% thị phần thị trường kiwi toàn cầu 2010*.\r\nVới quy trình trồng, kiểm tra chất lượng và vận chuyển chuyên nghiệp được kiểm soát nghiêm ngặt, ZESPRI luôn đảm bảo cung cấp ra thị trường những trái kiwi chất lượng đồng đều và  hương vị luôn tươi ngon. Chính vì thế ZESPRI® là kiwi được ưa chuộng nhất thế giới.\r\nsự khác nhau giữa kiwi vàng và kiwi xanh\r\n\r\nCó 2 loại trái kiwi ZESPRI®  được bán ở Việt Nam. Kiwi xanh ZESPRI® GREEN và Kiwi vàng ZESPRI® GOLD.  Kiwi ZESPRI® GREEN không chua như mọi người thường nghĩ về loại kiwi có ruột màu xanh, nó có vị ngọt thanh hơi chua dịu và tươi mát . Kiwi vàng ZESPRI® GOLD có vị ngọt sắc của trái cây nhiệt đới. \r\n\r\nHệ thống quản lý chất lượng từ nhà vườn tới kênh bán lẻ Công ty ZESPRI International Limited là công ty phân phối kiwi chất lượng cao lớn nhất thế giới với quả kiwi ZESPRI® có mặt tại hơn 60 quốc gia. Đó là bởi ZESPRI International Limited đã thực hiện 3 nguyên tắc cơ bản: tính toàn diện, hướng tới quyền lợi khách hàng và liên tục\r\n\r\ncải tiến. Hàng năm, hàng triệu quả kiwi ZESPRI® được bán ra đều phải đáp ứng các quy định nghiêm ngặt nhất về tiêu chuẩn môi trường và an toàn thực phẩm.\r\n\r\nKIWI VÀNG HỮU CƠ ZESPRI NEW ZEALAND \r\n\r\nVị trí của vườn trồng được lựa chọn cẩn thận để trái cây có thể phát triển tốt. Khi cây đã lớn, chúng được cắt tỉa thường xuyên để đảm bảo có đủ ánh sáng và không khí. Đây là cách tự nhiên để tránh nhiều sâu bệnh hại và nấm.\r\n\r\nVới phương châm bảo vệ môi trường, sau khi thu hoạch và được kiểm tra chất lượng và đóng gói,kiwi xanh ZESPRI® GREEN và kiwi vàng ZESPRI® GOLD được lưu trữ trong kho lạnh và vận chuyển tới các nhà phân phối trong điều kiện nhiệt độ ổn định lý tưởng từ 0 đến 4 độ. Điều kiện này đảm bảo rằng trái cây “ngủ” và sẵn sàng đưa ra thị trường mà không bổ sung bất kỳ tác nhân hóa học nào. Bao bì ZESPRI® là 100% tái chế,\r\n\r\ntái sử dụng. Trong quá trình vận chuyển, để giảm khí lượng khí thải đến mức tối đa, ZESPRI® chỉ sử dụng các tàu chở hàng đông lạnh thay cho các container.', NULL, 50);
INSERT INTO `product` VALUES (27, 'Lê Má Hồng Nam Phi - 1kg', 145000, NULL, 20, 'Lê Nam Phi là loại lê có 3 màu đặc trưng là Xanh – Đỏ - Vàng xen kẽ nhau rất đẹp. Hình dáng phía trên thì thon dài, phía dưới hơi bầu tròn giống giọt nước, nhìn qua trông giống như trái hồ lô của Việt Nam. Trọng lượng trung bình mỗi quả từ 200g đến 300g. \r\nLê Nam Phi có vị ngọt dịu, rất giòn và thơm, ngon hơn khi ăn lạnh vào thời tiết nóng bức, được người tiêu dùng trên toàn thế giới ưa chuộng, xuất nhiều nhất sang châu Âu thị trường cực kỳ khó tính về chất lượng và an toàn thực phẩm. Và với chất lượng tuyệt vời, giá thành hợp lý nên  lê Nam Phi cũng được người tiêu dùng Việt Nam tiêu thụ rất nhiều. \r\n- Lê Nam Phi có nhiều chất xơ nên rất tốt cho sức khỏe giảm cholesterol trong cơ thể, ngăn ngừa các bệnh ung thư và tim mạch \r\n- Có nguồn Vitamin C tốt tăng cường hệ miễn dịch cho cơ thể đồng thời tham gia sản xuất nhiều tế bào hồng cầu, tạo nhiều máu đỏ \r\n- Hàm lượng Vitamin E cũng tốt rất tốt cho da \r\n- Hàm lượng Kali cao (50mg trong 100g)  \r\n- Ít chất béo và Calo phù hợp với những người đang trong chế độ giảm cân Đặc biệt, thường xuyên ăn lê nam phi sẽ tăng được khả năng phòng chống chứng hay mệt, đồng thời tăng khả năng phòng chống được bệnh tăng huyết áp, sung đau họng. Lê Nam Phi bảo quản tốt nhất ở nhiệt độ từ 0 độ C đến 4 độ C , để ở nhiệt độ thường 25 độ C Lê sẽ chín sau 1 đến 3 ngày. Vỏ lê rất dễ bị bầm dập, nên quý khách cần nhẹ tay, tránh làm rơi, va đập để giữ quả lê được đẹp.', NULL, 50);
INSERT INTO `product` VALUES (28, 'Trái Sung Mỹ Tươi - 500g', 155000, NULL, 21, 'Thông tin sản phẩm đang được cập nhật', NULL, 50);
INSERT INTO `product` VALUES (29, 'Việt Quất Jumpo - 125g', 159000, NULL, 13, 'Việt Quất New Zealand Size Jumbo là loại trái cây luôn được ưa chuộng trong những mùa hè nóng bức do có vị ngọt, mọng nước, nhiều chất dinh dưỡng. Không những thế, bạn còn có thể kết hợp chúng với những thực phẩm khác để chế biến những món ăn bổ dưỡng.\r\n\r\nThông tin dinh dưỡng:\r\n\r\nQuả việt quất giàu các chất chống oxy hóa khác nhau, cùng với các vitamin như vitamin C, B2, B6, E và K, chất xơ, đồng, mangan, lutein, gallic acide,\r\nTăng cường chức năng của não: Sự hiện diện của các hợp chất anthocyanin trong quả việt quất rất hữu ích trong việc tăng cường chức năng hoạt động của não, bộ nhớ và chức năng vận động của cơ.\r\nGiảm cân: Nhờ lượng calo thấp, quả việt quất là một món ăn ngon nếu bạn đang mong muốn giảm cân. Chất xơ trong đó có thể làm tăng cảm giác no, khiến bạn cảm thấy no hơn và ăn ít hơn, đồng thời cho bạn năng lượng để thực hiện các hoạt động thể chất nhằm giảm cân dễ dàng.\r\nPhòng ngừa các bệnh: Việt quất có nhiều chất chống oxy hoá và chất dinh dưỡng giúp ngăn ngừa đục thủy tinh thể, tăng nhãn áp, ung thư, loét, tiểu đường, viêm khớp.\r\nĐối với da: Nếu bạn muốn duy trì làn da khỏe mạnh, hãy ăn quả việt quất thường xuyên. Ngoài ra, chúng rất tốt trong việc kiểm soát lão hóa da. \r\nTăng cường tiêu hóa: Hàm lượng chất xơ cao trong quả việt quất làm cho chúng trở thành một lựa chọn tuyệt vời để hỗ trợ tiêu hóa khỏe mạnh.\r\nHướng dẫn sử dụng:\r\n\r\nRửa nhẹ nhàng việt quất với nước sạch để loại bỏ phần phấn trắng trên vỏ.\r\nGiữ lạnh việt quất giúp bảo quản lâu hơn.\r\nBạn nên giữ việt quất trong hộp đựng ban đầu và làm lạnh càng sớm càng tốt.\r\nKhông rửa trước khi cho vào tủ lạnh.', NULL, 50);
INSERT INTO `product` VALUES (30, 'Cam Vàng Úc - 1kg', 159000, NULL, 6, 'Điểm nổi bật Cam vàng không hạt nhập khẩu từ Úc có vỏ màu vàng, ruột màu vàng đậm, vị ngọt thanh, không hạt, mọng nước, thường dùng để ăn chứ không ép nước. Cam chứa nhiều Vitamin C, tốt cho da, chống lão hóa, có tác dụng hồi phục sức khỏe nhanh, tốt cho người ốm. Sử dụng cam thường xuyên sẽ tăng sức đề kháng, giảm đáng kể nguy cơ mắc bệnh sỏi thận, tránh lượng calo dư thừa. \r\nBảo quản: Nơi khô ráo, thoáng mát Sản phẩm được cấp giấy chứng nhận kiểm dịch và kiểm tra an toàn thực phẩm nhập khẩu. Cam kết hoàn toàn không sử dụng hóa chất bảo quản đối với tất cả các loại trái cây đảm bảo mang, đảm bảo an toàn sức khỏe cho người sử dụng Điều kiện sử dụng Thông tin chi tiết Cam là một trong những loại hoa quả được các bà nội trợ tin dùng bởi nó rất tốt cho sức khỏe của mọi lứa tuổi. Nhưng hiện nay, những loại hoa quả này đang bị cảnh báo về chất bảo quản ảnh hưởng không tốt đến sức khỏe con người. Cam ruột vàng không hạt nhập khẩu từ Úc đảm bảo uy tín chất lượng và không có chất bảo quản. Cam có vỏ màu vàng, ruột màu vàng đậm, vị ngọt thanh, không hạt, mọng nước, thường dùng để ăn chứ không ép nước. Trái cam chín mọng được tuyển lựa kỹ lưỡng Cam chứa nhiều vitamin C tốt cho sức khỏe cả nhà Cam chứa nhiều Vitamin C tốt cho da, chống lão hóa, có tác dụng hồi phục sức khỏe nhanh, tốt cho người ốm. \r\nSử dụng cam Úc thường xuyên sẽ giúp bảo vệ bạn khỏi nguy cơ mắc các bệnh truyền nhiễm do virus', NULL, 50);
INSERT INTO `product` VALUES (31, 'Hồng Giòn Hàn Quốc - Túi 1kg', 160000, NULL, 22, 'Xuất xứ: Hàn Quốc\r\n\r\nTiêu chuẩn chất lượng: Nhập khẩu\r\n\r\nĐặc điểm nổi bật: \r\n\r\nHồng Hàn Quốc về size M, trái to, trung bình khoảng 180 - 200g/trái. \r\nVỏ màu cam rất mỏng,quả chắc tay, ruột giòn vị ngọt thanh,không chát, có hạt \r\nHồng có giá trị dinh dưỡng cao, là trái cây ưa thích của người dân xứ sở kim chi\r\n \r\nThông tin sản phẩm: \r\n\r\nQuả hồng chứa nhiều calo, protein, chất xơ, kali, mangan, các vitamin A, C, E, K, B6, và nhiều dưỡng chất khác rất tốt cho sức khoẻ.\r\nQuả hồng giòn chứa các hợp chất thực vật có lợi có chất chống oxy hóa\r\nQuả hồng cũng chứa carotenoids, flavonoid và vitamin E giúp chống oxy hóa mạnh, chống viêm.\r\nCác dưỡng chất trong hồng giúp tăng cường hệ tiêu hóa và hỗ trợ nâng cao sức khỏe.\r\nQuả hồng cung cấp nhiều vitamin A và chất chống oxy hóa rất quan trọng cho sức khỏe của mắt.\r\nHướng dẫn bảo quản/sử dụng: \r\n\r\nBảo quản ở ngăn mát tủ lạnh', NULL, 50);
INSERT INTO `product` VALUES (32, 'Nho Xanh Ninh Thuận - 1kg', 165000, NULL, 23, 'Thông tin sản phẩm đang được cập nhật', NULL, 50);
INSERT INTO `product` VALUES (33, 'Quýt Vàng Úc - 1kg', 170000, NULL, 24, 'Xuất xứ: Úc\r\n\r\nTiêu chuẩn chất lượng: Nhập Khẩu\r\n\r\nĐặc điểm sản phẩm:\r\n\r\nVị ngọt xen chút chua nhẹ, trái không hạt và dễ bóc vỏ \r\nTép thịt căng mọng, không bị sượng và rất nhiều nước \r\nChứa nhiều vitamin tốt cho da, giúp phục hồi sức khỏe nhanh\r\nHướng dẫn bảo quản: Bảo quản ở ngăn mát tủ lạnh', NULL, 50);
INSERT INTO `product` VALUES (34, 'Táo Fuji Newzealand - 1kg', 170000, NULL, 17, '1.   Giới thiệu -   Táo Fuji New Zealand có kích cỡ trung bình, quả tròn nhưng hơi góc cạnh và cao thành, thịt chặt, nhiều nước và ngọt.  Fuji tươi ngon lâu hơn các giống táo khác (khoảng 1 năm)  nếu được bảo quản trong điều kiện từ 0 đến 4 độ và sử dụng công nghệ bảo quản CA  -   Trọng lượng khoảng 200g đến 250g mỗi quả, có vỏ goài màu đỏ, vỏ nhẵn và trơn. -   Táo Fuji  được người tiêu dùng việt nam tiêu thụ khá mạnh, cụ thể là hàng năm số lượng táo fuji từ new zealand, Úc, Mỹ   \r\n2.   Xuất xứ và mùa vụ Táo Fuji là giống táo lai được phát hiện và nhân rộng bởi những chuyên gia về giống cây trồng tại thị trấn Fujisaki, Aomori, Nhật Bản vào năm 1930 và bắt đầu bán ra thị trường từ năm 1962 (sau 32 năm trồng và phát triển). Được lai tạo từ táo Delicious Đỏ và giống Virginia Ralls Genet (cả hai đều của Mỹ). Táo Phú Sĩ (fuji)  được đặt tên theo tên thị trấn Fujisaki, nơi đặt trạm nghiên cứu ra giống táo.    Hiện tại đã có thêm gần 30 biến thể được lai tạo tại nhiều nước trên thế giới, trong đó có 20 giống đã được cấp bằng sáng chế. Táo Fuji New Zealand có mùa vụ bắt đầu từ tháng 02 đến tháng 08 hàng năm rơi đúng vào dịp tết Nguyên Đán của Việt Nam   \r\n3.   Giá trị dinh dưỡng -   Táo Fuji rất tốt cho tim mạch, răng và sức khỏe tổng thể của con người. Theo một nghiên cứu mới đây, ăn 1 đến 2 quả táo mỗi ngày có thể làm giảm các yếu tố có nguy cơ gây ra bệnh tim. -   Táo Fuji new zealand có lượng chất xơ rất cao, có tác dụng làm giảm lượng đường trong máu, loại trừ cholesterol lắng đọng tại mạch máu từ đó phòng tránh các bệnh tim mạch, ung thư và các bệnh về phổi. -   Hàm lượng Vitamin C trong Fuji cũng rất cao, tăng cường hệ miễn dịch cho cơ thể, phòng ngừa các bệnh về hô hấp, tham gia sản sinh các sợi collagen từ đó làm chậm quá trình oxy hóa rất phù hợp với phụ nữ -   Táo fuji được chứng minh  có khả năng   chữa bệnh dạ dày bằng cách gọt vỏ quả táo, đem xay thật nhuyễn rồi ăn bột táo tươi vào mỗi buổi sáng hàng ngày lúc đói bụng, cố gắng không ăn gì trong 5h tiếp theo để táo phát huy tác dụng. Fuji là một trong những loại táo được ưa chuộng nhất tại thị trường Việt Nam   \r\n4.   Bảo quản và sử dụng -   Táo Fuji nên được bảo quản ở nhiệt độ từ 0 oC đến 4oC -   Nếu khi quý khách mua táo về bảo quản bằng tủ đông/tủ lạnh tại nhà với nhiệt độ từ 0  oC đến 04oC, trong khoảng 2 tuần kể từ lúc mua về trái táo vẫn giữ nguyên dược độ tươi, giòn và ngọt.', NULL, 50);
INSERT INTO `product` VALUES (35, 'Lựu Thái Lan - 1kg', 190000, NULL, 25, 'Thông tin sản phẩm đang được cập nhật', NULL, 50);
INSERT INTO `product` VALUES (36, 'Táo Daisy Girl U.S.A', 190000, NULL, 17, 'TÁO ĐỎ DAISY GIRL CHUẨN HỮU CƠ - KHÔNG NÊN BỎ QUA ‼️\r\n🍎 Táo Daisy Girl Organic U.S.A 🍎\r\n\r\nLần đầu tiên nhập khẩu thị trường Việt Nam\r\n\r\nTáo Organic Daisy Girl cực giòn và ngọt, đặc biệt rất thơm. Chất lượng của táo Daisy Girl chẳng thua kém bất kì 1 loại táo nào đâu nhé. Đặc biệt, là dòng ORGANIC nên cực kỳ được yêu thích.', NULL, 50);

-- ----------------------------
-- Table structure for product_status
-- ----------------------------
DROP TABLE IF EXISTS `product_status`;
CREATE TABLE `product_status`  (
  `id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_status
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `delivery_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for wishlist
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist`  (
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wishlist
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
