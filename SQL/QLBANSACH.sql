create database QLBANSACH
GO
use QLBANSACH

GO
CREATE TABLE KHACHHANG
(
MaKH INT IDENTITY(1,1),
HoTen NVARCHAR(50) NOT NULL,
Taikhoan Varchar(50) UNIQUE,
Matkhau Varchar(50) NOT NULL,
Email Varchar(100) UNIQUE,
DiachiKH NVARCHAR(200),
DienthoaiKH Varchar(50),
Ngaysinh DATETIME
CONSTRAINT PK_Khachhang PRIMARY KEY(MaKH)
)

GO
CREATE TABLE Loai
(
MaLoai INT IDENTITY(1,1),
TenLoai NVARCHAR(50) NOT NULL,
CONSTRAINT PK_Loai PRIMARY KEY(MaLoai)
)

GO
CREATE TABLE NHAXUATBAN
(
MaNXB INT IDENTITY(1,1),
TenNXB NVARCHAR(50) NOT NULL,
Diachi NVARCHAR(200),
DienThoai VARCHAR(50),
CONSTRAINT PK_NhaXuatBan PRIMARY KEY(MaNXB)
)

GO
CREATE TABLE SACH
(
Masach INT IDENTITY(1,1),
Tensach NVARCHAR(100) NOT NULL,
Giaban Decimal(18,0) CHECK (Giaban>=0),
Mota NVARCHAR(Max),
Anhbia VARCHAR(50),
Ngaycapnhat DATETIME,
Soluongton INT,
MaLoai INT,
MaNXB INT,
Constraint PK_Sach Primary Key(Masach),
Constraint FK_Loai Foreign Key(MaLoai) References LOAI(MaLoai),
Constraint FK_NhaXB Foreign Key(MaNXB)References NHAXUATBAN(MANXB)
)

GO
CREATE TABLE TACGIA
(
MaTG INT IDENTITY(1,1),
TenTG NVARCHAR(50) NOT NULL,
Diachi NVARCHAR(100),
Tieusu NVARCHAR(Max),
Dienthoai VARCHAR(50),
CONSTRAINT PK_TacGia PRIMARY KEY(MaTG)
)

GO
CREATE TABLE VIETSACH
(
MaTG INT,
Masach INT,
Vaitro NVARCHAR,
CONSTRAINT PK_VietSach PRIMARY KEY(MaTG, Masach),
Constraint FK_TG_VIETSACH Foreign Key(MaTG) REFERENCES TACGIA(MaTG),
)

GO
CREATE TABLE DONDATHANG
(
MaDonHang INT IDENTITY(1,1),
Dathanhtoan BIT,
Tinhtranggiaohang BIT,
Ngaydat DATETIME,
Ngaygiao DATETIME,
MaKH INT,
CONSTRAINT PK_DonDatHang PRIMARY KEY (MaDonHang),
CONSTRAINT FK_Khachhang FOREIGN KEY (MaKH) REFERENCES Khachhang(MaKH)
)

GO
CREATE TABLE CHITIETDONTHANG
(
MaDonHang INT,
Masach INT,
Soluong Int Check(Soluong>0),
Dongia Decimal(18,0) Check(Dongia>=0),
CONSTRAINT PK_CTDatHang PRIMARY KEY(MaDonHang,Masach),
CONSTRAINT FK_Donhang FOREIGN KEY (MaDonHang) REFERENCES Dondathang(MaDonHang),
CONSTRAINT FK_Sach1 FOREIGN KEY (Masach) REFERENCES Sach(Masach)
)
GO
CREATE TABLE Admin (
UserAdmin VARCHAR (30)  NOT NULL,
PassAdmin VARCHAR (30)  NOT NULL,
Hoten     NVARCHAR (50) NULL,
CONSTRAINT PK_Admin PRIMARY KEY(UserAdmin)
)

INSERT INTO Admin VALUES 
('Admin', 'Admin','Tester')

INSERT INTO KHACHHANG VALUES 
(N'Nguyễn Thị Diễn', N'DienNguyen','123','diennguyen@gmail.com',N'Bình Thuận','01654374455','2000-08-08'),
('Nguyễn Thị Thanh Tuyền', N'TuyenNguyen','234','tuyennguyen@gmail.com',N'Phú Yên','01654374466','2000-05-08'),
(N'Hồ Nguyễn Hồng Huệ', N'HoNguyen','345','honguyen@gmail.com',N'Ninh Hòa- Khánh Hòa','01654374478','2000-05-25'),
(N'Nguyễn Văn Hải Long', N'LongNguyen','456','longnguyen@gmail.com',N'Hải Dương','01654374412','2000-10-08'),
(N'Nguyễn Thị Bích Triều', N'TrieuNguyen','567','trieunguyen@gmail.com',N'Khánh Hòa','01654374565','2000-02-12'),
(N'Nguyễn Phan Nhật Linh', N'LinhNguyen','678','linhnguyen@gmail.com',N'Khánh Hòa','01654374246','2000-12-20')


INSERT INTO NHAXUATBAN VALUES 
(N'NXB Kim Đồng',N'55 Quang Trung, Hai Bà Trưng, Hà Nội','02439434730'),
(N'NXB Trẻ',N'161B Lý Chính Thắng, Phường 7, Quận 3, Thành phố Hồ Chí Minh.','(028) 39316289 - 39316211 - 39317849'),
(N'NHÀ SÁCH ĐÔNG A',N'18 Nguyễn Trường Tộ, phường Trúc Bạch, quận Ba Đình, thành phố Hà Nội ','0243. 7161518  - 0243. 7163409'),
(N'NXB Hội Nhà văn',N'Số 65 Nguyễn Du, Hà Nội','024.38222135'),
(N'Nhà xuất bản giáo dục Việt Nam',N'81 Trần Hưng Đạo, Hà Nội','024.38220801'),
(N'Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh',N' 62 Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, TP.HCM',' (028) 38 225 340 – 38 296 764'),
(N'Báo Sinh Viên VN - Hoa Học Trò',N'502 Lê Văn Sỹ, P. 14, Q. 3, Tp. Hồ Chí Minh (TPHCM)','(028) 39312190.'),
(N'NXB Văn học',N'18 Nguyễn Trường Tộ, phường Trúc Bạch, quận Ba Đình, thành phố Hà Nội ','0243. 7161518  - 0243. 7163409'),
(N'NXB Lao Động',N'',''),
(N'NXB Phụ Nữ Việt Nam',N'',''),
(N'NXB Công Thương',N'',''),
(N'NXB Thế Giới',N'','')

INSERT INTO LOAI VALUES 
(N'Tiểu sử - Hồi ký'),
(N'Kinh tế'),
(N'Tâm lý - Kỹ năng sống'),
(N'Lịch sử - Địa lý - Tôn giáo'),
(N'Giáo trình'),
(N'Tiểu thuyết'),
(N'Manga-Comic'),
(N'Sách thiếu nhi')

INSERT INTO TACGIA VALUES
(N'Jack Thorne',N'', N'',''),
(N'John Tiffany',N'', N'',''),
(N'J.K.Rowling',N'', N'',''),
(N'Boichi, Riichiro Inagaki',N'', N'',''),
(N'Akira Toriyama',N'Nhật Bản', N'',''),
(N'Robert Leinweber',N'', N'',''),
(N'Philipp Grot Johann',N'', N'',''),
(N'Wilhelm Grimm',N'', N'',''),
(N'Tony Wolf',N'', N'',''),
(N'Carlo Collodi',N'', N'',''),
(N'Nhiều Tác Giả',N'', N'',''),
(N'Paulo Coelho',N'', N'',''),
(N'Nguyên Phong',N'Việt Nam', N'Tác giả Nguyên Phong (Vũ Văn Du) du học ở Mỹ từ năm 1968, tốt nghiệp cao học Sinh vật học, Điện toán. Ông từng là Kỹ sư trưởng, CIO của Tập đoàn Boeing của Mỹ, Viện trưởng Viện Công nghệ Sinh học Đại học Carnegie Mellon. Ông được mọi người biết tới là Giáo sư John Vu – Nhà khoa học uy tín về công nghệ thông tin. , CMMI và từng giảng dạy ở nhiều trường đại học trên thế giới.

Nguyên Phong là bút danh của bộ sách văn hóa tâm linh được dịch, viết phóng tác từ trải nghiệm, tiềm thức và quá trình nghiên cứu, khám phá các giá trị tinh thần Đông phương. Ông đã viết phóng tác tác phẩm bất hủ Hành trình về Phương Đông năm 24 tuổi (1974). Các tác phẩm khác của Nguyên Phong được bạn đọc nhiều thế hệ yêu thích: Ngọc sáng trong hoa sen, Bên rặng tuyết sơn, Hoa sen trên tuyết, Hoa trôi trên sóng nước, Huyền thuật và các đạo sĩ Tây Tạng, Trở về từ xứ tuyết, Trở về từ cõi sáng, Minh triết trong đời sống, Đường mây qua xứ tuyết, Dấu chân trên cát, Đường mây trong cõi mộng, Đường mây trên đất hoa… và bộ sách dành cho sinh viên, thầy cô: Khởi hành, Kết nối, Bước ra thế giới, Kiến tạo thế hệ Việt Nam ưu việt, GS John Vu và lời khuyên dành cho thầy cô, GS John Vu và lời khuyên dành cho các bậc cha mẹ.',''),
(N'Lưu Hồng Hà',N'Việt Nam', N'',''),
(N'Shuichi Aso',N'Nhật Bản', N'',''),
(N'Osamu Nishi',N'Nhật Bản', N'',''),
(N'Brian L Weiss',N'', N'Brian L. Weiss, M.D

Sau khi tốt nghiệp hạng ưu, trường đại học Columbia và nhận văn bằng y khoa tại trường y khoa của đại học Yale, Brian L. Weiss, TS. Y khoa (MD) tham dự chương trình nội trú tại Trung tâm Y khoa Bellevue, đại học New York, và thăng bậc thành bác sỹ nội trú trưởng, Khoa tâm thần, trường y khoa của đại học Yale. Hiện TS. Weiss là chủ tịch khoa tâm thần tại Trung tâm Y khoa Núi Sinai, vùng duyên hải Miami bang Florida và là trợ lý giáo sư lâm sàng khoa tâm thần, trường y của đại học Miami. Ông chuyên nghiên cứu và trị liệu tình trạng lo lắng và trầm cảm, rối loạn giấc ngủ, rối loạn lạm dụng chất gây nghiện, bệnh Alzheimer và hóa học não.',''),
(N'Dale Carnegie',N'Mỹ', N'Dale Breckenridge Carnegie (24 tháng 11 năm 1888 – 1 tháng 11 năm 1955) là một nhà văn và nhà thuyết trình Mỹ và là người phát triển các lớp tự giáo dục, nghệ thuật bán hàng, huấn luyện đoàn thể, nói trước công chúng và các kỹ năng giao tiếp giữa mọi người. Ra đời trong cảnh nghèo đói tại một trang trại ở Missouri, ông là tác giả cuốn Đắc Nhân Tâm, được xuất bản lần đầu năm 1936, một cuốn sách thuộc hàng bán chạy nhất và được biết đến nhiều nhất cho đến tận ngày nay. Ông cũng viết một cuốn tiểu sử Abraham Lincoln, với tựa đề Lincoln con người chưa biết, và nhiều cuốn sách khác.

Carnegie là một trong những người đầu tiên đề xuất cái ngày nay được gọi là đảm đương trách nhiệm, dù nó chỉ được đề cập tỉ mỉ trong tác phẩm viết của ông. Một trong những ý tưởng chủ chốt trong những cuốn sách của ông là có thể thay đổi thái độ của người khác khi thay đổi sự đối xử của ta với họ.',''),
(N'Albert Rutherford',N'', N'',''),
(N'Jim Collin',N'', N'',''),
(N'Peter Lynch',N'', N'PETER LYNCH là Phó chủ tịch tập đoàn Fidelity Management & Research Company – chuyên gia tư vấn hàng đầu của Fidelity Investments – và là thành viên của Ban Quản trị của Quỹ Fidelity.',''),
(N'John Rothchild',N'', N'JOHN ROTHCHILD đã viết cho các tạp chí nổi tiếng như Time, Fortune, và The New York Times Book Review. Ông là tác giả của cuốn sách A Fool and His Money...',''),
(N'Hermann Simon',N'', N'',''),
(N'Dan Cockerell',N'', N'',''),
(N'Paul Kalanithi',N'', N'',''),
(N'Maye Musk',N'', N'Maye Musk Maye Musk sinh ngày 19 tháng Tư năm 1948 tại Canada. Bà là một siêu mẫu quốc tế, một chuyên gia dinh dưỡng - thực chế học được chứng nhận kiêm diễn giả toàn cầu.

Thời trẻ, bà từng lọt vào chung kết cuộc thi Hoa hậu Nam Phi nhưng nghề chính của bà là bác sĩ dinh dưỡng. Để có thêm tiền trang trải cho cuộc sống, bà còn làm nghề người mẫu.

Năm 1970, bà kết hôn với ông Errol Musk và có với nhau ba người con, Elon, Kimbal và Tosca (trong đó nổi tiếng nhất chính là tỉ phú Elon Musk). Năm 1979, hai vợ chồng ly hôn và bà trở thành mẹ đơn thân, sau đó chuyển đến Canada sống cùng ba người con. Trong suốt hơn bảy mươi năm cuộc đời, dù trải qua nhiều khó khăn, Maye Musk vẫn nuôi dưỡng ba người con thành tài, có một cuộc sống hạnh phúc cùng sự nghiệp tương đối thành công, cho đến nay vẫn là người mẫu nổi tiếng, được nhiều người ngưỡng mộ.

Bà thường xuyên góp mặt trên những tạp chí thời trang lớn như Vanity Fair, Vogue, Cosmopolitan, Marie Claire và Allure, từng lên trang bìa New York Magazine cùng nhiều người khác. Sinh ra ở Canada, Maye chuyển đến sống ở Nam Phi nhiều năm và hiện tại đang cư ngụ ở Los Angeles, Mỹ.',''),
(N'E M Standing',N'', N'M. Standing là một trong những người Mỹ đã dành nhiều thời gian ở bên cạnh Maria Montessori và dường như cống hiến phần lớn đời mình với niềm say mê những ý tưởng mới của bà. Ông đã tham dự các bài giảng của Maria Montessori và dịch nhiều cuốn sách của bà sang tiếng Anh. Nếu không có những tác phẩm của ông, những người nói tiếng Anh sẽ không thể tiếp cận được tiểu sử hấp dẫn về cuộc đời Maria Montessori, cũng như không thể có những hiểu biết sâu sắc về các triết lý của bà.',''),
(N'Lý Nhân Phan Thứ Lang',N'', N'',''),
(N'Daniel J Boorstin',N'', N'',''),
(N'Robert Kurson',N'', N'Robert Kurson tốt nghiệp Trường Luật Harvard và bắt đầu với nghề luật sư, chuyên về mảng bất động sản. Sau đó, ông chuyển sang nghề viết, ban đầu là cộng tác viên cho ban thể thao của tờ Chicago Sun-Times rồi dần trở thành phóng viên toàn thời gian. Ông chuyển từ Sun-Times sang Chicago Magazine rồi Esquire. Tại đây, ông đã giành được giải thưởng National Magazine Award. Hiện nay, ông là cây bút quen thuộc của nhiều tạp chí nổi tiếng như Rolling Stone, The New York Times Magazine...',''),
(N'Ứng Hòe Nguyễn Văn Tố',N'', N'','')

INSERT INTO SACH VALUES
(N'Harry Potter Và Đứa Trẻ Bị Nguyền Rủa',120000,N'Phù thủy nổi tiếng nhất thế giới đã quay trở lại. Tập truyện "Harry Potter và Đứa Trẻ bị Nguyền rủa”- phần thứ 8 được chính thức phát hành. Khác với bảy phần trước của tiểu thuyết Harry Potter, "Harry Potter và Đứa Trẻ bị Nguyền rủa" phần I và II là kịch bản gốc của vở kịch mới của tác giả Rowling cùng Jack Thorne và John Tiffany.
Từ những nhân vật quen thuộc trong bộ Harry Potter, kịch bản nói về cuộc phiêu lưu của những hậu duệ, sự can thiệp vào dòng thời gian đã gây ra những thay đổi không ngờ cho tương lai tưởng chừng đã yên ổn sau khi vắng bóng chúa tể Voldermort.
Câu chuyện lấy bối cảnh 19 năm sau khi Harry Potter là Giám đốc Sở Thần Sáng tại Bộ Pháp Thuật và đã có ba con cùng vợ là Ginny Weasley, em gái của người bạn thân là Ron Weasley. Albus Severus Potter là đứa con duy nhất của Harry thừa hưởng đôi mắt màu xanh nước biển của bà nội Lily. và Albus Potter bắt đầu nhập học ở Hogwarts cùng Scorpius Malfoy và Rose Granger-Weasley.
Phần này sẽ đưa bạn quay trở lại trường Hogwarts, quay trở lại những chuyến phiêu lưu của Harry, quay trở lại thế giới phép thuật quyến rũ.',
'HarryPotter12.gif',2018/03/12,20,6,2)


INSERT INTO SACH VALUES (N'HARRY POTTER VÀ HỘI PHƯỢNG HOÀNG (TẬP 5)',301000,N'Harry tức giận vì bị bỏ rơi ở nhà Dursley trong dịp hè, cậu ngờ rằng Chúa tể hắc ám Voldemort đang tập hợp lực lượng, và vì cậu có nguy cơ bị tấn công, những người Harry luôn coi là bạn đang cố che giấu tung tích cậu. Cuối cùng, sau khi được giải cứu, Harry khám phá ra rằng giáo sư Dumbledore đang tập hợp lại Hội Phượng Hoàng – một đoàn quân bí mật đã được thành lập từ những năm trước nhằm chống lại Chúa tể Voldemort. Tuy nhiên, Bộ Pháp thuật không ủng hộ Hội Phượng Hoàng, những lời bịa đặt nhanh chóng được đăng tải trên Nhật báo Tiên tri – một tờ báo của giới phù thủy, Harry lo ngại rằng rất có khả năng cậu sẽ phải gánh vác trách nhiệm chống lại cái ác một mình.
‘Hoang đường nhưng không hoang tưởng, trí tưởng tượng của Rowling cùng sự táo bạo của cô đã tạo cho cô một phong cách riêng.’ - The Times.','harry-potter-va-hoi-phuong-hoang.jpg',2017/12/12,20,6,2)

INSERT INTO SACH VALUES(N'NHỮNG CHUYỆN KỂ CỦA BEEDLE NGƯỜI HÁT RONG',127500,N'Những Chuyện Kể Của Beedle Người Hát Rong gồm năm câu chuyện thần tiên với những phép thuật lạ lùng độc đáo, những tình huống căng thẳng hồi hộp sẽ làm say mê độc giả của mọi lứa tuổi. Đặc biệt sau mỗi câu chuyện có phần bình luận của giáo sư Albus Dumbledore. Với những suy nghĩ sâu sắc ý nhị và phần hé lộ thông tin về cuộc sống tại trường Hogwarts, những lời bàn của giáo sư hy vọng sẽ được dân Muggles và giới phù thủy yêu thích như nhau.’','nhung-chuyen-ke-cua-beedle-nguoi-hat-rong_L.gif',2019/1/4,20,6,2)

INSERT INTO SACH VALUES(N'Nhà Giả Kim (Tái Bản 2020)', 67150,N'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người. 

Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.

“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.”

- Trích Nhà giả kim','image_195509_1_36793.jpg' ,2020/12/12 , 12, 6,4)

INSERT INTO SACH VALUES(N'Dấu Chân Trên Cát (Tái Bản 2020)',118400 ,N'“Dấu chân trên cát” là tác phẩm được dịch giả Nguyên Phong phóng tác kể về xã hội Ai Cập thế kỷ thứ XIV trước CN, qua lời kể của nhân vật chính -  Sinuhe.

Ngày nay, người ta biết đến triều đại các vua chúa Ai Cập thời cổ qua sách vở của người Hy Lạp. Sở dĩ các sử gia Hy Lạp biết được các chi tiết này vì họ đã học hỏi từ người Ai Cập bị đày biệt xứ tên là Sinuhe. Đây là một nhân vật lạ lùng, đã có công mang văn minh Ai Cập truyền vào Hy Lạp khi quốc gia này còn ở tình trạng kém mở mang so với Ai Cập lúc đó.

Các sử gia ngày nay đã đưa ra nhiều giả thuyết về nhân vật Sinuhe này. Có người cho rằng ông là một lái buôn đến Hy Lạp lập nghiệp, nhưng làm sao lái buôn lại mở trường dạy học và để lại nhiều tài liệu quý giá như thế được? Từ ngàn xưa,  chỉ riêng giai cấp vua chúa là giáo sĩ mới được hưởng quy chế giáo dục toàn vẹn như vậy mà thôi.

Do đó, một số người cho rằng ông thuộc giai cấp giáo sĩ, nhưng việc một giáo sĩ Ai Cập đến mở trường dạy học tại Hy Lạp cũng là điều khó chấp nhận. Mặc dù khi đó văn minh Hy Lạp chưa tiến bộ như Ai Cập nhưng giáo xứ này phát triển rất mạnh, hiển nhiên các giáo sĩ Hy Lạp không thể chấp nhận cho một giáo sĩ ngoại quốc đến mở trường dạy học tại thánh địa Olympia của họ được.

Nếu thế thì phải chăng Sinuhe thuộc giai cấp hoàng tộc? Điều này xét ra cũng không có lý vì một người thuộc giai cấp hoàng tộc không thể bị đày biệt xứ. Luật pháp Ai Cập chủ trương xử tử những kẻ trong hoàng tộc nếu họ vi phạm một tội trọng nào đó chứ không có lệ bị đày biệt xứ, vì các vua Pharaoh rất sợ những người trong bọn họ chiêu binh mãi mã làm phản.

 Việc một người Ai Cập, thân thế mơ hồ, bị đày biệt xứ, đến mở trường dạy học tại Athens, trung tâm văn hóa của Hy Lạp, vẫn là một bí mật đến nay các nhà khảo cổ chưa tìm ra được câu trả lời.

Mặc dù là tiểu thuyết lịch sử về xã hội Ai Cập cổ đại, song nhiều vấn đề được nêu ra trong tác phẩm vẫn có ý nghĩa thời sự trong thế giới ngày nay. Đó là lý do khiến cho tác phẩm không chỉ giữ được sự cuốn hút đối với bạn đọc Việt Nam và rất nhiều nơi  trên thế giới trong hơn nửa thế kỷ qua.

Bạn sẽ không thể rời mắt khỏi những dòng văn viết với ý tứ sâu sắc của một người con xa quê hương: "Người Ai Cập có thành ngữ: "Kẻ nào đã uống nước sông Nile thì không thể nào uống nước ở đâu được nữa". Quả thế tuy sống tại Hy Lạp nhưng không bao giờ tôi có thể quên được Ai Cập quê hương thân yêu của tôi.

Dường như những miền nào xây dựng trên mặt cát, chỉ huy hoàng trong một thời gian rất ngắn rồi tàn lụi, nhưng mấy ai chịu để ý đến điều ấy. Cũng như những vết dấu chân trên cát chỉ tồn tại một thoáng giây rồi phai mờ, huyền thoại về một người Ai Cập qua Hy Lạp mở trường dạy học, đào tạo nhiều thế hệ học trò xuất sắc chỉ còn là một câu chuyện mơ hồ trong cuộc sống ồn ào, náo nhiệt ngày nay.','image_195509_1_12629_1.jpg',2020/12/12,12,6,5)


INSERT INTO SACH VALUES(N'DR. STONE - TẬP 2', 23750,N'Senku cùng Taiju và Yuzuriha gấp gáp tiến hành điều chế thuốc súng. Giữa lúc ấy, đột nhiên một cột khói bốc lên từ phía xa. Senku tin rằng vẫn còn những người khác trên thế giới này nên đã chấp nhận mạo hiểm và đốt lửa hiệu. Mặt khác, họ phải đối mặt với tình thế ngàn cân treo sợi tóc khi bị Tsukasa truy đuổi nhằm ngăn chặn Senku điều chế thuốc súng…!?

RIICHIRO INAGAKI “Khác với họa sĩ truyện tranh, tác giả nguyên tác không có trợ lí. Lúc nào cũng chỉ một mình lặng lẽ ngồi viết lách. Cô đơn lắm! Nói chung, làm việc mà xung quanh chẳng có ai buồn tẻ vô cùng! Giống Senku, lầm lũi làm việc giữa thế gian… Tôi mà bị đẩy vào tình cảnh như vậy thì chắc chẳng chịu nổi mất. Làm tốt lắm, Senku!”
BOICHI “Đối với tôi, các bản phác thảo hàng tuần nhận được từ tác giả Inagaki thật sự là niềm hạnh phúc lớn lao. Tôi rất thích vẽ về thiên nhiên. Tuần nào tôi cũng phải tưởng tượng ra các loài đại thụ, tầm gửi và rêu. Và còn phải tưởng tượng ra Senku đang sống giữa thiên nhiên ấy nữa. Cậu ấy là một chàng trai đơn độc giữa thế giới bao la. Là một người đang sống trong thế giới truyện tranh Nhật Bản rộng lớn, tôi rất đồng cảm với cậu ấy. Này Senku!!! Đời người chính là một cuộc trao đổi công bằng giữa nỗi cô đơn và sự vĩ đại.”.’','SACH-dr-stone-tap-2.jpg',2021/2/8,20,7,1)

INSERT INTO SACH VALUES(N'DR. STONE - TẬP 1', 23750,N'Ngày nọ, cậu học sinh cấp Ba Taiju bị cuốn vào một hiện tượng kì bí khiến toàn nhân loại hóa đá.

Khoảng 3.700 năm sau, Taiju tỉnh dậy và hội ngộ người bạn thân Senku đã hồi sinh trước đó.

Bằng “sức trâu” của Taiju và “đầu óc” của Senku, cả hai người đã cùng nhau bắt tay vào xây dựng lại nền văn minh từ con số 0 ở thế giới đá...

Một tác phẩm cực kì ấn tượng thuộc dòng thương hiệu Manga Shonen Jump trứ danh!! Ngoài những điểm đặc trưng vốn có của dòng truyện Jump, bạn sẽ phải trầm trồ đầy kinh ngạc trước những kiến thức hóa học, vật lí, sinh học và toán học... được lồng ghép vô cùng khéo léo và tự nhiên!!

Hãy cùng bước vào chuyến phiêu lưu sinh-tồn-viễn-tưởng vô tiền khoáng hậu với Dr. Stone nhé!!

“Bạn mường tượng một nhà khoa học là người thế nào? Đeo kính này, tính cách hướng nội này, còn hơi điên điên nữa…Nhưng thật ra nếu đã có nhà khoa học lãng tử thì cũng sẽ có nhà khoa học cơ bắp cuồn cuộn thôi. Nhân vật chính Senku có lẽ cũng hơi khác so với ấn tượng của mọi người về một nhà khoa học. Nhưng cậu ấy rất nhiệt huyết đó. Các nhân vật của chúng ta sắp đương đầuvới biến cố chấn động rồi, mọi người hãy cổ vũ, ủng hộ nhé!!” - RIICHIRO INAGAKI”.’','SACH-dr-stone-tap-1.jpg',2021/4/2,20,7,1)

INSERT INTO SACH VALUES(N'DRAGON BALL FULL COLOR - PHẦN HAI: ĐẠI MA VƯƠNG PICCOLO - TẬP 4', 73150, N'DRAGON BALL là một Manga kinh điển với tầm ảnh hưởng lớn đến mức nào! Một bộ truyện chúng ta đã gắn bó suốt từ nhỏ, ăn cùng, ngủ cùng, bắt gặp hình ảnh ở khắp mọi nơi, vậy thì chẳng có lí do gì mà không sở hữu 1 phiên bản rực rỡ sắc màu như thế này cả! Nhất là khi "Giấc mơ thuở bé" nay đã thành sự thực nữa!
Nếu bạn là fan của DRAGON BALL - 7 VIÊN NGỌC RỒNG và những cuộc phiêu lưu của Khỉ Con Son Goku thì DRAGON BALL FULL COLOR sẽ làm bạn thích thú hơn nữa khi 100% cuốn truyện mà chúng ta yêu thích đều CÓ MÀU! Các nhân vật sẽ xuất hiện trước mắt bạn với màu da, màu tóc, phục trang và những khung cảnh vô cùng sống động! Những màn chiến đấu đặc trưng của DRAGON BALL cũng vì thế mà trở nên hoành tráng hơn bao giờ hết!!

Sau thời gian dài chuẩn bị và trao đổi với đại diện của tác giả Akira Toriyama, bộ truyện đã được NXB Kim Đồng phát hành với 100% bản quyền, phần ruột sách in màu rực rỡ trên giấy couché, có bìa áo 5 màu phản quang cực kì ấn tượng!! Chắc chắn sẽ là một món quà dành cho các Fan của Son Goku!','SACH-dragon-ball-tap-4.jpg',2021/1/2,20,7,1)
INSERT INTO SACH VALUES(N'Saiki Kusuo - Kẻ Siêu Năng Khốn Khổ - Tập 9: Đến Mệt Với Ông Ngoại Tsundere',17600 ,N'Nhân kì nghỉ xuân, cả nhà Saiki về quê thăm ông bà. Trong khi bà ngoại xởi lởi, hiền hậu thì ông ngoại lại cấm cảu, khó tính! Thế nhưng trong nội tâm của người ông vừa ít nói vừa khó gần lại ẩn chứa một bí mật ngang trái mà chỉ cậu cháu trai siêu năng lực mới thấu tỏ.

Shuichi Aso

“Có lần, tôi hỏi biên tập, “Tóc nhân vật để màu xanh lá cây được không nhỉ?”

Anh ấy đáp lại tỉnh bơ, “Mẹ tôi để tóc màu xanh lá cây đấy.”

Nghe xong, tôi bắt đầu lái chủ đề câu chuyện đi xa.

“Hả!? Xanh lá cây á!? Bác gái để tóc vậy lâu chưa?”

“Từ hồi cấp 2 á!? Quen biết nhau 8 năm, đây là lần đầu tiên tôi nghe chuyện này đấy!! Tại sao thế!?”

Kết cục, tóc Kuboyasu có màu tím.”','saikike-sieu-nang-khon-kho-tap-9.jpg' ,2020/12/12 , 12, 7,1)

INSERT INTO SACH VALUES(N'Iruma Giá Đáo! Tập 8',20000,N'Trước vị giáo viên ác ma mà ai nấy cũng phải e dè, Iruma đã thú nhận mình là con người!?

Cuối cùng trường Babyls cũng dần bước vào kì nghỉ dài ngày♪… Nhưngtrước kì nghỉ còn có một bài kiểm tra đầy ai oán...Iruma phải vùi đầu vào học!! Trước tình cảnh ấy, một nguy cơ khó lường đang rình rập cậu!?

Osamu Nishi

“Ác ma luôn lừa gạt con người, tuy vậy, trong số đó cũng có những ác ma đem lòng yêu mến nhân loại. Liệu trái tim họ có phập phồng bao cảm xúc? Liệu rằng họ có hồi hộp những lúc tay trong tay? Những ác ma như thế khiến tôi yêu thích vô cùng.”','irumatap-8.jpg' ,2020/12/12 , 12, 7,1)




INSERT INTO SACH VALUES(N'TRUYỆN CỔ GRIMM - BẢN CAO CẤP', 578000,N'Năm 1812, ấn bản đầu tiên của tập truyện “Kinder-und Hausmärchen” (Chuyện kể cho trẻ em và trong gia đình) ra đời tại Berlin, và lập tức gây được tiếng vang trong cộng đồng những nhà nghiên cứu ở Đức. Nhưng hẳn không một học giả nào tại thời điểm đó, hay thậm chí là những tác giả của tập truyện, có thể hình dung được giá trị và sức ảnh hưởng mà tập truyện mang lại trên toàn cầu, trong suốt chiều dài phát triển của lịch sử nhân loại. Đến tận ngày nay, hơn 200 năm sau ngày phát hành ấn bản đầu tiên, tập truyện vẫn được dịch và tái bản thường xuyên ở hàng trăm quốc gia, tiếp tục nuôi dưỡng những tâm hồn trẻ thơ, tưới tắm cho trí tưởng tượng thông qua các câu chuyện kỳ ảo, được gọi chung với cái tên quen thuộc:  Truyện Cổ Grimm

Tại Việt Nam, Truyện Cổ Grimm đã được giới thiệu đến các độc giả qua nhiều lần xuất bản khác nhau, với các ấn bản truyện chữ theo bản dịch từ truyện của hai anh em nhà Grimm, thêm minh họa, hay truyện tranh do các họa sĩ vẽ lại với nội dung rút gọn...

Lần in này, Đông A trân trọng giới thiệu tới bạn đọc  Truyện Cổ Grimm - Ấn bản đầy đủ nhất kèm 184 minh hoạ” với những điểm đáng chú ý như sau:

Về nội dung, đây được xem là ấn bản đầy đủ nhất đến thời điểm hiện tại, gồm 215 truyện. Trong đó có 211 truyện đúng số lượng và thứ tự theo bản năm 1857, ấn bản cuối cùng của anh em nhà Grimm trước khi hai ông qua đời (bao gồm 10 truyện thuộc phần “Huyền thoại cho trẻ em”, có tính giáo dục và mang đậm màu sắc tôn giáo). Ngoài 211 truyện này, còn có 4 truyện xuất hiện trong các ấn bản trước, nhưng về sau đã bị anh em Grimm loại ra do sự tương đồng với các tác phẩm của những nhà văn khác.

215 truyện này đến được đầy đủ với độc giả nhờ sự chuyển ngữ của ba dịch giả khác nhau, gồm dịch giả Hữu Ngọc – các bản dịch truyện Grimm của ông được tái bản thường xuyên trong suốt 50 năm qua; dịch giả Lương Văn Hồng – người dịch và biên soạn nhiều bộ sách tiếng Đức; dịch giả Ngụy Hữu Tâm – người từng học tập và làm việc lâu năm tại Đức. Ngoài việc tổng hợp đầy đủ các truyện, những người làm sách còn tiến hành đốichiếu với bản dịch tiếng Anh của Dan L. Ashliman và Margaret Hunt đểbiên tập, thêm những phần bị thiếu, hiệu chỉnh tên riêng cho thống nhất với nguyên bản.

Về hình thức, chúng tôi sử dụng bộ minh họa Truyện Cổ Grimm đầy đủ đầu tiên của hai họa sĩ Philipp Grot Johann và Robert Leinweber xuất bản đầu thế kỷ XX tại Đức. Đây cũng là lần đầu bản minh họa của hai họa sĩ tài năng này được giới thiệu đến độc giả Việt Nam, với hầu hết các truyện đều có hình ảnh, giúp người đọc dễ hình dung hơn bối cảnh, nhân vật, trang phục và các vật dụng được miêu tả trong câu chuyện.','truyen-co-grimm-ban-cao-cap.jpg',2020/12/12 , 12, 8,3)

INSERT INTO SACH VALUES (N'NHỮNG CUỘC PHIÊU LƯU CỦA PINOCCHIO',153000 ,N'Hơn 100 năm qua, kể từ khi ra đời, câu chuyện Những cuộc phiêu lưu của Pinocchio của Carlo Collodi đã làm say mê bao thế hệ trẻ em khắp thế giới. Từ nguyên bản tác phẩm, biết bao cuốn sách, bao thước phim về cậu bé Pinocchio đã ra đời ở nhiều quốc gia. Lần này, Pinocchio đến với độc giả nhỏ tuổi Việt Nam với những điều vô cùng đặc biệt và thú vị thông qua hình thức truyện tranh.

Cuốn sách được minh họa bởi chính một họa sĩ người Ý, quê hương của Pinocchio - họa sĩ Tony Wolf - người đã trở nên rất đỗi quen thuộc với độc giả Việt Nam qua bộ Chuyện Rừng nay sẽ tiếp tục mang đến cho các em những hình ảnh vô cùng sinh động, ngộ nghĩnh về chú bé gỗ Pinocchio.

Có thể nói, chính những hình ảnh sống động ấy đã liên kết một chuỗi các tình tiết câu chuyện, tạo nên sức hấp dẫn cũng như sự li kì của chuyến phiêu lưu, khiến cho độc giả có cảm giác như đang được cùng bước vào thế giới của Pinocchio. Cái thế giới mà không đơn thuần chỉ được xây dựng lên bởi những đường nét minh họa tinh tế mà còn do sự phối màu rất hài hòa.

Bên cạnh đó, với văn phong trong sáng, tự nhiên và lối kể chuyện hài hước, dí dỏm, cuốn sách sẽ tạo cho các em sự gần gũi khi cùng sẻ chia với cậu bé Pinochio những thử thách và khó khăn trên chặng đường trở thành người tốt.

Ngoài ra, phần cuối cuốn sách còn dành đôi dòng ngắn gọn kèm một vài minh họa để giúp các em hiểu thêm đôi điều về tiểu sử Carlo Collodi - “cha đẻ” của kiệt tác này cũng như bối cảnh và quá trình ra đời tác phẩm.','SACH-nhung-cuoc-phieu-luu-cua-pinocchio.jpg' ,2020/12/12 , 12, 8,3)
INSERT INTO SACH VALUES(N'STEAM - TỚ LÀ NHÀ KỸ SƯ CHẾ TẠO',135200 ,N'','SACH-steam-to-la-nha-ky-su-che-tao.jpg' ,2020/12/12 , 12, 8,3)


INSERT INTO SACH VALUES(N'Lớp Học Mật Ngữ Ngoại Truyện- Vũ Trụ Song Ngư', 54000,N'LỚP HỌC MẬT NGỮ NGOẠI TRUYỆN

VŨ TRỤ SONG NGƯ - NHỮNG PHA XỬ LÝ ĐI VÀO LÒNG BIỂN CỦA SONG NGƯ VÀ “ĐỒNG BỌN”

Sau ngoại truyện về Song Tử được tween hưởng ứng nhiệt liệt thì cộng đồng Song Ngư hãy phấn khích đi thôi vì cuốn ngoại truyện này dành cho các bạn. Và nếu thuộc cung khác, thì quyển sách này cũng có rất nhiều điều để bạn khám phá về chính mình đấy, tuyệt cú chưa!

Song Ngư - bạn là ai?

Chúng ta đều biết chòm sao Song Ngư mang biểu tượng hai chú cá dễ thương, là cung hoàng đạo của những bạn có ngày sinh: 19/2 - 20/3. Với đặc điểm của cá, Song Ngư là người “bơi” trong một thế giới khác, xa rời mặt đất. Họ nhạy cảm, linh hoạt và… chạy trốn rất giỏi.

Bản chất Song Ngư cực kỳ tốt bụng. Đây là món quà lớn nhất mà vũ trụ trao cho Song Ngư. Nhưng nếu không biết sử dụng, đó là một gánh nặng. Song Ngư hay nghĩ cho người khác hơn là cho mình. Vừa mạnh mẽ vừa yếu đuối, vừa thông thái vừa trẻ con, vừa tốt bụng vừa… để bụng!

Là một trong ba cung Nước, Song Ngư rất mong manh, dễ bị bốc hơi! Bù lại, họ có khiếu nghệ thuật, thích sự lãng mạn và vô cùng tinh tế. Cùng với sự tác động của một cung biến đổi, Song Ngư là cung giàu cảm xúc nhất, dễ thấu hiểu, tận tâm lẫn sáng tạo nhất 12 cung hoàng đạo.

Sương sương vậy thôi, bạn có thấy chuẩn về cung Song Ngư chưa? Cuốn sách này sẽ còn cho bạn biết nhiều hơn thế. Cùng đi tìm profile thật của Song Ngư, khám phá về Song Ngư qua góc nhìn của các cung hoàng đạo khác, và tìm hiểu thêm các cung hoàng đạo qua lăng kính của Song Ngư… Vô vàn những phát hiện thú vị và mới mẻ sẽ được cập nhật trong tập này!

Vũ trụ Song Ngư có màu gì?

Hẳn bạn sẽ trả lời màu xanh của nước. Nhưng vũ trụ đó cũng ẩn chứa vô vàn điều kỳ thú. Cung hoàng đạo là cái tôi của các chòm sao. Nhưng cái tôi Song Ngư đó chỉ là phần nổi của tảng băng. Giống như vũ trụ đầy vật chất tối, tính cách của Song Ngư còn bị ảnh hưởng bởi những thế lực bí ẩn. Mặt Trăng tượng trưng cho thế giới cảm xúc. Hãy cùng tìm hiểu Song Ngư kết hợp với 12 thế giới cảm xúc sẽ cho ra phiên bản gì nhé!

Trong tập này còn có câu chuyện về Xử Nữ nam sáng tác truyện tranh nhưng bị chê dở nên tìm đến Song Ngư nữ để học hỏi cách sáng tạo. Song Ngư nữ thì muốn giúp nhưng rất tiếc, phải từ chối. Vì Song Ngư cũng… không biết tại sao mình sáng tạo được. Khó tả lắm! Bảo Bình nữ giải thích, đó là do Song Ngư nữ “xuất thần” và cảnh báo Xử Nữ nam, không xuất thần thì không thể đi xa trên con đường sáng tạo... Cuối cùng, các bạn ấy đã tìm ra công thức sáng tạo nào, cùng theo dõi nhé!','songngu.jpg' ,2020/12/12 , 12, 8,7)
INSERT INTO SACH VALUES (N'365 Truyện Kể Hàng Đêm - Mùa Đông',36000  ,N'365 Truyện Kể Hàng Đêm - Mùa Đông Trẻ nhỏ thường nhận thức thế giới qua những điều đơn giản. Chính vì thế, những quan điểm chuẩn mực về đạo đức của mỗi người thường bắt nguồn từ những câu chuyện nghe kể từ thuở ấu thơ. 365 truyện kể hàng đêm là series truyện kể dành cho bé được tuyển chọn theo “tinh thần” bốn mùa xuân, hạ, thu, đông… gồm những truyện kể ở xứ thần tiên, truyện kể tri thức, truyện hay rèn thói quen tốt, truyện kể về danh nhân, truyện kể dân gian… Mỗi câu chuyện sẽ mở ra một trải nghiệm đặc biệt, cung cấp một kiến thức thú vị, bồi dưỡng một phẩm chất ưu tú giúp bé trưởng thành. Cuốn sách tập hợp những truyện ngụ ngôn, đồng thoại, cổ tích đặc sắc từ xưa đến nay của nhiều quốc gia trên thế giới. Mỗi câu chuyện là một bài học nhỏ với các tình tiết sống động, hấp dẫn. Hy vọng rằng, cuốn sách sẽ trở thành một người bạn gần gũi, thân thiết của các em trong quá trình hình thành những phẩm chất tốt đẹp, tạo nền tảng vững chắc cho sự hình thành nhân cách trong tương lai.','image_61761.jpg' 
,2020/12/12 , 12, 8,8)



INSERT INTO SACH VALUES(N'BỘ SÁCH GIÁO KHOA LỚP 7- SÁCH BÀI HỌC (BỘ 12 CUỐN)', 134000,N'Sách giáo khoa là vật dụng quan trọng, không thể thiếu đối với quá trình học tập của học sinh. Sách giáo khoa là loại sách cung cấp kiến thức, được biên soạn với mục đích dạy và học tại trường học. 
 
Bộ Sách Giáo Khoa Lớp 7 (Bộ 12 Cuốn) tập hợp đầy đủ các môn học cần thiết phục vụ cho học sinh lớp 7 được biên soạn theo chương trình chuẩn của Bộ Giáo dục và Đào tạo. Bộ sách cung cấp kiến thức từ cơ bản đến nâng cao với các môn học :
Toán 7 Tập 1
Toán 7 Tập 2
Vật Lí 7
Công Nghệ 7
Ngữ Văn 7 Tập 1
Ngữ Văn 7 Tập 2
Lịch Sử 7
Địa Lí 7
Giáo Dục Công Dân 7
Âm Nhạc Và Mĩ Thuật 7
Tiếng Anh 7
Sinh Học 7','bo-SACH-giao-khoa-lop-7.jpg' ,2020/12/12 , 12, 5,5)

INSERT INTO SACH VALUES(N'BỘ SÁCH GIÁO KHOA LỚP 12 - SÁCH BÀI HỌC (BỘ 14 CUỐN)', 180000,N'Bộ Sách Giáo Khoa Lớp 12 (Bộ 14 Cuốn):
Cung cấp các kiến thức từ cơ bản đến nâng cao cho các em học sinh
Được biên soạn theo quy chuẩn của Bộ Giáo dục và Đào tạo
Hệ thống kiến thức khoa học, chính xác, được trình bày theo một trình tự logic chặt chẽ
Bộ sách giáo khoa chuẩn lớp 12 do Bộ Giáo dục quy định đang được nhiều học sinh cũng như các bậc phụ huynh có con em mới bước vào lớp 12 quan tâm.

Bộ Sách Giáo Khoa Lớp 12 (Chuẩn) gồm 14 cuốn:
Giải Tích 12
Hình Học 12
Vật Lí 12
Hóa Học 12
Sinh Học 12
Công Nghệ 12
Ngữ Văn 12 Tập 1
Ngữ Văn 12 Tập 2
Giáo Dục Công Dân
Tin Học 12
Tiếng Anh 12
Lịch Sử 12
Địa Lí 12
Giáo Dục Quốc Phòng - An Ninh 12','bo-SACH-giao-khoa-12.jpg' ,2020/12/12 , 12, 5,5)
INSERT INTO SACH VALUES(N'LUYỆN TẬP TIN HỌC 5 - TẬP 2 (CÙNG IC3 SPARK)',27000 ,N'Bộ sách Luyện tập tin học được biên soạn để phục vụ nhu cầu học Tin Học ở độ tuổi tiểu học nhằm trang bị cho học sinh tiểu học những kĩ năng có bản về sử dụng máy tính để học tập, rèn luyện, vui chơi giải trí được xây dựng một cách có hệ thống phù hợp với trình độ học sinh từ lớp 1 đến lớp 5. Với những phần mềm, công cụ vừa quen thuộc, nhưng cũng vừa hiện đại, bắt kịp với nhịp độ phát triển của công nghệ thông tin toàn cầu.
 

Quyển sách Luyện Tập Tin Học 5 - Tập 2 (Cùng IC3 Spark) không chỉ là một tài liệu luyện tập của học sinh lớp 2, mà giáo viên có thể sử dụng như giáo trình giảng dạy, phụ huynh học sinh cũng có thể tham khảo cùng học, cùng chơi và quản lí việc sử dụng máy tính của con em mình, giúp cho các em có thể tìm được niềm vui trong học tập. Nội dung quyển sách gồm 3 phần:
 

Phần 4: Lập trình logo nâng cao
Phần 5: Làm quen với bảng tính
Phần 6: Cộng tác hoàn thành sản phẩm công nghệ thông tin','luyen-tap-tin-hoc-5-tap-2-cung-ic3-spark.jpg' ,2020/12/12 , 12, 5,5)

INSERT INTO SACH VALUES (N'BỘ SÁCH GIÁO KHOA LỚP 3 (BỘ 13 CUỐN BÀI HỌC + BÀI TẬP)',115100,N'Bộ sách giáo khoa chuẩn lớp 3 do Bộ Giáo dục quy định đang được nhiều học sinh cũng như các bậc phụ huynh có con em chuẩn bị bước vào lớp 3 quan tâm.

Bộ sách bao gồm những đầu sách tối thiểu và sách bài tập được sử dụng trong giảng dạy và học tập trong toàn quốc.
Tiếng Việt 3 Tập 1
Tiếng Việt 3 Tập 2
Toán 3
Tự Nhiên Và Xã Hội 3
Tập Viết 3 Tập 1
Tập Viết 3 Tập 2
Vở Bài Tập Tiếng Việt 3 Tập 1
Vở Bài Tập Tiếng Việt 3 Tập 2
Vở Bài Tập Toán 3 Tập 1
Vở Bài Tập Toán 3 Tập 2
Vở Bài Tập Tự Nhiên Và Xã Hội 3
Vở Bài Tập Đạo Đức 3
Tập Bài Hát 3','bo-SACH-giao-khoa-lop-3.jpg' ,2020/12/12 , 12, 5,5)

INSERT INTO SACH VALUES(N'BỘ SÁCH GIÁO KHOA LỚP 4 (BỘ 20 CUỐN BÀI HỌC + BÀI TẬP)', 197400,N'Lớp 4 là giai đoạn gần cuối Tiểu học với các kiến thức nền tảng mới vô cùng quan trọng. Đây cũng là giai đoạn trẻ đã có sự nỗ lực về ý chí trong hoạt động học tập như học thuộc một bài thơ, một công thức toán hay một bài hát dài. 

Bộ Sách Giáo Khoa Lớp 4 (Bộ 20 Cuốn Bài Học + Bài Tập)  tập hợp đầy đủ các môn học cần thiết phục vụ cho học sinh lớp 4 được biên soạn theo chương trình chuẩn của Bộ Giáo dục và Đào tạo. Bộ sách cung cấp kiến thức từ cơ bản đến nâng cao cho con trẻ với các môn học :
Tiếng Việt 4 Tập 1
Tiếng Việt 4 Tập 2
Toán 4
Khoa Học 4
Lịch Sử Và Địa Lí 4
Âm Nhạc 4
Mỹ Thuật 4
Đạo Đức 4
Kĩ Thuật 4
Vở Bài Tập Tiếng Việt 4 Tập 1
Vở Bài Tập Tiếng Việt 4 Tập 2
Vở Bài Tập Toán 4 Tập 1
Vở Bài Tập Toán 4 Tập 2
Vở Bài Tập Lịch Sử 4
Vở Bài Tập Đạo Đức 4
Bài Tập Toán 4
Thực Hành Kĩ Thuật 4
Vở Bài Tập Địa Lí 4
Luyện Viết Chữ Lớp 4
Vở Bài Tập Khoa Học 4','bo-SACH-giao-khoa-lop-4.jpg' ,2020/12/12 , 12, 5,5)


INSERT INTO SACH VALUES(N'Kiếp Nào Ta Cũng Tìm Thấy Nhau - Câu Chuyện Về Những Linh Hồn Tri Kỷ Vĩnh Viễn Không Chia Lìa', 59500,N'Kiếp nào ta cũng tìm thấy nhau là cuốn sách thứ ba của Brain L. Weiss – một nhà tâm thần học có tiếng. Trước đó ông đã viết hai cuốn sách: cuốn đầu tiên là Ám ảnh từ kiếp trước, cuốn sách mô tả câu chuyện có thật về một bệnh nhân trẻ tuổi cùng với những liệu pháp thôi miên về kiếp trước đã làm thay đổi cả cuộc đời tác giả lẫn cô ấy. Cuốn sách đã bán chạy trên toàn thế giới với hơn 2 triệu bản in và được dịch sang hơn 20 ngôn ngữ. Cuốn sách thứ hai Through  Time  into  Healing (Đi  qua  thời  gian  để chữa lành), mô tả những gì tác giả đã học được về tiềm năng chữa bệnh của liệu pháp hồi quy tiền kiếp. Trong cuốn sách đều là những câu chuyện người thật việc thật. Nhưng  câu  chuyện  hấp  dẫn  nhất lại  nằm  trong cuốn sách thứ ba.

Kiếp nào ta cũng tìm thấy nhau nói về những linh hồn tri kỷ, những người có mối liên kết vĩnh viễn với nhau bằng tình yêu thương, luôn gặp lại nhau hết lần này đến lần khác, qua hết kiếp này tới kiếp khác. Chúng ta sẽ tìm thấy và nhận ra tri kỷ của mình như thế nào, rồi đưa ra những quyết định làm thay đổi cuộc sống của chính mình ra sao là những khoảnh khắc quan trọng và xúc động nhất trong cuộc đời mỗi người.

Định  mệnh  sẽ dẫn  lối cho  những  linh  hồn tri  kỷ hội ngộ. Chúng ta sẽ gặp họ. Nhưng quyết định làm gì sau đó lại là quyền tự do lựa chọn của mỗi người. Một lựa chọn sai lầm hoặc một cơ hội bị bỏ lỡ có thể dẫn đến nỗi cô đơn và thống khổ tột cùng. Và một lựa chọn đúng đắn, một cơ hội được nắm bắt có thể mang lại niềm hạnh phúc sâu sắc.

Những gì tác giả viết trong sách được ghi lại từ hồ sơ bệnh án, băng thu âm và trí nhớ. Chỉ có tên và một vài chi tiết nhỏ được thay đổi để giữ tính bảo mật. Đây là câu chuyện về vận mệnh và hy vọng. Đây là câu chuyện xảy ra âm thầm mỗi ngày.

Ngày này năm đó, đã có người lắng nghe.

Linh hồn tựa như nước

Rơi xuống từ thiên đường

Lên trời như khói sương

Rồi trở về với đất

Chuỗi tuần hoàn bất tận.

GOETHE','image_180561.jpg' ,2020/12/12 , 20, 3,9)


INSERT INTO SACH VALUES(N'Ám Ảnh Từ Kiếp Trước (Tái Bản 2020)', 62300,N'Cuốn sách hay và khiêu khích suy nghĩ này đã phá vở những rào cản trong trị liệu tâm lý truyền thống và trình bày một biện pháp trị liệu cách tân và hiệu quả cao. Những ai làm việc chuyên về sức khỏe tâm thần cần phải xem xét nó nghiêm túc.” – Edith Fiore, TS., bác sỹ tâm lý học lâm sàng và là tác giả cuốn sách Bạn từng ở đây trước kia (You Have Been Here Before)

Vốn là nhà tâm lý trị liệu truyền thống, TS. Brian Weiss đã kinh ngạc và bi quan khi một trong những bệnh nhân của mình bắt đầu nhớ lại những chấn thương trong kiếp trước mà chúng dường như là chìa khóa để giải quyết những cơn ác mộng và lo lắng lặp đi lặp lại. Tuy nhiên, chủ nghĩa bi quan của ông bị xói mòn khi cô ấy bắt đầu phát những thông điệp từ “những sinh thể ở giữa không gian,” chứa đựng những tiết lộ quan trọng về gia đình của TS. Weiss và cái chết của con trai ông. Bằng biện pháp kiếp trước, ông có khả năng chữa lành cho bệnh nhân và mở ra một giai đoạn mới đầy ý nghĩa trong nghề nghiệp của chính mình.

“Tường thuật xúc động sâu xa về sự tĩnh thức tâm linh ngoài dự liệu của một ngừoi đàn ông. Cuốn sách rất can đảm này đã mở cánh cửa cho một cuộc hôn phối giữa khoa học và siêu hình học. Cuốn sách phải đọc vì một thế giới khát khao, tìm kiếm linh hồn.” – Jeanne Avery, tác giả của Chiêm tinh học và tiền kiếp (Astrology and Your Past Lives)

“Một trường hợp xuất thần lịch sử chứng minh tính hiệu quả của liệu pháp kiếp trước. Cuốn sách này sẽ mở ra những cánh cửa cho nhiều người chưa bao giờ nghĩ đến tính hợp lý của việc đầu thai trở lại.” – Richard Sutphen, tác giả của Tiền kiếp, tình yêu tương lai và bạn được sinh trở lại để được bên nhau (Past Lives, Future Loves and You Were Born Again to Be Together)

TS. Brian L. Weiss, bác sỹ tâm thần học, sống và làm việc ở Miami, Florida. Ông tốt nghiệp trường đại học Columbia và trường y khoa của đại học Yale và là Chủ tịch Danh dự Tâm thần học của Trung tâm Y khoa Núi Sinai ở Miami. TS. Weiss vẫn có phòng trị liệu riêng ở Miami và tổ chức những hội nghị quốc tế, hội thảo trải nghiệm cũng như những chương trình huấn luyện cho những người hành nghề chuyên nghiệp. Ông cũng là tác giả của Đi qua thời gian để chữa lành (Through Time Into Healing) và Linh hồn cũ xác thân mới.','image_197918.jpg' 
,2020/12/12 , 12, 3,9)


INSERT INTO SACH VALUES(N'Quẳng Gánh Lo Đi Và Vui Sống (Tái Bản 2018)', 59.280,N'Quẳng Gánh Lo Đi Và Vui Sống là cuốn sách mà cái tên đã nói lên tất cả nội dung chuyển tải trên những trang giấy.

Bất kỳ ai đang sống đều sẽ có những lo lắng thường trực về học hành, công việc, những hoá đơn, chuyện nhà cửa,… Cuộc sống không dễ dàng giải thoát bạn khỏi căng thẳng, ngược lại, nếu quá lo lắng, bạn có thể mắc bệnh trầm cảm. Quẳng Gánh Lo Đi Và Vui Sống khuyên bạn hãy khóa chặt dĩ vãng và tương lai lại để sống trong cái phòng kín mít của ngày hôm nay. Mọi vấn đề đều có thể được giải quyết, chỉ cần bạn bình tĩnh và xác định đúng hành động cần làm vào đúng thời điểm.

Nói thì có vẻ dễ nhưng những vấn đề liên quan đến các trạng thái tinh thần chẳng bao giờ dễ giải quyết. Chấm dứt lo lắng là điều không thể nhưng bớt đi sự lo lắng thì có thể, chỉ cần bạn đủ quyết tâm.

Quẳng Gánh Lo Đi Và Vui Sống khuyên bạn những cách để giảm thiểu lo lắng rất đơn giản như chia sẻ nó với người khác, tìm cách giải quyết vấn đề, quên tất cả những điều lo lắng nằm ngoài tầm tay,... Cố gắng thực tập điều này hàng ngày và trong cuộc sống chắc hẳn bạn sẽ thành công, có thể, không được như bạn muốn, nhưng chỉ cần bớt đi một chút phiền muộn thì cuộc sống của bạn đã có thêm một niềm vui.

Nhờ các phương pháp của Dale Carnegie, hàng triệu người đọc đã xây dựng được thái độ sống tích cực, an tâm cảm nhận hạnh phúc và mãi mãi loại bỏ thói quen lo lắng:

Hãy đóng chặt những cánh cửa sắt dẫn đến quá khứ và tương lai. Chỉ sống trong những vách ngăn của hiện tại.

Nhìn nhận những mặt tích cực của cuộc sống

Khi làm việc đến quên mình, ta cũng quên đi mọi lo lắng

Thử kiểm tra theo luật bình quân, xác suất xảy ra điều bạn đang lo lắng là bao nhiêu phần trăm?

Luôn nỗ lực hết mình

Hãy nghĩ đến những may mắn bạn có được chứ không phải là những rắc rối

Hãy quên đi bản thân bằng cách quan tâm đến người khác. Mỗi ngày làm một điều tốt có thể khiến ai đó mỉm cười.

Qua hơn nửa thế kỷ, những lời khuyên thiết thực và sâu sắc của Dale Carnegie vẫn còn nguyên giá trị cho đến ngày nay. Ngay bây giờ, bạn đã có thể ghi tên mình vào danh sách hàng triệu con người đã học được cách: Quẳng gánh lo đi và vui sống!

BÁO CHÍ NÓI VỀ CUỐN SÁCH

“Đây là cuốn sách kinh điển, được xem là cẩm nang giúp người đọc có thể tự nhìn nhận và vượt qua sự lo lắng, bất an của bản thân”. - Nhịp cầu đầu tư','quangganhlodi-biacung1.jpg' 
,2020/12/12 , 12, 3,6)


INSERT INTO SACH VALUES(N'Rèn Luyện Tư Duy Phản Biện', 90000,N'Như bạn có thể thấy, chìa khóa để trở thành một người có tư duy phản biện tốt chính là sự tự nhận thức. Bạn cần phải đánh giá trung thực những điều trước đây bạn nghĩ là đúng, cũng như quá trình suy nghĩ đã dẫn bạn tới những kết luận đó. Nếu bạn không có những lý lẽ hợp lý, hoặc nếu suy nghĩ của bạn bị ảnh hưởng bởi những kinh nghiệm và cảm xúc, thì lúc đó hãy cân nhắc sử dụng tư duy phản biện! Bạn cần phải nhận ra được rằng con người, kể từ khi sinh ra, rất giỏi việc đưa ra những lý do lý giải cho những suy nghĩ khiếm khuyết của mình. Nếu bạn đang có những kết luận sai lệch này thì có một sự thật là những đức tin của bạn thường mâu thuẫn với nhau và đó thường là kết quả của thiên kiến xác nhận, nhưng nếu bạn biết điều này, thì bạn đã tiến gần hơn tới sự thật rồi!

Những người tư duy phản biện cũng biết rằng họ cần thu thập những ý tưởng và đức tin của mọi người. Tư duy phản biện không thể tự nhiên mà có.

Những người khác có thể đưa ra những góc nhìn khác mà bạn có thể chưa bao giờ nghĩ tới, và họ có thể chỉ ra những lỗ hổng trong logic của bạn mà bạn đã hoàn toàn bỏ qua. Bạn không cần phải hoàn toàn đồng ý với ý kiến của những người khác, bởi vì điều này cũng có thể dẫn tới những vấn đề liên quan đến thiên kiến, nhưng một cuộc thảo luận phản biện là một bài tập tư duy cực kỳ hiệu quả.

Việc lắng nghe những ý kiến của người khác cũng có thể giúp bạn nhận ra rằng phạm vi tri thức của bạn không phải là vô hạn. Không ai có thể biết hết tất cả mọi thứ. Nhưng với việc chia sẻ và đánh giá phê bình kiến thức, chúng ta có thể mở rộng tâm trí. Nếu điều này khiến bạn cảm thấy không thoải mái, không sao cả. Trên thực tế, bước ra ngoài vùng an toàn là một điều quan trọng để mở rộng niềm tin và suy nghĩ của bạn. Tư duy phản biện không phải là chỉ biết vài thứ, và chắc chắn không phải việc xác nhận những điều bạn đã biết. Thay vào đó, nó xoay quanh việc tìm kiếm sự thật – và biến chúng trở thành thứ bạn biết.','image_195509_1_18448.jpg' 
,2020/12/12 , 12, 3,10)



INSERT INTO SACH VALUES(N'Nghệ Thuật Tư Duy Phản Biện',129000 ,N'Tư duy phản biện là một phần trong cuộc sống hằng ngày, bạn cần nắm lấy và phát triển từ nó. Thực hiện nghiên cứu của bạn, tìm kiếm các nguồn thông tin tốt, đưa ra lập luận của bạn và cân nhắc phản bác, cân nhắc xem bạn có đưa ra giả định hay không và đừng vội vàng đưa ra quyết định nếu bạn không hài lòng với thông tin bạn thu thập được.

Bạn có phải là một y tá phẫu thuật hay thậm chí làm việc trong lĩnh vực y tế, thì bạn cũng có thể thực hiện một số hình thức thử nghiệm. Việc đưa ra quyết định về những việc cần xử lý tại nơi làm việc và ở nhà dựa trên mức độ ưu tiên và mức độ khẩn cấp của hoàn cảnh.

Nếu bạn có một dự án đến hạn vào ngày mai, dự án đó sẽ được ưu tiên hơn dự án đến hạn vào tháng sau. Đứa con mới sinh của bạn cần được vỗ về trước khi giúp đứa con lớn hơn làm bài tập về nhà và giúp ra những quyết định dựa trên khả năng suy nghĩ chín chắn của mình và cuốn sách này đã chỉ ra cách phát triển và nâng cao những kỹ năng đó để bạn được trao quyền đạt được nhiều thành quả và thành công hơn.

Bây giờ bạn đã có các kỹ năng cần thiết để trở thành một nhà tư tưởng phản biện hiệu quả, hãy bắt đầu sử dụng các kỹ năng mới phát triển của bạn ngay hôm nay. Thách thức bản thân đánh giá một cách nghiêm túc niềm tin của bạn và tự quyết định xem bạn có thực sự hiểu được ý nghĩa và lịch sử đằng sau những suy nghĩ và quan điểm của mình hay không. Bạn có thể hoặc không thay đổi quan điểm của mình, nhưng ít nhất bạn chắc chắn sẽ biết mình đang đứng ở đâu và tại sao. Hãy bắt đầu áp dụng lập luận phản biện trong cuộc sống hằng ngày của bạn khi bạn đưa ra quyết định và đưa ra kết luận cả lớn và nhỏ.

Trong cuộc đời mỗi người, không ai có thể tránh được những tổn thương về mặt cảm xúc, nhưng nếu tâm trí và cảm xúc phân minh, bạn sẽ có thể lùi lại một bước trước những cảm xúc cá nhân để giải quyết tình huống theo cách có lợi nhất cho bạn. Đồng thời, bạn sẽ có thể sử dụng kỹ năng tư duy phản biện để thách thức các ý tưởng và lý tưởng. “Nghệ thuật tư duy phản biện” sẽ giúp bạn chuẩn bị sẵn bộ tư duy khẩn cấp của riêng mình, qua đó đưa ra những quyết định hợp lý, thấu đáo dựa trên bằng chứng thực tế.

Hãy nghĩ đến coi tư duy phản biện như một cơ hội để tương tác với những người khác và tìm hiểu quan điểm của họ. Đánh giá những gì người khác nói và xem xét các nguồn thông tin để quyết định xem chúng có xứng đáng hay không. “Nghệ thuật tư duy phản biện” là một tài liệu tuyệt vời giúp bạn học được những kỹ năng đó và bạn có thể tham khảo lại khi cần. Hãy nhớ rằng, hơn bất cứ điều gì, hãy rèn luyện kỹ năng tư duy phản biện của bạn, và bạn không bao giờ có thể sai lầm.

Luyện tập làm nên sự hoàn hảo. Đừng ngần ngại triển khai các kỹ năng bạn đã học được trong cuốn sách này ngay hôm nay.','image_220921.jpg' ,2020/12/12 , 12, 3,9)
 

INSERT INTO SACH VALUES(N'Từ Tốt Đến Vĩ Đại (Tái Bản 2021)',130000,N'Jim Collins cùng nhóm nghiên cứu đã miệt mài nghiên cứu những công ty có bước nhảy vọt và bền vững để rút ra những kết luận sát sườn, những yếu tố cần kíp để đưa công ty từ tốt đến vĩ đại. Đó là những yếu tố khả năng lãnh đạo, con người, văn hóa, kỷ luật, công nghệ… Những yếu tố này được nhóm nghiên cứu xem xét tỉ mỉ và kiểm chứng cụ thể qua 11 công ty nhảy vọt lên vĩ đại. Mỗi kết luận của nhóm nghiên cứu đều hữu ích, vượt thời gian, ý nghĩa vô cùng to lớn đối với mọi lãnh đạo và quản lý ở mọi loại hình công ty (từ công ty có nền tảng và xuất phát tốt đến những công ty mới khởi nghiệp), và mọi lĩnh vực ngành nghề. Đây là cuốn sách nên đọc đối với bất kỳ lãnh đạo hay quản lý nào!

','nxbtre_full_09462021_024609.jpg',2021/1/1,20,2,2)


INSERT INTO SACH VALUES(N'Trên Đỉnh Phố Wall (Tái Bản 2021)',219000,N'Peter Lynch là nhà quản lý tài chính số 1 ở Mỹ. Quan điểm của ông là: Tất cả các nhà đầu tư trung bình đều có thể trở thành những chuyên gia hàng đầu trong lĩnh vực của họ và họ có thể chọn được những cổ phiếu hời nhất không kém gì các chuyên gia đầu tư trên Phố Wall chỉ bằng việc thực hiện một cuộc điều tra nhỏ.

Trong cuốn sách, Lynch đề cập đến cách thức mà ông đã đạt được thành tích đầu tư vĩ đại của mình khi là cựu giám đốc xuất sắc của quỹ đầu tư hàng tỷ đô-la Magellan. Viết cùng Joghn Rothchild, Trên đỉnh Phố Wall đưa ra những chỉ dẫn dễ dàng áp dụng để có thể lựa chọn được những danh mục từ việc đánh giá các báo cáo tài chính của công ty và nhận ra những con số thực sự có giá trị. Ông giải thích và đưa ra những chỉ dẫn để đầu tư theo chu kỳ, hay thay đổi hoàn toàn danh mục đầu tư để theo đuổi những công ty đang phát triển nhanh.

Lynch khẳng định rằng, nếu bạn không bị chi phối bởi sự thất thường của thị trường sự ham muốn tức thời về lợi nhuận, bạn sẽ được đền đáp bởi danh mục đầu tư của mình, (sau khoảng từ 5 đến 15 năm). Lời khuyên này đã được chứng minh là sống mãi với thời gian và đã biến Trên đỉnh Phố Wall trở thành tác phẩm bán chạy số 1 ở Mỹ. Và cho đến bây giờ, cuốn sách kinh điển này vẫn giữ nguyên giá trị ban đầu của nó.','image_230105.jpg',2021/1/1,20,2,9),


(N'Lời Tự Thú Của Một Bậc Thầy Định Giá - Confessions Of The Pricing Man',199000,N'Hermann Simon- Chuyên gia hàng đầu thế giới về chiến lược định giá tiết lộ cách quy trình bí ẩn này hoạt động và cách tối đa hóa giá trị thông qua việc định giá cho công ty và khách hàng. Trong câu chuyện hấp dẫn và thực tế này, tác giả đã mô tả một ly cocktail định giá, giải thích từng thành phần thông qua hàng chục câu chuyện được thu thập trong bốn thập kỷ làm việc của ông. Là diễn giả nổi tiếng thế giới về định giá và là cố vấn đáng tin cậy cho các giám đốc điều hành Fortune 500, cuộc hành trình cả đời của Simon đã đưa ông từ các chợ của người nông dân đến sự nghiệp với tư cách là doanh nhân và nhà tư vấn quản lý cho các công ty lớn, nhỏ trên khắp thế giới. Ông đã học hỏi từ những người đoạt giải Nobel và các chuyên gia quản lý hàng đầu, đồng thời giúp vô số nhà quản lý và giám đốc điều hành sử dụng định giá như một cách để tạo ra thị trường mới, phát triển doanh nghiệp và đạt được lợi thế cạnh tranh bền vững. Tại đây, đối với người tiêu dung cũng như những người làm kinh doanh, ông tiết lộ bí mật của các phương pháp định giá thành công, đồng thời chia sẻ trí tuệ và sự thông minh sẽ thay đổi mãi mãi cách bạn tư duy về định giá.

Đánh giá của chuyên gia:

“ Đây là cuốn sách hay nhất mà tôi biết để giúp bạn mở mang đầu óc về những vấn đề thực tế trong định giá” - Philip Kotler, Giáo sư xuất sắc về marketing quốc tế tại trường quản lý Kellogg, Đại học Northwestern, được xem là huyền thoạt marketing Thế giới -','image_219043.jpg'
,2021/1/1,20,2,11)


INSERT INTO SACH VALUES(N'LÃNH ĐẠO TẬP SỰ - HÀNH TRÌNH KHÔNG ĐƠN ĐỘC',140000,N'Walt Disney luôn được biết đến như một cây đại thụ trong ngành giải trí thế giới, tuy nhiên bạn có biết thương hiệu này là một trong những case-study điển hình về quản trị và lãnh đạo?

Dan Cockerell vốn bắt đầu tại Disney với chức vụ trông xe. Trải qua 26 năm làm việc ở 19 vị trí khác nhau, ông trở thành Phó Chủ tịch của Magic Kingdom - công viên giải trí thế giới thuộc hệ sinh thái Disney. Vậy điều gì đã giúp Dan đi từ một vị trí rất đỗi bình thường đến một nhà lãnh đạo tài ba điều hành cả một công viên khổng lồ với hơn 12.000 nhân viên?

Tất cả những kinh nghiệm và bài học quý giá về kỹ năng và tư duy lãnh đạo của ông đã được đúc kết lại trong cuốn sách Lãnh Đạo Tập Sự - Hành Trình Không Đơn Độc. Xuyên suốt sự nghiệp ở Disney, Dan đã học được nhiều bài học về cuộc sống và khả năng lãnh đạo. Ông đã truyền đạt lại những điều đó trong cuốn sách “Lãnh đạo tập sự” để giúp cho các nhà lãnh đạo chuẩn bị dẫn dắt đội ngũ của họ thông qua học 4 khía cạnh:

Lãnh đạo bản thân

Lãnh đạo nhóm

Lãnh đạo tổ chức

Lãnh đạo sự thay đổi

Trong mỗi phần, tác giả chia sẻ các kiến thức và kinh nghiệm thực tế cũng như các công cụ tự đánh giá và những thực tiễn tốt nhất dựa trên nghiên cứu. Ở cuối mỗi chương, bạn cũng sẽ tìm thấy một kế hoạch hành động để giúp bạn đặt ra các ưu tiên và cải thiện các lĩnh vực quan trọng nhất của cuộc sống, để có cơ hội đạt được kết quả tích cực và thành công lớn nhất.

Những hiểu biết sâu sắc về lãnh đạo mà Dan chia sẻ trong cuốn sách này sẽ những bài học hữu ích với bất kỳ ai khao khát làm chủ bản thân và hướng tới lãnh đạo những điều lớn lao hơn. Dù bạn là ai, bạn đang làm ở đâu, vị trí nào, bạn hoàn toàn có khả năng rèn luyện và khai phá khả năng lãnh đạo của riêng mình.

Bạn đã sẵn sàng để khám phá tiềm năng lãnh đạo bên trong cùng cuốn sách này chưa?','SACH-lanh-dao-tap-su-hanh-trinh-khong-don-doc.jpg',2021/1/1,20,2,11)


INSERT INTO SACH VALUES(N'Think And Grow Rich - 13 Nguyên Tắc Nghĩ Giàu, Làm Giàu (Tái Bản)',110000,N'Cuốn sách sẽ giúp bạn trở nên giàu có, làm giàu cho cuộc sống của bạn trên tất cả các phương diện của cuộc sống chứ không chỉ về tài chính và vật chất.
Think and grow rich – 13 nguyên tắc nghĩ giàu, làm giàu là cuốn sách “chỉ dẫn” duy nhất chỉ ra những nguồn lực bạn phải có để thành công. Mỗi chương trong cuốn sách đều đề cập đến bí quyết kiếm tiền, từ việc có niềm tin, có mong muốn đến những kiến thức chuyên sâu, những ý tưởng, những kế hoạch, những cách đưa ra quyết định.
“THINK AND GROW RICH
Mua nó…
Bạn có một cuốn sách.
Đọc nó…
Bạn có một kế hoạch làm giàu
Làm theo kế hoạch đó…
Bạn có cả thế giới!”
Theo quy luật tự nhiên, bí quyết này sẽ buộc bạn phải trả giá, nhưng cái giá phải trả thấp hơn rất nhiều so với giá trị thực sự của nó. Nó không thể được định giá bởi những người không muốn tìm kiếm nó. Bí quyết này cũng không thể cho đi vì nó không thể mua được bằng tiền, bởi nó có hai phần và một phần vốn đã tồn tại trong những con người sẵn sàng đón nhận nó.','da8bf5951313326908cd2504c9f4590b.jpg'
,2021/1/1,20,2,9)


INSERT INTO SACH VALUES(N'Khi Hơi Thở Hóa Thinh Không (Tái Bản 2020)',109000,N'Khi hơi thở hóa thinh không là tự truyện của một bác sĩ bị mắc bệnh ung thư phổi. Trong cuốn sách này, tác giả đã chia sẻ những trải nghiệm từ khi mới bắt đầu học ngành y, tiếp xúc với bệnh nhân cho tới khi phát hiện ra mình bị ung thư và phải điều trị lâu dài.

Kalanithi rất yêu thích văn chương nên câu chuyện của anh đã được thuật lại theo một phong cách mượt mà, dung dị và đầy cảm xúc. Độc giả cũng được hiểu thêm về triết lý sống, triết lý nghề y của Kalanithi, thông qua ký ức về những ngày anh còn là sinh viên, rồi thực tập, cho đến khi chính thức hành nghề phẫu thuật thần kinh. “Đối với bệnh nhân và gia đình, phẫu thuật não là sự kiện bi thảm nhất mà họ từng phải đối mặt và nó có tác động như bất kỳ một biến cố lớn lao trong đời. Trong những thời điểm nguy cấp đó, câu hỏi không chỉ đơn thuần là sống hay chết mà còn là cuộc sống nào đáng sống.” – Kalanithi luôn biết cách đưa vào câu chuyện những suy nghĩ sâu sắc và đầy sự đồng cảm như thế.

Bạn bè và gia đình đã dành tặng những lời trìu mến nhất cho con người đáng kính trọng cả về tài năng lẫn nhân cách này. Dù không thể vượt qua cơn bệnh nan y, nhưng thông điệp của tác giả sẽ còn khiến người đọc nhớ mãi.','image_220964.jpg'
,2021/1/1,20,1,9)



INSERT INTO SACH VALUES (N'Sống Mạo Hiểm Một Cách Cẩn Thận',159000,N'Siêu mẫu quốc tế Maye Musk đã chia sẻ những câu chuyện cá nhân cùng các bài học rút ra từ cuộc đời "Sống mạo hiểm một cách cẩn thận."

Maye Musk là một siêu mẫu thời trang, cuốn hút và thích xê dịch với những mối quan hệ khăng khít, đầy thú vị cùng gia đình và bạn bè - và năm nay bà đã ngoài bảy mươi tuổi. Nhưng mọi thứ không phải lúc nào cũng dễ dàng hay hào nhoáng - bà bắt đầu làm mẹ đơn thân ở tuổi 31, vật lộn với cái nghèo để nuôi dạy cho ba người con; đối mặt với những vấn đề về cân nặng khi làm một người mẫu quá khổ và vượt qua những định kiến về tuổi tác trong ngành người mẫu; đồng thời kiến lập một sự nghiệp trọn đời trong vai trò một chuyên gia dinh dưỡng được trọng vọng, mà trong suốt quá trình đó bà không ngừng bắt đầu lại ở nhiều thành phố khác nhau thuộc ba quốc gia và hai lục địa. Nhưng bà đã vượt qua tất cả với một tinh thần bất khuất và thái độ nghiêm túc để trở thành một người thành công trên toàn cầu ở độ tuổi mà bà gọi là "đỉnh cao của đời tôi".

Trong Sống mạo hiểm một cách cẩn thận, Maye chia sẻ những kinh nghiệm của đời mình, hàm chứa trong đó các triết lý được đúc kết trong gian nan về sự nghiệp (càng chăm chỉ, càng may mắn), gia đình (để người mình yêu thương đi con đường riêng), sức khỏe (không hề có thần dược) và phiêu lưu (luôn tạo không gian cho sự khám phá, nhưng luôn sẵn sàng đón nhận bất kỳ điều gì). Bạn không kiểm soát mọi thứ xảy ra trong đời, nhưng bạn có thể sống cuộc đời mình muốn ở bất kỳ tuổi nào. Tất cả những gì bạn phải làm là lên kế hoạch.

Một số đánh giá về cuốn sách:

"Từ lâu tôi đã ngưỡng mộ Maye Musk cả trong vai trò người mẫu lẫn một người phụ nữ. Bác đã truyền cảm hứng cho nhiều người xuyên suốt sự nghiệp của mình, và những triết lý cùng quan điểm vô giá của bác hiển hiện trên từng trang của cuốn sách này."   - Karlie Kloss

"Ấm áp, chân thành mà không giả dối, Sống mạo hiểm một cách cẩn thận chứa đầy những quan điểm sâu sắc cùng chất hài hước với hàm lượng hợp lý, mang lại cho người đọc những lời khuyên phải khó khăn lắm mới có được của cả đời người. Maye Musk là người phụ nữ trách nhiệm với hiểu biết rằng cuộc sống đầy những bất ngờ và làm chủ cuộc sống một cách trọn vẹn!"  - Diane Von Furstenberg

"Mỹ nhân phi thường Maye Musk là bằng chứng sống cho thấy một chế độ ăn uống lành mạnh là nền tảng cho một cuộc sống đầy ắp niềm vui, năng động và giàu năng lượng."   - Christie Brinkle','b_a-1-s_ng-m_o-hi_m.jpg',2021/1/1,20,1,9)


INSERT INTO SACH VALUES(N'Maria Montessori Cuộc Đời Và Sự Nghiệp (Tái Bản 2019)',200000,N'Maria Montessori Cuộc đời và sự nghiệp cung cấp cho độc giả những kiến thức nền tảng cơ bản về cuộc đời và sự nghiệp của một trong những nhà giáo dục vĩ đại nhất thế kỷ XX – Maria Montessori. Xuất thân trong một gia đình không giàu có với ông bố là một quân nhân nghiêm khắc, Maria không được chiều chuộng như một tiểu thư mà phải tự lập, tự lao động trong một nếp kỷ luật rất nghiêm. Dù cho cha mẹ hướng nghiệp trở thành một nhà giáo nhưng Maria mơ ước trở thành một kỹ sư  rồi sau lại trở thành sinh viên y khoa – những nghề rất lạ lẫm với phụ nữ thời bấy giờ. Vượt qua bao nhiêu rào cản và định kiến, Maria là nữ sinh viên duy nhất được nhận vào học khoa Y của Đại học Rome vào năm 1890. Bà đã nỗ lực học tập và trở thành người phụ nữ đầu tiên nhận bằng Bác sĩ ở nước Ý vào năm 1896 (khi bà 26 tuổi).

Từ một bác sĩ tâm thần chuyên giúp đỡ những trẻ em chậm phát triển trí tuệ, một cơ duyên tình cờ đã đưa bà đến với sự nghiệp giáo dục trẻ thơ và bản thân bà đã không ngừng khám phá, nghiên cứu và tự hoàn thiện một triết lý giáo dục: hãy tôn trọng trẻ em và tìm cách cư xử với trẻ em một cách tự nhiên nhất có thể. Tác giả Standing ví khám phá của Maria Montessori cũng vĩ đại ngang với Columbus khám phá ra châu Mỹ. Chỉ có điều, thế giới mà Columbus khám phá ra là bên ngoài; còn Montessori đã khám phá ra một thế giới bên trong – bên trong tâm hồn của trẻ em. Xin đừng hiểu lầm về điều này; nó là một khám phá thiên tài về một thứ cũng khách quan như Châu Mỹ đối với Columbus, như Luật Hấp dẫn đối với Newton. Thật sự thì khám phá này mới là thứ đem lại sự nổi tiếng cho bà chứ không phải phương pháp dạy trẻ của bà. Maria Montessori đã khám phá thấy những phẩm chất bình thường của trẻ em cho đến nay vẫn bị che giấu dưới vỏ bọc là những lệch lạc. Maria Montessori đã khám phá ra rằng trẻ em có những phẩm chất khác biệt và cao hơn những gì chúng ta thường gán cho các em.

Từ một ngôi trường đầu tiên mang tên Casa dei Bambini (Ngôi nhà Trẻ thơ) ở Roma năm 1907, sau hơn một thế kỷ đã có hơn 2.5000 trường học mang tên Montessori với đầy hấp lực từ Âu sang Á, từ Mỹ sang Phi…  Những ghi chép của bà được gọi với tên Phương pháp Montessori ngày nay đã được dịch sang hơn 20 thứ tiếng trên toàn cầu.','image_195509_1_2141.jpg'
,2021/1/1,20,1,2)
INSERT INTO SACH VALUES(N'Nam Phương - Hoàng Hậu Cuối Cùng (Tái Bản 2018)',79000,N'Cuốn sách là tập hợp những câu chuyện về Hoàng hậu Nam Phương, người con gái tài sắc vẹn toàn của đất Gò Công - Tiền Giang, người đã chinh phục hoàn toàn trái tim của Hoàng đế Bảo Đại để bước lên ngôi Hoàng hậu của triều Nguyễn vào năm 1934.
 
Sinh ra trong một gia đình giàu có, lẽ ra cuộc đời của người con gái mang tên Nguyễn Thị Lan đã bình lặng và sung sướng hơn nhiều nếu như không có cuộc gặp gỡ định mệnh với vị Hoàng đế trẻ tuổi của nước Đại Nam - Hoàng đế Bảo Đại. Trở thành vợ của vua của một nước, cuộc đời bà đã bước sang một ngã rẽ hoàn toàn khác, những tưởng đấy là danh vọng lẫn quyền lực nhưng hóa ra lại đau khổ và cô đơn cho đến tận những năm tháng cuối đời.
 
Cuộc hôn nhân giữa Vua Bảo Đại và Hoàng hậu Nam Phương đã trải qua mọi thăng trầm, từ những ngày hạnh phúc êm đềm cho đến những tháng năm chia ly và đau khổ khi Vua Bảo Đại liên tiếp có các mối quan hệ tình ái ngoài luồng. Dẫu vậy, bà Nam Phương vẫn luôn một lòng một dạ chăm sóc con cái và thủy chung với chồng, không hề than trách nửa lời. Suốt cuộc đời mình, bà đã sống đúng với bốn chữ công, dung, ngôn, hạnh – không chỉ xứng đáng là một người vợ, người mẹ hoàn hảo mà còn xứng là một bậc mẫu nghi trong thiên hạ, cũng như một phụ nữ tiêu biểu của nước Việt Nam thời hiện đại: hết mình vì gia đình, chồng con, nhưng cũng không quên trách nhiệm của một công dân với Tổ Quốc.
 ','9786047736157_1.jpg',2021/1/1,20,1,12)



INSERT INTO SACH VALUES(N'Những Nhà Khám Phá Lịch Sử Tri Kiến Vạn Vật Và Con Người (Tái Bản 2018)',209000,N'Được coi như cuốn sách lớn nhất của một trong những sử gia lớn nhất thời hiện đại, Những nhà khám phá là một tập khảo luận đồ sộ và bao quát về cách thức nhân loại đã khám phá thế giới, dù còn dang dở (bởi như Einstein đã từng nói, “Cái bí ẩn vĩnh hằng của thế giới là tính khả tri”). Boorstin chứng tỏ mình là một nghệ sĩ bậc thầy khi kết hợp những mảnh tư liệu lớn trong kho tàng lịch sử tri thức thành những cấu trúc trật tự và lô gích, theo một mạch văn sống động, hé mở sự vận động tiệm tiến của tri thức qua truyện kể về những cá nhân kiệt xuất đã từng vạch lối mở đường, bằng niềm tin, sự cẩn trọng cùng ý chí và quyết tâm sắt đá, tiến tới khai phá “miền đất lạ”, làm nên hiểu biết của chúng ta về sự phát triển của vũ trụ trong gần hai thiên niên kỷ qua, truy nguyên từ Ptolemy qua Copernicus và Newton tới Einstein, giúp ta nhìn thấu thời đại Khám phá vĩ đại, Tự nhiên muôn màu và hơn thế nữa... 

Là cuốn mở đầu cho tác phẩm bộ ba lịch sử thế giới bao gồm cả The Creators (Những nhà sáng tạo) và The Seekers (Những người tìm kiếm), nhưng Những nhà khám phá được coi như một kiệt tác độc lập. Một tác phẩm nổi bật, vượt trội, khai mở cho người tò mò muốn biết thế giới đã được khám phá như thế nào, một trong những bách khoa thư lịch sử xuất sắc nhất khó lòng tìm được ở bất cứ nơi đâu khác.','image_181757.jpg'
,2021/1/1,20,1,1)



INSERT INTO SACH VALUES(N'Con Tàu Ma Của Thế Chiến II',229000,N'Câu chuyện bắt đầu với một vài cái tên trong những người thợ lặn biển sâu giỏi nhất thế giới. Ngoài công việc hằng ngày, họ là những thợ lặn cừ khôi, nghiệp dư mà rất chuyên nghiệp. Họ nghiệp dư ở chỗ lặn không phải nghề của họ mà là đam mê và họ rất chuyên nghiệp trong bộ môn này. Đến với lặn biển sâu, có quá nhiều thứ cần phải nắm rõ nếu không sẽ mất mạng. Thợ lặn biển sâu lặn vào xác tàu đắm tối tăm để tìm chiến lợi phẩm như những phần thưởng cho đam mê hiểm nguy của họ. Với một số, đó là những thứ vật chất không thể thiếu nhưng có những người chỉ cần tìm được ý nghĩa và lịch sử của những con tàu đắm đó. Nhóm thợ lặn đã tìm thấy một con tàu ngầm từ thế chiến II. Họ muốn ghi danh vào sử sách khi là người khám phá tên tuổi của con tàu. Việc định danh những nấm mồ biển khơi ấy mang một ý nghĩa đối với lịch sử. Và họ trân trọng nó. Con tàu ở độ sâu quá nguy hiểm và vì nó mà 3 người đã bỏ mạng. Không chỉ nghiên cứu con tàu khi lặn và mò mẫm nó trong lòng đại dương tối đen, họ còn tìm kiếm thông tin về nó trên cạn qua những tài liệu và con người lịch sử. Hành trình tìm kiếm ấy mất tận 7 năm để kết thúc. Cuối cùng, họ cũng đã có được điều họ mong muốn, và câu chuyện sau đó còn tiếp tục được kể với những người có liên quan đến số phận con tàu.','image_226958.jpg'
,2021/1/1,20,1,12)


INSERT INTO SACH VALUES(N'Muôn Kiếp Nhân Sinh (Bìa Cứng)',228000,N'Giáo sư John Vũ – Nguyên Phong và những câu chuyện chưa từng có về tiền kiếp, khám phá luật Nhân quả, Luân hồi.

“Muôn kiếp nhân sinh” là tác phẩm do Giáo sư John Vũ - Nguyên Phong viết từ năm 2017 và hoàn tất đầu năm 2020 ghi lại những câu chuyện, trải nghiệm tiền kiếp kỳ lạ từ nhiều kiếp sống của người bạn tâm giao lâu năm, ông Thomas – một nhà kinh doanh tài chính nổi tiếng ở New York. Những câu chuyện chưa từng tiết lộ này sẽ giúp mọi người trên thế giới chiêm nghiệm, khám phá các quy luật về luật Nhân quả và Luân hồi của vũ trụ giữa lúc trái đất đang gặp nhiều tai ương, biến động, khủng hoảng từng ngày.

“Muôn kiếp nhân sinh” là một bức tranh lớn với vô vàn mảnh ghép cuộc đời, là một cuốn phim đồ sộ, sống động về những kiếp sống huyền bí, trải dài từ nền văn minh Atlantis hùng mạnh đến vương quốc Ai Cập cổ đại của các Pharaoh quyền uy, đến Hợp Chủng Quốc Hoa Kỳ ngày nay.

“Muôn kiếp nhân sinh” cung cấp cho bạn đọc kiến thức mới mẻ, vô tận của nhân loại lần đầu được hé mở, cùng những phân tích uyên bác, tiên đoán bất ngờ về hiện tại và tương lai thế giới của những bậc hiền triết thông thái. Đời người tưởng chừng rất dài nhưng lại trôi qua rất nhanh, sinh vượng suy tử, mong manh như sóng nước. Luật nhân quả cực kỳ chính xác, chi tiết, phức tạp được thu thập qua nhiều đời, nhiều kiếp, liên hệ tương hỗ đan xen chặt chữ lẫn nhau, không ai có thể tính được tích đức này có thể trừ được nghiệp kia không, không ai có thể biết được khi nào nhân sẽ trổ quả. Nhưng, một khi đã gây ra nhân thì chắc chắn sẽ gặt quả - luật Nhân quả của vũ trụ trước giờ không bao giờ sai.

Luật Luân hồi và Nhân quả đã tạo nhân duyên để người này gặp người kia. Gặp nhau có khi là duyên, có khi là nợ; gặp nhau có lúc để trả nợ, có lúc để nối lại duyên xưa. Có biết bao việc diễn ra trong đời, tưởng chừng như là ngẫu nhiên nhưng thật ra đã được sắp đặt từ trước. Luân hồi là một ngôi trường rộng lớn, nơi tất cả con người, tất cả sinh vật đều phải học bài học của riêng mình cho đến khi thật hoàn thiện mới thôi. Nếu không chịu học hay chưa học được trọn vẹn thì buộc phải học lại, chính xác theo quy luật của Nhân quả.

Thomas đã chia sẻ vì sao đã kể những câu chuyện riêng tư huyền bí này với Giáo sư John Vũ để thực hiện tác phẩm “Muôn kiếp nhân sinh”:

“Hiện nay thế giới đang trải qua giai đoạn hỗn loạn, xáo trộn, mà thật ra thì mọi quốc gia đều đang gánh chịu những nghiệp quả mà họ đã gây ra trong quá khứ.

Mỗi quốc gia, cũng như mọi cá nhân, đều có những nghiệp quả riêng do những nhân mà họ đã gây ra. Cá nhân thì có ‘biệt nghiệp‘ riêng của từng người, nhưng quốc gia thì có ‘cộng nghiệp‘ mà tất cả những người sống trong đó đều phải trả.

Thường thì con người, khi hành động, ít ai nghĩ đến hậu quả, nhưng một khi hậu quả xảy đến thì họ nghĩ gì, làm gì? Họ oán hận, trách trời, trách đất, trách những người chung quanh đã gây ra những hậu quả đó? Có mấy ai biết chiêm nghiệm, tự trách mình và thay đổi không?

Tôi mong chúng ta - những cánh bướm bé nhỏ rung động mong manh cũng có thể tạo nên những trận cuồng phong mãnh liệt để thức tỉnh mọi người.

Tương lai của mỗi con người, mỗi tổ chức, mỗi quốc gia và cả hành tinh này sẽ ra sao trong giai đoạn sắp tới là tùy thuộc vào thái độ ứng xử, nhìn nhận và thức tỉnh của từng cá nhân, từng tổ chức, từng quốc gia đó tạo nên. Nếu muốn thay đổi, cần khởi đầu bằng việc nhận thức, chuyển đổi tâm thức, lan tỏa yêu thương và chia sẻ sự hiểu biết từ mỗi người chúng ta trước.

Nhân quả đừng đợi thấy mới tin.

Nhân quả là bảng chỉ đường, giúp con người tìm về thiện lương“

“Muôn kiếp nhân sinh” có hai khổ, bìa mềm khổ 14cmx 20.5cm, bìa cứng khổ 16x24cm ruột giấy Ford kem Nhật Bản 80 gsm, in 3 màu kèm 16 phụ bản màu. Cuốn sách được xuất bản bằng tiếng Việt trước khi được chuyển nhượng bản quyền cho các quốc gia khác trên thế giới.','4f2d0961f6ea3b6d8f0a406fec7f2592.jpg'
,2021/1/1,20,4,6)
INSERT INTO SACH VALUES(N'Biên Niên Sử Thế Giới Bằng Hình (Ấn Phẩm Kỉ Niệm 60 Năm Thành Lập NXB Kim Đồng)',330000,N'Cuốn sách như một dòng thời gian bất tận, với vô số hình ảnh, kể lại cuộc hành trình của loài người xuyên suốt lịch sử. Quá khứ hiện ra sống động trước mặt bạn, dù đó là những công cụ thô sơ từ thời tiền sử hay công nghệ kĩ thuật số trong nhưng năm gần đây.

Tập trung vào các sự kiện lớn trong lịch sử, như cuộc Cách mạng Pháp hay Phong trào Dân quyền ở Mỹ, cuốn sách giúp bạn tìm hiểu cuộc sống của trẻ em ở những thời đại khác nhau.

Cuốn sách chứa đựng hơn 1500 bức ảnh, hình vẽ minh họa, bản đồ và sơ đồ, chính là một hướng dẫn viên lịch sử, dẫn dắt bạn qua từng thế kỉ, qua từng năm tháng.','9786042086080.jpg'
,2021/1/1,20,4,1)
INSERT INTO SACH VALUES(N'Đại Việt Sử Ký Toàn Thư (Tái Bản 2017)',690000,N'Đại Việt sử ký toàn thư là bộ quốc sử danh tiếng, một di sản quý báu của dân tộc Việt Nam nghìn năm văn hiến. Đó là bộ sử cái, có giá trị nhiều mặt, gắn liền với tên tuổi các nhà sử học nổi tiếng như Lê Văn Hưu, Phan Phu Tiên, Ngô Sĩ Liên, Phạm Công Trứ, Lê Hy…

Việc phát hiện ra bản in xưa nhất của bộ Đại Việt sử ký toàn thư này - bản Nội các quan bảnnăm Chính Hòa thứ 18 (năm 1697), mang ý nghĩa đặc biệt. Nhờ đó, bản dịch quốc ngữ Đại Việt sử ký toàn thưtheo bản Nội các quan bảnđã lần lượt ra mắt bạn đọc từ những năm 1980 và được tái bản trọn bộ bốn tập lần đầu tiên vào năm 1998.

Năm 2010, nhân Đại lễ kỷ niệm 1.000 năm Thăng Long - Hà Nội, Công ty Đông A cùng với Nhà xuất bản Khoa học Xã hội đã cho ra mắt ấn bản một tập khổ lớn Đại Việt sử ký toàn thưdựa theo bản in bốn tập năm 1998 với một số thông tin chú thích về địa danh được chỉnh lý theo các đơn vị hành chính mới. Ngay từ khi ra đời, cuốn sách đã nhận được sự yêu quý của đông đảo bạn đọc và giành được Giải vàng Sách đẹp năm 2011.

 Năm 2017, chúng tôi tái bản ấn phẩm này. Bản in lần này được tiếp tục chỉnh lý chú thích về địa danh. Ngoài ra, ban biên tập đã tiến hành đối chiếu, rà soát và bổ sung đầy đủ, chính xác hơn phần Bản tra cứu. Mong rằng một lần nữa lịch sử nước nhà lại được lan tỏa sâu rộng trong lòng người dân Việt.','8936071674074_1_1.jpg'
 ,2021/1/1,20,4,8)
INSERT INTO SACH VALUES(N'Đại Nam Dật Sự Và Sử Ta So Với Sử Tàu',135000,N'Đại Nam dật sự và Sử ta so với sử Tàu là tập hợp hai chuyên luận sử học tiêu biểu của học giả Nguyễn Văn Tố. Với hai công trình này, không quá lời để nói Nguyễn Văn Tố là nhà sử học đầu tiên đặt nền móng cho bộ môn sử liệu học ở Việt Nam thời hiện đại.

Trong suốt hai năm từ 1943 đến 1945, liên tục và đều đặn trên gần 100 số báo Tri Tân và Thanh Nghị, Nguyễn Văn Tố đã phác thảo một lịch sử Việt Nam trải dài từ một nghìn năm Bắc thuộc cho đến thời kỳ đầu độc lập dưới các triều Ngô, Đinh, Tiền Lê, Lý. Trong bối cảnh nguồn sử liệu Hán văn hầu như chưa có bản dịch, tác giả đã làm công việc phiên dịch, đồng thời đối chiếu, phê phán sử liệu một cách tường tận nhằm soi tỏ hàng trăm nhân vật, sự kiện và danh xưng: thời Bắc thuộc đã có những người Nam nào làm quan bên Tàu và những người Tàu nào sang nước ta cai trị, những cuộc khởi nghĩa chống giặc phương Bắc đã tiến hành ra sao, mười hai sứ quân gồm những sứ quân nào, nước ta từng có những tên gọi gì... Những vấn đề tưởng chừng quen thuộc song vẫn hiện lên hết sức sinh động nhờ lối viết vừa khảo vừa kể, chặt chẽ mà hấp dẫn. Đó là biệt tài, cũng là đóng góp tiên phong trong việc tái hiện lịch sử Việt Nam từ các nguồn sử liệu chữ Hán của Ứng Hòe Nguyễn Văn Tố.','image_195509_1_17269.jpg'
,2021/1/1,20,4,4)


INSERT INTO SACH VALUES
(N'Harry Potter Và Đứa Trẻ Bị Nguyền Rủa',120000, N'Phù thủy nổi tiếng nhất thế giới đã quay trở lại. Tập truyện "Harry Potter và Đứa Trẻ bị Nguyền rủa”- phần thứ 8 được chính thức phát hành. Khác với bảy phần trước của tiểu thuyết Harry Potter, "Harry Potter và Đứa Trẻ bị Nguyền rủa" phần I và II là kịch bản gốc của vở kịch mới của tác giả Rowling cùng Jack Thorne và John Tiffany.
Từ những nhân vật quen thuộc trong bộ Harry Potter, kịch bản nói về cuộc phiêu lưu của những hậu duệ, sự can thiệp vào dòng thời gian đã gây ra những thay đổi không ngờ cho tương lai tưởng chừng đã yên ổn sau khi vắng bóng chúa tể Voldermort.
Câu chuyện lấy bối cảnh 19 năm sau khi Harry Potter là Giám đốc Sở Thần Sáng tại Bộ Pháp Thuật và đã có ba con cùng vợ là Ginny Weasley, em gái của người bạn thân là Ron Weasley. Albus Severus Potter là đứa con duy nhất của Harry thừa hưởng đôi mắt màu xanh nước biển của bà nội Lily. và Albus Potter bắt đầu nhập học ở Hogwarts cùng Scorpius Malfoy và Rose Granger-Weasley.
Phần này sẽ đưa bạn quay trở lại trường Hogwarts, quay trở lại những chuyến phiêu lưu của Harry, quay trở lại thế giới phép thuật quyến rũ.',
'HarryPotter12.gif',2018/03/12,20,6,2)


INSERT INTO SACH VALUES (N'HARRY POTTER VÀ HỘI PHƯỢNG HOÀNG (TẬP 5)',301000,N'Harry tức giận vì bị bỏ rơi ở nhà Dursley trong dịp hè, cậu ngờ rằng Chúa tể hắc ám Voldemort đang tập hợp lực lượng, và vì cậu có nguy cơ bị tấn công, những người Harry luôn coi là bạn đang cố che giấu tung tích cậu. Cuối cùng, sau khi được giải cứu, Harry khám phá ra rằng giáo sư Dumbledore đang tập hợp lại Hội Phượng Hoàng – một đoàn quân bí mật đã được thành lập từ những năm trước nhằm chống lại Chúa tể Voldemort. Tuy nhiên, Bộ Pháp thuật không ủng hộ Hội Phượng Hoàng, những lời bịa đặt nhanh chóng được đăng tải trên Nhật báo Tiên tri – một tờ báo của giới phù thủy, Harry lo ngại rằng rất có khả năng cậu sẽ phải gánh vác trách nhiệm chống lại cái ác một mình.
‘Hoang đường nhưng không hoang tưởng, trí tưởng tượng của Rowling cùng sự táo bạo của cô đã tạo cho cô một phong cách riêng.’ - The Times.','harry-potter-va-hoi-phuong-hoang.jpg',2017/12/12,20,6,2)

INSERT INTO SACH VALUES(N'NHỮNG CHUYỆN KỂ CỦA BEEDLE NGƯỜI HÁT RONG',127500,N'Những Chuyện Kể Của Beedle Người Hát Rong gồm năm câu chuyện thần tiên với những phép thuật lạ lùng độc đáo, những tình huống căng thẳng hồi hộp sẽ làm say mê độc giả của mọi lứa tuổi. Đặc biệt sau mỗi câu chuyện có phần bình luận của giáo sư Albus Dumbledore. Với những suy nghĩ sâu sắc ý nhị và phần hé lộ thông tin về cuộc sống tại trường Hogwarts, những lời bàn của giáo sư hy vọng sẽ được dân Muggles và giới phù thủy yêu thích như nhau.’','nhung-chuyen-ke-cua-beedle-nguoi-hat-rong_L.gif',2019/1/4,20,6,2)

INSERT INTO SACH VALUES(N'Nhà Giả Kim (Tái Bản 2020)', 67150,N'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người. 

Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.

“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.”

- Trích Nhà giả kim','image_195509_1_36793.jpg' ,2020/12/12 , 12, 6,4)

INSERT INTO SACH VALUES(N'Dấu Chân Trên Cát (Tái Bản 2020)',118400 ,N'“Dấu chân trên cát” là tác phẩm được dịch giả Nguyên Phong phóng tác kể về xã hội Ai Cập thế kỷ thứ XIV trước CN, qua lời kể của nhân vật chính -  Sinuhe.

Ngày nay, người ta biết đến triều đại các vua chúa Ai Cập thời cổ qua sách vở của người Hy Lạp. Sở dĩ các sử gia Hy Lạp biết được các chi tiết này vì họ đã học hỏi từ người Ai Cập bị đày biệt xứ tên là Sinuhe. Đây là một nhân vật lạ lùng, đã có công mang văn minh Ai Cập truyền vào Hy Lạp khi quốc gia này còn ở tình trạng kém mở mang so với Ai Cập lúc đó.

Các sử gia ngày nay đã đưa ra nhiều giả thuyết về nhân vật Sinuhe này. Có người cho rằng ông là một lái buôn đến Hy Lạp lập nghiệp, nhưng làm sao lái buôn lại mở trường dạy học và để lại nhiều tài liệu quý giá như thế được? Từ ngàn xưa,  chỉ riêng giai cấp vua chúa là giáo sĩ mới được hưởng quy chế giáo dục toàn vẹn như vậy mà thôi.

Do đó, một số người cho rằng ông thuộc giai cấp giáo sĩ, nhưng việc một giáo sĩ Ai Cập đến mở trường dạy học tại Hy Lạp cũng là điều khó chấp nhận. Mặc dù khi đó văn minh Hy Lạp chưa tiến bộ như Ai Cập nhưng giáo xứ này phát triển rất mạnh, hiển nhiên các giáo sĩ Hy Lạp không thể chấp nhận cho một giáo sĩ ngoại quốc đến mở trường dạy học tại thánh địa Olympia của họ được.

Nếu thế thì phải chăng Sinuhe thuộc giai cấp hoàng tộc? Điều này xét ra cũng không có lý vì một người thuộc giai cấp hoàng tộc không thể bị đày biệt xứ. Luật pháp Ai Cập chủ trương xử tử những kẻ trong hoàng tộc nếu họ vi phạm một tội trọng nào đó chứ không có lệ bị đày biệt xứ, vì các vua Pharaoh rất sợ những người trong bọn họ chiêu binh mãi mã làm phản.

 Việc một người Ai Cập, thân thế mơ hồ, bị đày biệt xứ, đến mở trường dạy học tại Athens, trung tâm văn hóa của Hy Lạp, vẫn là một bí mật đến nay các nhà khảo cổ chưa tìm ra được câu trả lời.

Mặc dù là tiểu thuyết lịch sử về xã hội Ai Cập cổ đại, song nhiều vấn đề được nêu ra trong tác phẩm vẫn có ý nghĩa thời sự trong thế giới ngày nay. Đó là lý do khiến cho tác phẩm không chỉ giữ được sự cuốn hút đối với bạn đọc Việt Nam và rất nhiều nơi  trên thế giới trong hơn nửa thế kỷ qua.

Bạn sẽ không thể rời mắt khỏi những dòng văn viết với ý tứ sâu sắc của một người con xa quê hương: "Người Ai Cập có thành ngữ: "Kẻ nào đã uống nước sông Nile thì không thể nào uống nước ở đâu được nữa". Quả thế tuy sống tại Hy Lạp nhưng không bao giờ tôi có thể quên được Ai Cập quê hương thân yêu của tôi.

Dường như những miền nào xây dựng trên mặt cát, chỉ huy hoàng trong một thời gian rất ngắn rồi tàn lụi, nhưng mấy ai chịu để ý đến điều ấy. Cũng như những vết dấu chân trên cát chỉ tồn tại một thoáng giây rồi phai mờ, huyền thoại về một người Ai Cập qua Hy Lạp mở trường dạy học, đào tạo nhiều thế hệ học trò xuất sắc chỉ còn là một câu chuyện mơ hồ trong cuộc sống ồn ào, náo nhiệt ngày nay.','image_195509_1_12629_1.jpg',2020/12/12,12,6,5)


INSERT INTO SACH VALUES(N'DR. STONE - TẬP 2', 23750,N'Senku cùng Taiju và Yuzuriha gấp gáp tiến hành điều chế thuốc súng. Giữa lúc ấy, đột nhiên một cột khói bốc lên từ phía xa. Senku tin rằng vẫn còn những người khác trên thế giới này nên đã chấp nhận mạo hiểm và đốt lửa hiệu. Mặt khác, họ phải đối mặt với tình thế ngàn cân treo sợi tóc khi bị Tsukasa truy đuổi nhằm ngăn chặn Senku điều chế thuốc súng…!?

RIICHIRO INAGAKI “Khác với họa sĩ truyện tranh, tác giả nguyên tác không có trợ lí. Lúc nào cũng chỉ một mình lặng lẽ ngồi viết lách. Cô đơn lắm! Nói chung, làm việc mà xung quanh chẳng có ai buồn tẻ vô cùng! Giống Senku, lầm lũi làm việc giữa thế gian… Tôi mà bị đẩy vào tình cảnh như vậy thì chắc chẳng chịu nổi mất. Làm tốt lắm, Senku!”
BOICHI “Đối với tôi, các bản phác thảo hàng tuần nhận được từ tác giả Inagaki thật sự là niềm hạnh phúc lớn lao. Tôi rất thích vẽ về thiên nhiên. Tuần nào tôi cũng phải tưởng tượng ra các loài đại thụ, tầm gửi và rêu. Và còn phải tưởng tượng ra Senku đang sống giữa thiên nhiên ấy nữa. Cậu ấy là một chàng trai đơn độc giữa thế giới bao la. Là một người đang sống trong thế giới truyện tranh Nhật Bản rộng lớn, tôi rất đồng cảm với cậu ấy. Này Senku!!! Đời người chính là một cuộc trao đổi công bằng giữa nỗi cô đơn và sự vĩ đại.”.’','SACH-dr-stone-tap-2.jpg',2021/2/8,20,7,1)

INSERT INTO SACH VALUES(N'DR. STONE - TẬP 1', 23750,N'Ngày nọ, cậu học sinh cấp Ba Taiju bị cuốn vào một hiện tượng kì bí khiến toàn nhân loại hóa đá.

Khoảng 3.700 năm sau, Taiju tỉnh dậy và hội ngộ người bạn thân Senku đã hồi sinh trước đó.

Bằng “sức trâu” của Taiju và “đầu óc” của Senku, cả hai người đã cùng nhau bắt tay vào xây dựng lại nền văn minh từ con số 0 ở thế giới đá...

Một tác phẩm cực kì ấn tượng thuộc dòng thương hiệu Manga Shonen Jump trứ danh!! Ngoài những điểm đặc trưng vốn có của dòng truyện Jump, bạn sẽ phải trầm trồ đầy kinh ngạc trước những kiến thức hóa học, vật lí, sinh học và toán học... được lồng ghép vô cùng khéo léo và tự nhiên!!

Hãy cùng bước vào chuyến phiêu lưu sinh-tồn-viễn-tưởng vô tiền khoáng hậu với Dr. Stone nhé!!

“Bạn mường tượng một nhà khoa học là người thế nào? Đeo kính này, tính cách hướng nội này, còn hơi điên điên nữa…Nhưng thật ra nếu đã có nhà khoa học lãng tử thì cũng sẽ có nhà khoa học cơ bắp cuồn cuộn thôi. Nhân vật chính Senku có lẽ cũng hơi khác so với ấn tượng của mọi người về một nhà khoa học. Nhưng cậu ấy rất nhiệt huyết đó. Các nhân vật của chúng ta sắp đương đầuvới biến cố chấn động rồi, mọi người hãy cổ vũ, ủng hộ nhé!!” - RIICHIRO INAGAKI”.’','SACH-dr-stone-tap-1.jpg',2021/4/2,20,7,1)

INSERT INTO SACH VALUES(N'DRAGON BALL FULL COLOR - PHẦN HAI: ĐẠI MA VƯƠNG PICCOLO - TẬP 4', 73150, N'DRAGON BALL là một Manga kinh điển với tầm ảnh hưởng lớn đến mức nào! Một bộ truyện chúng ta đã gắn bó suốt từ nhỏ, ăn cùng, ngủ cùng, bắt gặp hình ảnh ở khắp mọi nơi, vậy thì chẳng có lí do gì mà không sở hữu 1 phiên bản rực rỡ sắc màu như thế này cả! Nhất là khi "Giấc mơ thuở bé" nay đã thành sự thực nữa!
Nếu bạn là fan của DRAGON BALL - 7 VIÊN NGỌC RỒNG và những cuộc phiêu lưu của Khỉ Con Son Goku thì DRAGON BALL FULL COLOR sẽ làm bạn thích thú hơn nữa khi 100% cuốn truyện mà chúng ta yêu thích đều CÓ MÀU! Các nhân vật sẽ xuất hiện trước mắt bạn với màu da, màu tóc, phục trang và những khung cảnh vô cùng sống động! Những màn chiến đấu đặc trưng của DRAGON BALL cũng vì thế mà trở nên hoành tráng hơn bao giờ hết!!

Sau thời gian dài chuẩn bị và trao đổi với đại diện của tác giả Akira Toriyama, bộ truyện đã được NXB Kim Đồng phát hành với 100% bản quyền, phần ruột sách in màu rực rỡ trên giấy couché, có bìa áo 5 màu phản quang cực kì ấn tượng!! Chắc chắn sẽ là một món quà dành cho các Fan của Son Goku!','SACH-dragon-ball-tap-4.jpg',2021/1/2,20,7,1)
INSERT INTO SACH VALUES(N'Saiki Kusuo - Kẻ Siêu Năng Khốn Khổ - Tập 9: Đến Mệt Với Ông Ngoại Tsundere',17600 ,N'Nhân kì nghỉ xuân, cả nhà Saiki về quê thăm ông bà. Trong khi bà ngoại xởi lởi, hiền hậu thì ông ngoại lại cấm cảu, khó tính! Thế nhưng trong nội tâm của người ông vừa ít nói vừa khó gần lại ẩn chứa một bí mật ngang trái mà chỉ cậu cháu trai siêu năng lực mới thấu tỏ.

Shuichi Aso

“Có lần, tôi hỏi biên tập, “Tóc nhân vật để màu xanh lá cây được không nhỉ?”

Anh ấy đáp lại tỉnh bơ, “Mẹ tôi để tóc màu xanh lá cây đấy.”

Nghe xong, tôi bắt đầu lái chủ đề câu chuyện đi xa.

“Hả!? Xanh lá cây á!? Bác gái để tóc vậy lâu chưa?”

“Từ hồi cấp 2 á!? Quen biết nhau 8 năm, đây là lần đầu tiên tôi nghe chuyện này đấy!! Tại sao thế!?”

Kết cục, tóc Kuboyasu có màu tím.”','saikike-sieu-nang-khon-kho-tap-9.jpg' ,2020/12/12 , 12, 7,1)

INSERT INTO SACH VALUES(N'Iruma Giá Đáo! Tập 8',20000,N'Trước vị giáo viên ác ma mà ai nấy cũng phải e dè, Iruma đã thú nhận mình là con người!?

Cuối cùng trường Babyls cũng dần bước vào kì nghỉ dài ngày♪… Nhưngtrước kì nghỉ còn có một bài kiểm tra đầy ai oán...Iruma phải vùi đầu vào học!! Trước tình cảnh ấy, một nguy cơ khó lường đang rình rập cậu!?

Osamu Nishi

“Ác ma luôn lừa gạt con người, tuy vậy, trong số đó cũng có những ác ma đem lòng yêu mến nhân loại. Liệu trái tim họ có phập phồng bao cảm xúc? Liệu rằng họ có hồi hộp những lúc tay trong tay? Những ác ma như thế khiến tôi yêu thích vô cùng.”','irumatap-8.jpg' ,2020/12/12 , 12, 7,1)




INSERT INTO SACH VALUES(N'TRUYỆN CỔ GRIMM - BẢN CAO CẤP', 578000,N'Năm 1812, ấn bản đầu tiên của tập truyện “Kinder-und Hausmärchen” (Chuyện kể cho trẻ em và trong gia đình) ra đời tại Berlin, và lập tức gây được tiếng vang trong cộng đồng những nhà nghiên cứu ở Đức. Nhưng hẳn không một học giả nào tại thời điểm đó, hay thậm chí là những tác giả của tập truyện, có thể hình dung được giá trị và sức ảnh hưởng mà tập truyện mang lại trên toàn cầu, trong suốt chiều dài phát triển của lịch sử nhân loại. Đến tận ngày nay, hơn 200 năm sau ngày phát hành ấn bản đầu tiên, tập truyện vẫn được dịch và tái bản thường xuyên ở hàng trăm quốc gia, tiếp tục nuôi dưỡng những tâm hồn trẻ thơ, tưới tắm cho trí tưởng tượng thông qua các câu chuyện kỳ ảo, được gọi chung với cái tên quen thuộc:  Truyện Cổ Grimm

Tại Việt Nam, Truyện Cổ Grimm đã được giới thiệu đến các độc giả qua nhiều lần xuất bản khác nhau, với các ấn bản truyện chữ theo bản dịch từ truyện của hai anh em nhà Grimm, thêm minh họa, hay truyện tranh do các họa sĩ vẽ lại với nội dung rút gọn...

Lần in này, Đông A trân trọng giới thiệu tới bạn đọc  Truyện Cổ Grimm - Ấn bản đầy đủ nhất kèm 184 minh hoạ” với những điểm đáng chú ý như sau:

Về nội dung, đây được xem là ấn bản đầy đủ nhất đến thời điểm hiện tại, gồm 215 truyện. Trong đó có 211 truyện đúng số lượng và thứ tự theo bản năm 1857, ấn bản cuối cùng của anh em nhà Grimm trước khi hai ông qua đời (bao gồm 10 truyện thuộc phần “Huyền thoại cho trẻ em”, có tính giáo dục và mang đậm màu sắc tôn giáo). Ngoài 211 truyện này, còn có 4 truyện xuất hiện trong các ấn bản trước, nhưng về sau đã bị anh em Grimm loại ra do sự tương đồng với các tác phẩm của những nhà văn khác.

215 truyện này đến được đầy đủ với độc giả nhờ sự chuyển ngữ của ba dịch giả khác nhau, gồm dịch giả Hữu Ngọc – các bản dịch truyện Grimm của ông được tái bản thường xuyên trong suốt 50 năm qua; dịch giả Lương Văn Hồng – người dịch và biên soạn nhiều bộ sách tiếng Đức; dịch giả Ngụy Hữu Tâm – người từng học tập và làm việc lâu năm tại Đức. Ngoài việc tổng hợp đầy đủ các truyện, những người làm sách còn tiến hành đốichiếu với bản dịch tiếng Anh của Dan L. Ashliman và Margaret Hunt đểbiên tập, thêm những phần bị thiếu, hiệu chỉnh tên riêng cho thống nhất với nguyên bản.

Về hình thức, chúng tôi sử dụng bộ minh họa Truyện Cổ Grimm đầy đủ đầu tiên của hai họa sĩ Philipp Grot Johann và Robert Leinweber xuất bản đầu thế kỷ XX tại Đức. Đây cũng là lần đầu bản minh họa của hai họa sĩ tài năng này được giới thiệu đến độc giả Việt Nam, với hầu hết các truyện đều có hình ảnh, giúp người đọc dễ hình dung hơn bối cảnh, nhân vật, trang phục và các vật dụng được miêu tả trong câu chuyện.','truyen-co-grimm-ban-cao-cap.jpg',2020/12/12 , 12, 8,3)

INSERT INTO SACH VALUES (N'NHỮNG CUỘC PHIÊU LƯU CỦA PINOCCHIO',153000 ,N'Hơn 100 năm qua, kể từ khi ra đời, câu chuyện Những cuộc phiêu lưu của Pinocchio của Carlo Collodi đã làm say mê bao thế hệ trẻ em khắp thế giới. Từ nguyên bản tác phẩm, biết bao cuốn sách, bao thước phim về cậu bé Pinocchio đã ra đời ở nhiều quốc gia. Lần này, Pinocchio đến với độc giả nhỏ tuổi Việt Nam với những điều vô cùng đặc biệt và thú vị thông qua hình thức truyện tranh.

Cuốn sách được minh họa bởi chính một họa sĩ người Ý, quê hương của Pinocchio - họa sĩ Tony Wolf - người đã trở nên rất đỗi quen thuộc với độc giả Việt Nam qua bộ Chuyện Rừng nay sẽ tiếp tục mang đến cho các em những hình ảnh vô cùng sinh động, ngộ nghĩnh về chú bé gỗ Pinocchio.

Có thể nói, chính những hình ảnh sống động ấy đã liên kết một chuỗi các tình tiết câu chuyện, tạo nên sức hấp dẫn cũng như sự li kì của chuyến phiêu lưu, khiến cho độc giả có cảm giác như đang được cùng bước vào thế giới của Pinocchio. Cái thế giới mà không đơn thuần chỉ được xây dựng lên bởi những đường nét minh họa tinh tế mà còn do sự phối màu rất hài hòa.

Bên cạnh đó, với văn phong trong sáng, tự nhiên và lối kể chuyện hài hước, dí dỏm, cuốn sách sẽ tạo cho các em sự gần gũi khi cùng sẻ chia với cậu bé Pinochio những thử thách và khó khăn trên chặng đường trở thành người tốt.

Ngoài ra, phần cuối cuốn sách còn dành đôi dòng ngắn gọn kèm một vài minh họa để giúp các em hiểu thêm đôi điều về tiểu sử Carlo Collodi - “cha đẻ” của kiệt tác này cũng như bối cảnh và quá trình ra đời tác phẩm.','SACH-nhung-cuoc-phieu-luu-cua-pinocchio.jpg' ,2020/12/12 , 12, 8,3)
INSERT INTO SACH VALUES(N'STEAM - TỚ LÀ NHÀ KỸ SƯ CHẾ TẠO',135200 ,N'','SACH-steam-to-la-nha-ky-su-che-tao.jpg' ,2020/12/12 , 12, 8,3)


INSERT INTO SACH VALUES(N'Lớp Học Mật Ngữ Ngoại Truyện- Vũ Trụ Song Ngư', 54000,N'LỚP HỌC MẬT NGỮ NGOẠI TRUYỆN

VŨ TRỤ SONG NGƯ - NHỮNG PHA XỬ LÝ ĐI VÀO LÒNG BIỂN CỦA SONG NGƯ VÀ “ĐỒNG BỌN”

Sau ngoại truyện về Song Tử được tween hưởng ứng nhiệt liệt thì cộng đồng Song Ngư hãy phấn khích đi thôi vì cuốn ngoại truyện này dành cho các bạn. Và nếu thuộc cung khác, thì quyển sách này cũng có rất nhiều điều để bạn khám phá về chính mình đấy, tuyệt cú chưa!

Song Ngư - bạn là ai?

Chúng ta đều biết chòm sao Song Ngư mang biểu tượng hai chú cá dễ thương, là cung hoàng đạo của những bạn có ngày sinh: 19/2 - 20/3. Với đặc điểm của cá, Song Ngư là người “bơi” trong một thế giới khác, xa rời mặt đất. Họ nhạy cảm, linh hoạt và… chạy trốn rất giỏi.

Bản chất Song Ngư cực kỳ tốt bụng. Đây là món quà lớn nhất mà vũ trụ trao cho Song Ngư. Nhưng nếu không biết sử dụng, đó là một gánh nặng. Song Ngư hay nghĩ cho người khác hơn là cho mình. Vừa mạnh mẽ vừa yếu đuối, vừa thông thái vừa trẻ con, vừa tốt bụng vừa… để bụng!

Là một trong ba cung Nước, Song Ngư rất mong manh, dễ bị bốc hơi! Bù lại, họ có khiếu nghệ thuật, thích sự lãng mạn và vô cùng tinh tế. Cùng với sự tác động của một cung biến đổi, Song Ngư là cung giàu cảm xúc nhất, dễ thấu hiểu, tận tâm lẫn sáng tạo nhất 12 cung hoàng đạo.

Sương sương vậy thôi, bạn có thấy chuẩn về cung Song Ngư chưa? Cuốn sách này sẽ còn cho bạn biết nhiều hơn thế. Cùng đi tìm profile thật của Song Ngư, khám phá về Song Ngư qua góc nhìn của các cung hoàng đạo khác, và tìm hiểu thêm các cung hoàng đạo qua lăng kính của Song Ngư… Vô vàn những phát hiện thú vị và mới mẻ sẽ được cập nhật trong tập này!

Vũ trụ Song Ngư có màu gì?

Hẳn bạn sẽ trả lời màu xanh của nước. Nhưng vũ trụ đó cũng ẩn chứa vô vàn điều kỳ thú. Cung hoàng đạo là cái tôi của các chòm sao. Nhưng cái tôi Song Ngư đó chỉ là phần nổi của tảng băng. Giống như vũ trụ đầy vật chất tối, tính cách của Song Ngư còn bị ảnh hưởng bởi những thế lực bí ẩn. Mặt Trăng tượng trưng cho thế giới cảm xúc. Hãy cùng tìm hiểu Song Ngư kết hợp với 12 thế giới cảm xúc sẽ cho ra phiên bản gì nhé!

Trong tập này còn có câu chuyện về Xử Nữ nam sáng tác truyện tranh nhưng bị chê dở nên tìm đến Song Ngư nữ để học hỏi cách sáng tạo. Song Ngư nữ thì muốn giúp nhưng rất tiếc, phải từ chối. Vì Song Ngư cũng… không biết tại sao mình sáng tạo được. Khó tả lắm! Bảo Bình nữ giải thích, đó là do Song Ngư nữ “xuất thần” và cảnh báo Xử Nữ nam, không xuất thần thì không thể đi xa trên con đường sáng tạo... Cuối cùng, các bạn ấy đã tìm ra công thức sáng tạo nào, cùng theo dõi nhé!','songngu.jpg' ,2020/12/12 , 12, 8,7)
INSERT INTO SACH VALUES (N'365 Truyện Kể Hàng Đêm - Mùa Đông',36000  ,N'365 Truyện Kể Hàng Đêm - Mùa Đông Trẻ nhỏ thường nhận thức thế giới qua những điều đơn giản. Chính vì thế, những quan điểm chuẩn mực về đạo đức của mỗi người thường bắt nguồn từ những câu chuyện nghe kể từ thuở ấu thơ. 365 truyện kể hàng đêm là series truyện kể dành cho bé được tuyển chọn theo “tinh thần” bốn mùa xuân, hạ, thu, đông… gồm những truyện kể ở xứ thần tiên, truyện kể tri thức, truyện hay rèn thói quen tốt, truyện kể về danh nhân, truyện kể dân gian… Mỗi câu chuyện sẽ mở ra một trải nghiệm đặc biệt, cung cấp một kiến thức thú vị, bồi dưỡng một phẩm chất ưu tú giúp bé trưởng thành. Cuốn sách tập hợp những truyện ngụ ngôn, đồng thoại, cổ tích đặc sắc từ xưa đến nay của nhiều quốc gia trên thế giới. Mỗi câu chuyện là một bài học nhỏ với các tình tiết sống động, hấp dẫn. Hy vọng rằng, cuốn sách sẽ trở thành một người bạn gần gũi, thân thiết của các em trong quá trình hình thành những phẩm chất tốt đẹp, tạo nền tảng vững chắc cho sự hình thành nhân cách trong tương lai.','image_61761.jpg' 
,2020/12/12 , 12, 8,8)



INSERT INTO SACH VALUES(N'BỘ SÁCH GIÁO KHOA LỚP 7- SÁCH BÀI HỌC (BỘ 12 CUỐN)', 134000,N'Sách giáo khoa là vật dụng quan trọng, không thể thiếu đối với quá trình học tập của học sinh. Sách giáo khoa là loại sách cung cấp kiến thức, được biên soạn với mục đích dạy và học tại trường học. 
 
Bộ Sách Giáo Khoa Lớp 7 (Bộ 12 Cuốn) tập hợp đầy đủ các môn học cần thiết phục vụ cho học sinh lớp 7 được biên soạn theo chương trình chuẩn của Bộ Giáo dục và Đào tạo. Bộ sách cung cấp kiến thức từ cơ bản đến nâng cao với các môn học :
Toán 7 Tập 1
Toán 7 Tập 2
Vật Lí 7
Công Nghệ 7
Ngữ Văn 7 Tập 1
Ngữ Văn 7 Tập 2
Lịch Sử 7
Địa Lí 7
Giáo Dục Công Dân 7
Âm Nhạc Và Mĩ Thuật 7
Tiếng Anh 7
Sinh Học 7','bo-SACH-giao-khoa-lop-7.jpg' ,2020/12/12 , 12, 5,5)

INSERT INTO SACH VALUES(N'BỘ SÁCH GIÁO KHOA LỚP 12 - SÁCH BÀI HỌC (BỘ 14 CUỐN)', 180000,N'Bộ Sách Giáo Khoa Lớp 12 (Bộ 14 Cuốn):
Cung cấp các kiến thức từ cơ bản đến nâng cao cho các em học sinh
Được biên soạn theo quy chuẩn của Bộ Giáo dục và Đào tạo
Hệ thống kiến thức khoa học, chính xác, được trình bày theo một trình tự logic chặt chẽ
Bộ sách giáo khoa chuẩn lớp 12 do Bộ Giáo dục quy định đang được nhiều học sinh cũng như các bậc phụ huynh có con em mới bước vào lớp 12 quan tâm.

Bộ Sách Giáo Khoa Lớp 12 (Chuẩn) gồm 14 cuốn:
Giải Tích 12
Hình Học 12
Vật Lí 12
Hóa Học 12
Sinh Học 12
Công Nghệ 12
Ngữ Văn 12 Tập 1
Ngữ Văn 12 Tập 2
Giáo Dục Công Dân
Tin Học 12
Tiếng Anh 12
Lịch Sử 12
Địa Lí 12
Giáo Dục Quốc Phòng - An Ninh 12','bo-SACH-giao-khoa-12.jpg' ,2020/12/12 , 12, 5,5)
INSERT INTO SACH VALUES(N'LUYỆN TẬP TIN HỌC 5 - TẬP 2 (CÙNG IC3 SPARK)',27000 ,N'Bộ sách Luyện tập tin học được biên soạn để phục vụ nhu cầu học Tin Học ở độ tuổi tiểu học nhằm trang bị cho học sinh tiểu học những kĩ năng có bản về sử dụng máy tính để học tập, rèn luyện, vui chơi giải trí được xây dựng một cách có hệ thống phù hợp với trình độ học sinh từ lớp 1 đến lớp 5. Với những phần mềm, công cụ vừa quen thuộc, nhưng cũng vừa hiện đại, bắt kịp với nhịp độ phát triển của công nghệ thông tin toàn cầu.
 

Quyển sách Luyện Tập Tin Học 5 - Tập 2 (Cùng IC3 Spark) không chỉ là một tài liệu luyện tập của học sinh lớp 2, mà giáo viên có thể sử dụng như giáo trình giảng dạy, phụ huynh học sinh cũng có thể tham khảo cùng học, cùng chơi và quản lí việc sử dụng máy tính của con em mình, giúp cho các em có thể tìm được niềm vui trong học tập. Nội dung quyển sách gồm 3 phần:
 

Phần 4: Lập trình logo nâng cao
Phần 5: Làm quen với bảng tính
Phần 6: Cộng tác hoàn thành sản phẩm công nghệ thông tin','luyen-tap-tin-hoc-5-tap-2-cung-ic3-spark.jpg' ,2020/12/12 , 12, 5,5)

INSERT INTO SACH VALUES (N'BỘ SÁCH GIÁO KHOA LỚP 3 (BỘ 13 CUỐN BÀI HỌC + BÀI TẬP)',115100,N'Bộ sách giáo khoa chuẩn lớp 3 do Bộ Giáo dục quy định đang được nhiều học sinh cũng như các bậc phụ huynh có con em chuẩn bị bước vào lớp 3 quan tâm.

Bộ sách bao gồm những đầu sách tối thiểu và sách bài tập được sử dụng trong giảng dạy và học tập trong toàn quốc.
Tiếng Việt 3 Tập 1
Tiếng Việt 3 Tập 2
Toán 3
Tự Nhiên Và Xã Hội 3
Tập Viết 3 Tập 1
Tập Viết 3 Tập 2
Vở Bài Tập Tiếng Việt 3 Tập 1
Vở Bài Tập Tiếng Việt 3 Tập 2
Vở Bài Tập Toán 3 Tập 1
Vở Bài Tập Toán 3 Tập 2
Vở Bài Tập Tự Nhiên Và Xã Hội 3
Vở Bài Tập Đạo Đức 3
Tập Bài Hát 3','bo-SACH-giao-khoa-lop-3.jpg' ,2020/12/12 , 12, 5,5)

INSERT INTO SACH VALUES(N'BỘ SÁCH GIÁO KHOA LỚP 4 (BỘ 20 CUỐN BÀI HỌC + BÀI TẬP)', 197400,N'Lớp 4 là giai đoạn gần cuối Tiểu học với các kiến thức nền tảng mới vô cùng quan trọng. Đây cũng là giai đoạn trẻ đã có sự nỗ lực về ý chí trong hoạt động học tập như học thuộc một bài thơ, một công thức toán hay một bài hát dài. 

Bộ Sách Giáo Khoa Lớp 4 (Bộ 20 Cuốn Bài Học + Bài Tập)  tập hợp đầy đủ các môn học cần thiết phục vụ cho học sinh lớp 4 được biên soạn theo chương trình chuẩn của Bộ Giáo dục và Đào tạo. Bộ sách cung cấp kiến thức từ cơ bản đến nâng cao cho con trẻ với các môn học :
Tiếng Việt 4 Tập 1
Tiếng Việt 4 Tập 2
Toán 4
Khoa Học 4
Lịch Sử Và Địa Lí 4
Âm Nhạc 4
Mỹ Thuật 4
Đạo Đức 4
Kĩ Thuật 4
Vở Bài Tập Tiếng Việt 4 Tập 1
Vở Bài Tập Tiếng Việt 4 Tập 2
Vở Bài Tập Toán 4 Tập 1
Vở Bài Tập Toán 4 Tập 2
Vở Bài Tập Lịch Sử 4
Vở Bài Tập Đạo Đức 4
Bài Tập Toán 4
Thực Hành Kĩ Thuật 4
Vở Bài Tập Địa Lí 4
Luyện Viết Chữ Lớp 4
Vở Bài Tập Khoa Học 4','bo-SACH-giao-khoa-lop-4.jpg' ,2020/12/12 , 12, 5,5)


INSERT INTO SACH VALUES(N'Kiếp Nào Ta Cũng Tìm Thấy Nhau - Câu Chuyện Về Những Linh Hồn Tri Kỷ Vĩnh Viễn Không Chia Lìa', 59500,N'Kiếp nào ta cũng tìm thấy nhau là cuốn sách thứ ba của Brain L. Weiss – một nhà tâm thần học có tiếng. Trước đó ông đã viết hai cuốn sách: cuốn đầu tiên là Ám ảnh từ kiếp trước, cuốn sách mô tả câu chuyện có thật về một bệnh nhân trẻ tuổi cùng với những liệu pháp thôi miên về kiếp trước đã làm thay đổi cả cuộc đời tác giả lẫn cô ấy. Cuốn sách đã bán chạy trên toàn thế giới với hơn 2 triệu bản in và được dịch sang hơn 20 ngôn ngữ. Cuốn sách thứ hai Through  Time  into  Healing (Đi  qua  thời  gian  để chữa lành), mô tả những gì tác giả đã học được về tiềm năng chữa bệnh của liệu pháp hồi quy tiền kiếp. Trong cuốn sách đều là những câu chuyện người thật việc thật. Nhưng  câu  chuyện  hấp  dẫn  nhất lại  nằm  trong cuốn sách thứ ba.

Kiếp nào ta cũng tìm thấy nhau nói về những linh hồn tri kỷ, những người có mối liên kết vĩnh viễn với nhau bằng tình yêu thương, luôn gặp lại nhau hết lần này đến lần khác, qua hết kiếp này tới kiếp khác. Chúng ta sẽ tìm thấy và nhận ra tri kỷ của mình như thế nào, rồi đưa ra những quyết định làm thay đổi cuộc sống của chính mình ra sao là những khoảnh khắc quan trọng và xúc động nhất trong cuộc đời mỗi người.

Định  mệnh  sẽ dẫn  lối cho  những  linh  hồn tri  kỷ hội ngộ. Chúng ta sẽ gặp họ. Nhưng quyết định làm gì sau đó lại là quyền tự do lựa chọn của mỗi người. Một lựa chọn sai lầm hoặc một cơ hội bị bỏ lỡ có thể dẫn đến nỗi cô đơn và thống khổ tột cùng. Và một lựa chọn đúng đắn, một cơ hội được nắm bắt có thể mang lại niềm hạnh phúc sâu sắc.

Những gì tác giả viết trong sách được ghi lại từ hồ sơ bệnh án, băng thu âm và trí nhớ. Chỉ có tên và một vài chi tiết nhỏ được thay đổi để giữ tính bảo mật. Đây là câu chuyện về vận mệnh và hy vọng. Đây là câu chuyện xảy ra âm thầm mỗi ngày.

Ngày này năm đó, đã có người lắng nghe.

Linh hồn tựa như nước

Rơi xuống từ thiên đường

Lên trời như khói sương

Rồi trở về với đất

Chuỗi tuần hoàn bất tận.

GOETHE','image_180561.jpg' ,2020/12/12 , 20, 3,9)


INSERT INTO SACH VALUES(N'Ám Ảnh Từ Kiếp Trước (Tái Bản 2020)', 62300,N'Cuốn sách hay và khiêu khích suy nghĩ này đã phá vở những rào cản trong trị liệu tâm lý truyền thống và trình bày một biện pháp trị liệu cách tân và hiệu quả cao. Những ai làm việc chuyên về sức khỏe tâm thần cần phải xem xét nó nghiêm túc.” – Edith Fiore, TS., bác sỹ tâm lý học lâm sàng và là tác giả cuốn sách Bạn từng ở đây trước kia (You Have Been Here Before)

Vốn là nhà tâm lý trị liệu truyền thống, TS. Brian Weiss đã kinh ngạc và bi quan khi một trong những bệnh nhân của mình bắt đầu nhớ lại những chấn thương trong kiếp trước mà chúng dường như là chìa khóa để giải quyết những cơn ác mộng và lo lắng lặp đi lặp lại. Tuy nhiên, chủ nghĩa bi quan của ông bị xói mòn khi cô ấy bắt đầu phát những thông điệp từ “những sinh thể ở giữa không gian,” chứa đựng những tiết lộ quan trọng về gia đình của TS. Weiss và cái chết của con trai ông. Bằng biện pháp kiếp trước, ông có khả năng chữa lành cho bệnh nhân và mở ra một giai đoạn mới đầy ý nghĩa trong nghề nghiệp của chính mình.

“Tường thuật xúc động sâu xa về sự tĩnh thức tâm linh ngoài dự liệu của một ngừoi đàn ông. Cuốn sách rất can đảm này đã mở cánh cửa cho một cuộc hôn phối giữa khoa học và siêu hình học. Cuốn sách phải đọc vì một thế giới khát khao, tìm kiếm linh hồn.” – Jeanne Avery, tác giả của Chiêm tinh học và tiền kiếp (Astrology and Your Past Lives)

“Một trường hợp xuất thần lịch sử chứng minh tính hiệu quả của liệu pháp kiếp trước. Cuốn sách này sẽ mở ra những cánh cửa cho nhiều người chưa bao giờ nghĩ đến tính hợp lý của việc đầu thai trở lại.” – Richard Sutphen, tác giả của Tiền kiếp, tình yêu tương lai và bạn được sinh trở lại để được bên nhau (Past Lives, Future Loves and You Were Born Again to Be Together)

TS. Brian L. Weiss, bác sỹ tâm thần học, sống và làm việc ở Miami, Florida. Ông tốt nghiệp trường đại học Columbia và trường y khoa của đại học Yale và là Chủ tịch Danh dự Tâm thần học của Trung tâm Y khoa Núi Sinai ở Miami. TS. Weiss vẫn có phòng trị liệu riêng ở Miami và tổ chức những hội nghị quốc tế, hội thảo trải nghiệm cũng như những chương trình huấn luyện cho những người hành nghề chuyên nghiệp. Ông cũng là tác giả của Đi qua thời gian để chữa lành (Through Time Into Healing) và Linh hồn cũ xác thân mới.','image_197918.jpg' 
,2020/12/12 , 12, 3,9)


INSERT INTO SACH VALUES(N'Quẳng Gánh Lo Đi Và Vui Sống (Tái Bản 2018)', 59.280,N'Quẳng Gánh Lo Đi Và Vui Sống là cuốn sách mà cái tên đã nói lên tất cả nội dung chuyển tải trên những trang giấy.

Bất kỳ ai đang sống đều sẽ có những lo lắng thường trực về học hành, công việc, những hoá đơn, chuyện nhà cửa,… Cuộc sống không dễ dàng giải thoát bạn khỏi căng thẳng, ngược lại, nếu quá lo lắng, bạn có thể mắc bệnh trầm cảm. Quẳng Gánh Lo Đi Và Vui Sống khuyên bạn hãy khóa chặt dĩ vãng và tương lai lại để sống trong cái phòng kín mít của ngày hôm nay. Mọi vấn đề đều có thể được giải quyết, chỉ cần bạn bình tĩnh và xác định đúng hành động cần làm vào đúng thời điểm.

Nói thì có vẻ dễ nhưng những vấn đề liên quan đến các trạng thái tinh thần chẳng bao giờ dễ giải quyết. Chấm dứt lo lắng là điều không thể nhưng bớt đi sự lo lắng thì có thể, chỉ cần bạn đủ quyết tâm.

Quẳng Gánh Lo Đi Và Vui Sống khuyên bạn những cách để giảm thiểu lo lắng rất đơn giản như chia sẻ nó với người khác, tìm cách giải quyết vấn đề, quên tất cả những điều lo lắng nằm ngoài tầm tay,... Cố gắng thực tập điều này hàng ngày và trong cuộc sống chắc hẳn bạn sẽ thành công, có thể, không được như bạn muốn, nhưng chỉ cần bớt đi một chút phiền muộn thì cuộc sống của bạn đã có thêm một niềm vui.

Nhờ các phương pháp của Dale Carnegie, hàng triệu người đọc đã xây dựng được thái độ sống tích cực, an tâm cảm nhận hạnh phúc và mãi mãi loại bỏ thói quen lo lắng:

Hãy đóng chặt những cánh cửa sắt dẫn đến quá khứ và tương lai. Chỉ sống trong những vách ngăn của hiện tại.

Nhìn nhận những mặt tích cực của cuộc sống

Khi làm việc đến quên mình, ta cũng quên đi mọi lo lắng

Thử kiểm tra theo luật bình quân, xác suất xảy ra điều bạn đang lo lắng là bao nhiêu phần trăm?

Luôn nỗ lực hết mình

Hãy nghĩ đến những may mắn bạn có được chứ không phải là những rắc rối

Hãy quên đi bản thân bằng cách quan tâm đến người khác. Mỗi ngày làm một điều tốt có thể khiến ai đó mỉm cười.

Qua hơn nửa thế kỷ, những lời khuyên thiết thực và sâu sắc của Dale Carnegie vẫn còn nguyên giá trị cho đến ngày nay. Ngay bây giờ, bạn đã có thể ghi tên mình vào danh sách hàng triệu con người đã học được cách: Quẳng gánh lo đi và vui sống!

BÁO CHÍ NÓI VỀ CUỐN SÁCH

“Đây là cuốn sách kinh điển, được xem là cẩm nang giúp người đọc có thể tự nhìn nhận và vượt qua sự lo lắng, bất an của bản thân”. - Nhịp cầu đầu tư','quangganhlodi-biacung1.jpg' 
,2020/12/12 , 12, 3,6)


INSERT INTO SACH VALUES(N'Rèn Luyện Tư Duy Phản Biện', 90000,N'Như bạn có thể thấy, chìa khóa để trở thành một người có tư duy phản biện tốt chính là sự tự nhận thức. Bạn cần phải đánh giá trung thực những điều trước đây bạn nghĩ là đúng, cũng như quá trình suy nghĩ đã dẫn bạn tới những kết luận đó. Nếu bạn không có những lý lẽ hợp lý, hoặc nếu suy nghĩ của bạn bị ảnh hưởng bởi những kinh nghiệm và cảm xúc, thì lúc đó hãy cân nhắc sử dụng tư duy phản biện! Bạn cần phải nhận ra được rằng con người, kể từ khi sinh ra, rất giỏi việc đưa ra những lý do lý giải cho những suy nghĩ khiếm khuyết của mình. Nếu bạn đang có những kết luận sai lệch này thì có một sự thật là những đức tin của bạn thường mâu thuẫn với nhau và đó thường là kết quả của thiên kiến xác nhận, nhưng nếu bạn biết điều này, thì bạn đã tiến gần hơn tới sự thật rồi!

Những người tư duy phản biện cũng biết rằng họ cần thu thập những ý tưởng và đức tin của mọi người. Tư duy phản biện không thể tự nhiên mà có.

Những người khác có thể đưa ra những góc nhìn khác mà bạn có thể chưa bao giờ nghĩ tới, và họ có thể chỉ ra những lỗ hổng trong logic của bạn mà bạn đã hoàn toàn bỏ qua. Bạn không cần phải hoàn toàn đồng ý với ý kiến của những người khác, bởi vì điều này cũng có thể dẫn tới những vấn đề liên quan đến thiên kiến, nhưng một cuộc thảo luận phản biện là một bài tập tư duy cực kỳ hiệu quả.

Việc lắng nghe những ý kiến của người khác cũng có thể giúp bạn nhận ra rằng phạm vi tri thức của bạn không phải là vô hạn. Không ai có thể biết hết tất cả mọi thứ. Nhưng với việc chia sẻ và đánh giá phê bình kiến thức, chúng ta có thể mở rộng tâm trí. Nếu điều này khiến bạn cảm thấy không thoải mái, không sao cả. Trên thực tế, bước ra ngoài vùng an toàn là một điều quan trọng để mở rộng niềm tin và suy nghĩ của bạn. Tư duy phản biện không phải là chỉ biết vài thứ, và chắc chắn không phải việc xác nhận những điều bạn đã biết. Thay vào đó, nó xoay quanh việc tìm kiếm sự thật – và biến chúng trở thành thứ bạn biết.','image_195509_1_18448.jpg' 
,2020/12/12 , 12, 3,10)



INSERT INTO SACH VALUES(N'Nghệ Thuật Tư Duy Phản Biện',129000 ,N'Tư duy phản biện là một phần trong cuộc sống hằng ngày, bạn cần nắm lấy và phát triển từ nó. Thực hiện nghiên cứu của bạn, tìm kiếm các nguồn thông tin tốt, đưa ra lập luận của bạn và cân nhắc phản bác, cân nhắc xem bạn có đưa ra giả định hay không và đừng vội vàng đưa ra quyết định nếu bạn không hài lòng với thông tin bạn thu thập được.

Bạn có phải là một y tá phẫu thuật hay thậm chí làm việc trong lĩnh vực y tế, thì bạn cũng có thể thực hiện một số hình thức thử nghiệm. Việc đưa ra quyết định về những việc cần xử lý tại nơi làm việc và ở nhà dựa trên mức độ ưu tiên và mức độ khẩn cấp của hoàn cảnh.

Nếu bạn có một dự án đến hạn vào ngày mai, dự án đó sẽ được ưu tiên hơn dự án đến hạn vào tháng sau. Đứa con mới sinh của bạn cần được vỗ về trước khi giúp đứa con lớn hơn làm bài tập về nhà và giúp ra những quyết định dựa trên khả năng suy nghĩ chín chắn của mình và cuốn sách này đã chỉ ra cách phát triển và nâng cao những kỹ năng đó để bạn được trao quyền đạt được nhiều thành quả và thành công hơn.

Bây giờ bạn đã có các kỹ năng cần thiết để trở thành một nhà tư tưởng phản biện hiệu quả, hãy bắt đầu sử dụng các kỹ năng mới phát triển của bạn ngay hôm nay. Thách thức bản thân đánh giá một cách nghiêm túc niềm tin của bạn và tự quyết định xem bạn có thực sự hiểu được ý nghĩa và lịch sử đằng sau những suy nghĩ và quan điểm của mình hay không. Bạn có thể hoặc không thay đổi quan điểm của mình, nhưng ít nhất bạn chắc chắn sẽ biết mình đang đứng ở đâu và tại sao. Hãy bắt đầu áp dụng lập luận phản biện trong cuộc sống hằng ngày của bạn khi bạn đưa ra quyết định và đưa ra kết luận cả lớn và nhỏ.

Trong cuộc đời mỗi người, không ai có thể tránh được những tổn thương về mặt cảm xúc, nhưng nếu tâm trí và cảm xúc phân minh, bạn sẽ có thể lùi lại một bước trước những cảm xúc cá nhân để giải quyết tình huống theo cách có lợi nhất cho bạn. Đồng thời, bạn sẽ có thể sử dụng kỹ năng tư duy phản biện để thách thức các ý tưởng và lý tưởng. “Nghệ thuật tư duy phản biện” sẽ giúp bạn chuẩn bị sẵn bộ tư duy khẩn cấp của riêng mình, qua đó đưa ra những quyết định hợp lý, thấu đáo dựa trên bằng chứng thực tế.

Hãy nghĩ đến coi tư duy phản biện như một cơ hội để tương tác với những người khác và tìm hiểu quan điểm của họ. Đánh giá những gì người khác nói và xem xét các nguồn thông tin để quyết định xem chúng có xứng đáng hay không. “Nghệ thuật tư duy phản biện” là một tài liệu tuyệt vời giúp bạn học được những kỹ năng đó và bạn có thể tham khảo lại khi cần. Hãy nhớ rằng, hơn bất cứ điều gì, hãy rèn luyện kỹ năng tư duy phản biện của bạn, và bạn không bao giờ có thể sai lầm.

Luyện tập làm nên sự hoàn hảo. Đừng ngần ngại triển khai các kỹ năng bạn đã học được trong cuốn sách này ngay hôm nay.','image_220921.jpg' ,2020/12/12 , 12, 3,9)
 

INSERT INTO SACH VALUES(N'Từ Tốt Đến Vĩ Đại (Tái Bản 2021)',130000,N'Jim Collins cùng nhóm nghiên cứu đã miệt mài nghiên cứu những công ty có bước nhảy vọt và bền vững để rút ra những kết luận sát sườn, những yếu tố cần kíp để đưa công ty từ tốt đến vĩ đại. Đó là những yếu tố khả năng lãnh đạo, con người, văn hóa, kỷ luật, công nghệ… Những yếu tố này được nhóm nghiên cứu xem xét tỉ mỉ và kiểm chứng cụ thể qua 11 công ty nhảy vọt lên vĩ đại. Mỗi kết luận của nhóm nghiên cứu đều hữu ích, vượt thời gian, ý nghĩa vô cùng to lớn đối với mọi lãnh đạo và quản lý ở mọi loại hình công ty (từ công ty có nền tảng và xuất phát tốt đến những công ty mới khởi nghiệp), và mọi lĩnh vực ngành nghề. Đây là cuốn sách nên đọc đối với bất kỳ lãnh đạo hay quản lý nào!

','nxbtre_full_09462021_024609.jpg',2021/1/1,20,2,2)


INSERT INTO SACH VALUES(N'Trên Đỉnh Phố Wall (Tái Bản 2021)',219000,N'Peter Lynch là nhà quản lý tài chính số 1 ở Mỹ. Quan điểm của ông là: Tất cả các nhà đầu tư trung bình đều có thể trở thành những chuyên gia hàng đầu trong lĩnh vực của họ và họ có thể chọn được những cổ phiếu hời nhất không kém gì các chuyên gia đầu tư trên Phố Wall chỉ bằng việc thực hiện một cuộc điều tra nhỏ.

Trong cuốn sách, Lynch đề cập đến cách thức mà ông đã đạt được thành tích đầu tư vĩ đại của mình khi là cựu giám đốc xuất sắc của quỹ đầu tư hàng tỷ đô-la Magellan. Viết cùng Joghn Rothchild, Trên đỉnh Phố Wall đưa ra những chỉ dẫn dễ dàng áp dụng để có thể lựa chọn được những danh mục từ việc đánh giá các báo cáo tài chính của công ty và nhận ra những con số thực sự có giá trị. Ông giải thích và đưa ra những chỉ dẫn để đầu tư theo chu kỳ, hay thay đổi hoàn toàn danh mục đầu tư để theo đuổi những công ty đang phát triển nhanh.

Lynch khẳng định rằng, nếu bạn không bị chi phối bởi sự thất thường của thị trường sự ham muốn tức thời về lợi nhuận, bạn sẽ được đền đáp bởi danh mục đầu tư của mình, (sau khoảng từ 5 đến 15 năm). Lời khuyên này đã được chứng minh là sống mãi với thời gian và đã biến Trên đỉnh Phố Wall trở thành tác phẩm bán chạy số 1 ở Mỹ. Và cho đến bây giờ, cuốn sách kinh điển này vẫn giữ nguyên giá trị ban đầu của nó.','image_230105.jpg',2021/1/1,20,2,9),


(N'Lời Tự Thú Của Một Bậc Thầy Định Giá - Confessions Of The Pricing Man',199000,N'Hermann Simon- Chuyên gia hàng đầu thế giới về chiến lược định giá tiết lộ cách quy trình bí ẩn này hoạt động và cách tối đa hóa giá trị thông qua việc định giá cho công ty và khách hàng. Trong câu chuyện hấp dẫn và thực tế này, tác giả đã mô tả một ly cocktail định giá, giải thích từng thành phần thông qua hàng chục câu chuyện được thu thập trong bốn thập kỷ làm việc của ông. Là diễn giả nổi tiếng thế giới về định giá và là cố vấn đáng tin cậy cho các giám đốc điều hành Fortune 500, cuộc hành trình cả đời của Simon đã đưa ông từ các chợ của người nông dân đến sự nghiệp với tư cách là doanh nhân và nhà tư vấn quản lý cho các công ty lớn, nhỏ trên khắp thế giới. Ông đã học hỏi từ những người đoạt giải Nobel và các chuyên gia quản lý hàng đầu, đồng thời giúp vô số nhà quản lý và giám đốc điều hành sử dụng định giá như một cách để tạo ra thị trường mới, phát triển doanh nghiệp và đạt được lợi thế cạnh tranh bền vững. Tại đây, đối với người tiêu dung cũng như những người làm kinh doanh, ông tiết lộ bí mật của các phương pháp định giá thành công, đồng thời chia sẻ trí tuệ và sự thông minh sẽ thay đổi mãi mãi cách bạn tư duy về định giá.

Đánh giá của chuyên gia:

“ Đây là cuốn sách hay nhất mà tôi biết để giúp bạn mở mang đầu óc về những vấn đề thực tế trong định giá” - Philip Kotler, Giáo sư xuất sắc về marketing quốc tế tại trường quản lý Kellogg, Đại học Northwestern, được xem là huyền thoạt marketing Thế giới -','image_219043.jpg'
,2021/1/1,20,2,11)


INSERT INTO SACH VALUES(N'LÃNH ĐẠO TẬP SỰ - HÀNH TRÌNH KHÔNG ĐƠN ĐỘC',140000,N'Walt Disney luôn được biết đến như một cây đại thụ trong ngành giải trí thế giới, tuy nhiên bạn có biết thương hiệu này là một trong những case-study điển hình về quản trị và lãnh đạo?

Dan Cockerell vốn bắt đầu tại Disney với chức vụ trông xe. Trải qua 26 năm làm việc ở 19 vị trí khác nhau, ông trở thành Phó Chủ tịch của Magic Kingdom - công viên giải trí thế giới thuộc hệ sinh thái Disney. Vậy điều gì đã giúp Dan đi từ một vị trí rất đỗi bình thường đến một nhà lãnh đạo tài ba điều hành cả một công viên khổng lồ với hơn 12.000 nhân viên?

Tất cả những kinh nghiệm và bài học quý giá về kỹ năng và tư duy lãnh đạo của ông đã được đúc kết lại trong cuốn sách Lãnh Đạo Tập Sự - Hành Trình Không Đơn Độc. Xuyên suốt sự nghiệp ở Disney, Dan đã học được nhiều bài học về cuộc sống và khả năng lãnh đạo. Ông đã truyền đạt lại những điều đó trong cuốn sách “Lãnh đạo tập sự” để giúp cho các nhà lãnh đạo chuẩn bị dẫn dắt đội ngũ của họ thông qua học 4 khía cạnh:

Lãnh đạo bản thân

Lãnh đạo nhóm

Lãnh đạo tổ chức

Lãnh đạo sự thay đổi

Trong mỗi phần, tác giả chia sẻ các kiến thức và kinh nghiệm thực tế cũng như các công cụ tự đánh giá và những thực tiễn tốt nhất dựa trên nghiên cứu. Ở cuối mỗi chương, bạn cũng sẽ tìm thấy một kế hoạch hành động để giúp bạn đặt ra các ưu tiên và cải thiện các lĩnh vực quan trọng nhất của cuộc sống, để có cơ hội đạt được kết quả tích cực và thành công lớn nhất.

Những hiểu biết sâu sắc về lãnh đạo mà Dan chia sẻ trong cuốn sách này sẽ những bài học hữu ích với bất kỳ ai khao khát làm chủ bản thân và hướng tới lãnh đạo những điều lớn lao hơn. Dù bạn là ai, bạn đang làm ở đâu, vị trí nào, bạn hoàn toàn có khả năng rèn luyện và khai phá khả năng lãnh đạo của riêng mình.

Bạn đã sẵn sàng để khám phá tiềm năng lãnh đạo bên trong cùng cuốn sách này chưa?','SACH-lanh-dao-tap-su-hanh-trinh-khong-don-doc.jpg',2021/1/1,20,2,11)


INSERT INTO SACH VALUES(N'Think And Grow Rich - 13 Nguyên Tắc Nghĩ Giàu, Làm Giàu (Tái Bản)',110000,N'Cuốn sách sẽ giúp bạn trở nên giàu có, làm giàu cho cuộc sống của bạn trên tất cả các phương diện của cuộc sống chứ không chỉ về tài chính và vật chất.
Think and grow rich – 13 nguyên tắc nghĩ giàu, làm giàu là cuốn sách “chỉ dẫn” duy nhất chỉ ra những nguồn lực bạn phải có để thành công. Mỗi chương trong cuốn sách đều đề cập đến bí quyết kiếm tiền, từ việc có niềm tin, có mong muốn đến những kiến thức chuyên sâu, những ý tưởng, những kế hoạch, những cách đưa ra quyết định.
“THINK AND GROW RICH
Mua nó…
Bạn có một cuốn sách.
Đọc nó…
Bạn có một kế hoạch làm giàu
Làm theo kế hoạch đó…
Bạn có cả thế giới!”
Theo quy luật tự nhiên, bí quyết này sẽ buộc bạn phải trả giá, nhưng cái giá phải trả thấp hơn rất nhiều so với giá trị thực sự của nó. Nó không thể được định giá bởi những người không muốn tìm kiếm nó. Bí quyết này cũng không thể cho đi vì nó không thể mua được bằng tiền, bởi nó có hai phần và một phần vốn đã tồn tại trong những con người sẵn sàng đón nhận nó.','da8bf5951313326908cd2504c9f4590b.jpg'
,2021/1/1,20,2,9)


INSERT INTO SACH VALUES(N'Khi Hơi Thở Hóa Thinh Không (Tái Bản 2020)',109000,N'Khi hơi thở hóa thinh không là tự truyện của một bác sĩ bị mắc bệnh ung thư phổi. Trong cuốn sách này, tác giả đã chia sẻ những trải nghiệm từ khi mới bắt đầu học ngành y, tiếp xúc với bệnh nhân cho tới khi phát hiện ra mình bị ung thư và phải điều trị lâu dài.

Kalanithi rất yêu thích văn chương nên câu chuyện của anh đã được thuật lại theo một phong cách mượt mà, dung dị và đầy cảm xúc. Độc giả cũng được hiểu thêm về triết lý sống, triết lý nghề y của Kalanithi, thông qua ký ức về những ngày anh còn là sinh viên, rồi thực tập, cho đến khi chính thức hành nghề phẫu thuật thần kinh. “Đối với bệnh nhân và gia đình, phẫu thuật não là sự kiện bi thảm nhất mà họ từng phải đối mặt và nó có tác động như bất kỳ một biến cố lớn lao trong đời. Trong những thời điểm nguy cấp đó, câu hỏi không chỉ đơn thuần là sống hay chết mà còn là cuộc sống nào đáng sống.” – Kalanithi luôn biết cách đưa vào câu chuyện những suy nghĩ sâu sắc và đầy sự đồng cảm như thế.

Bạn bè và gia đình đã dành tặng những lời trìu mến nhất cho con người đáng kính trọng cả về tài năng lẫn nhân cách này. Dù không thể vượt qua cơn bệnh nan y, nhưng thông điệp của tác giả sẽ còn khiến người đọc nhớ mãi.','image_220964.jpg'
,2021/1/1,20,1,9)



INSERT INTO SACH VALUES (N'Sống Mạo Hiểm Một Cách Cẩn Thận',159000,N'Siêu mẫu quốc tế Maye Musk đã chia sẻ những câu chuyện cá nhân cùng các bài học rút ra từ cuộc đời "Sống mạo hiểm một cách cẩn thận."

Maye Musk là một siêu mẫu thời trang, cuốn hút và thích xê dịch với những mối quan hệ khăng khít, đầy thú vị cùng gia đình và bạn bè - và năm nay bà đã ngoài bảy mươi tuổi. Nhưng mọi thứ không phải lúc nào cũng dễ dàng hay hào nhoáng - bà bắt đầu làm mẹ đơn thân ở tuổi 31, vật lộn với cái nghèo để nuôi dạy cho ba người con; đối mặt với những vấn đề về cân nặng khi làm một người mẫu quá khổ và vượt qua những định kiến về tuổi tác trong ngành người mẫu; đồng thời kiến lập một sự nghiệp trọn đời trong vai trò một chuyên gia dinh dưỡng được trọng vọng, mà trong suốt quá trình đó bà không ngừng bắt đầu lại ở nhiều thành phố khác nhau thuộc ba quốc gia và hai lục địa. Nhưng bà đã vượt qua tất cả với một tinh thần bất khuất và thái độ nghiêm túc để trở thành một người thành công trên toàn cầu ở độ tuổi mà bà gọi là "đỉnh cao của đời tôi".

Trong Sống mạo hiểm một cách cẩn thận, Maye chia sẻ những kinh nghiệm của đời mình, hàm chứa trong đó các triết lý được đúc kết trong gian nan về sự nghiệp (càng chăm chỉ, càng may mắn), gia đình (để người mình yêu thương đi con đường riêng), sức khỏe (không hề có thần dược) và phiêu lưu (luôn tạo không gian cho sự khám phá, nhưng luôn sẵn sàng đón nhận bất kỳ điều gì). Bạn không kiểm soát mọi thứ xảy ra trong đời, nhưng bạn có thể sống cuộc đời mình muốn ở bất kỳ tuổi nào. Tất cả những gì bạn phải làm là lên kế hoạch.

Một số đánh giá về cuốn sách:

"Từ lâu tôi đã ngưỡng mộ Maye Musk cả trong vai trò người mẫu lẫn một người phụ nữ. Bác đã truyền cảm hứng cho nhiều người xuyên suốt sự nghiệp của mình, và những triết lý cùng quan điểm vô giá của bác hiển hiện trên từng trang của cuốn sách này."   - Karlie Kloss

"Ấm áp, chân thành mà không giả dối, Sống mạo hiểm một cách cẩn thận chứa đầy những quan điểm sâu sắc cùng chất hài hước với hàm lượng hợp lý, mang lại cho người đọc những lời khuyên phải khó khăn lắm mới có được của cả đời người. Maye Musk là người phụ nữ trách nhiệm với hiểu biết rằng cuộc sống đầy những bất ngờ và làm chủ cuộc sống một cách trọn vẹn!"  - Diane Von Furstenberg

"Mỹ nhân phi thường Maye Musk là bằng chứng sống cho thấy một chế độ ăn uống lành mạnh là nền tảng cho một cuộc sống đầy ắp niềm vui, năng động và giàu năng lượng."   - Christie Brinkle','b_a-1-s_ng-m_o-hi_m.jpg',2021/1/1,20,1,9)


INSERT INTO SACH VALUES(N'Maria Montessori Cuộc Đời Và Sự Nghiệp (Tái Bản 2019)',200000,N'Maria Montessori Cuộc đời và sự nghiệp cung cấp cho độc giả những kiến thức nền tảng cơ bản về cuộc đời và sự nghiệp của một trong những nhà giáo dục vĩ đại nhất thế kỷ XX – Maria Montessori. Xuất thân trong một gia đình không giàu có với ông bố là một quân nhân nghiêm khắc, Maria không được chiều chuộng như một tiểu thư mà phải tự lập, tự lao động trong một nếp kỷ luật rất nghiêm. Dù cho cha mẹ hướng nghiệp trở thành một nhà giáo nhưng Maria mơ ước trở thành một kỹ sư  rồi sau lại trở thành sinh viên y khoa – những nghề rất lạ lẫm với phụ nữ thời bấy giờ. Vượt qua bao nhiêu rào cản và định kiến, Maria là nữ sinh viên duy nhất được nhận vào học khoa Y của Đại học Rome vào năm 1890. Bà đã nỗ lực học tập và trở thành người phụ nữ đầu tiên nhận bằng Bác sĩ ở nước Ý vào năm 1896 (khi bà 26 tuổi).

Từ một bác sĩ tâm thần chuyên giúp đỡ những trẻ em chậm phát triển trí tuệ, một cơ duyên tình cờ đã đưa bà đến với sự nghiệp giáo dục trẻ thơ và bản thân bà đã không ngừng khám phá, nghiên cứu và tự hoàn thiện một triết lý giáo dục: hãy tôn trọng trẻ em và tìm cách cư xử với trẻ em một cách tự nhiên nhất có thể. Tác giả Standing ví khám phá của Maria Montessori cũng vĩ đại ngang với Columbus khám phá ra châu Mỹ. Chỉ có điều, thế giới mà Columbus khám phá ra là bên ngoài; còn Montessori đã khám phá ra một thế giới bên trong – bên trong tâm hồn của trẻ em. Xin đừng hiểu lầm về điều này; nó là một khám phá thiên tài về một thứ cũng khách quan như Châu Mỹ đối với Columbus, như Luật Hấp dẫn đối với Newton. Thật sự thì khám phá này mới là thứ đem lại sự nổi tiếng cho bà chứ không phải phương pháp dạy trẻ của bà. Maria Montessori đã khám phá thấy những phẩm chất bình thường của trẻ em cho đến nay vẫn bị che giấu dưới vỏ bọc là những lệch lạc. Maria Montessori đã khám phá ra rằng trẻ em có những phẩm chất khác biệt và cao hơn những gì chúng ta thường gán cho các em.

Từ một ngôi trường đầu tiên mang tên Casa dei Bambini (Ngôi nhà Trẻ thơ) ở Roma năm 1907, sau hơn một thế kỷ đã có hơn 2.5000 trường học mang tên Montessori với đầy hấp lực từ Âu sang Á, từ Mỹ sang Phi…  Những ghi chép của bà được gọi với tên Phương pháp Montessori ngày nay đã được dịch sang hơn 20 thứ tiếng trên toàn cầu.','image_195509_1_2141.jpg'
,2021/1/1,20,1,2)
INSERT INTO SACH VALUES(N'Nam Phương - Hoàng Hậu Cuối Cùng (Tái Bản 2018)',79000,N'Cuốn sách là tập hợp những câu chuyện về Hoàng hậu Nam Phương, người con gái tài sắc vẹn toàn của đất Gò Công - Tiền Giang, người đã chinh phục hoàn toàn trái tim của Hoàng đế Bảo Đại để bước lên ngôi Hoàng hậu của triều Nguyễn vào năm 1934.
 
Sinh ra trong một gia đình giàu có, lẽ ra cuộc đời của người con gái mang tên Nguyễn Thị Lan đã bình lặng và sung sướng hơn nhiều nếu như không có cuộc gặp gỡ định mệnh với vị Hoàng đế trẻ tuổi của nước Đại Nam - Hoàng đế Bảo Đại. Trở thành vợ của vua của một nước, cuộc đời bà đã bước sang một ngã rẽ hoàn toàn khác, những tưởng đấy là danh vọng lẫn quyền lực nhưng hóa ra lại đau khổ và cô đơn cho đến tận những năm tháng cuối đời.
 
Cuộc hôn nhân giữa Vua Bảo Đại và Hoàng hậu Nam Phương đã trải qua mọi thăng trầm, từ những ngày hạnh phúc êm đềm cho đến những tháng năm chia ly và đau khổ khi Vua Bảo Đại liên tiếp có các mối quan hệ tình ái ngoài luồng. Dẫu vậy, bà Nam Phương vẫn luôn một lòng một dạ chăm sóc con cái và thủy chung với chồng, không hề than trách nửa lời. Suốt cuộc đời mình, bà đã sống đúng với bốn chữ công, dung, ngôn, hạnh – không chỉ xứng đáng là một người vợ, người mẹ hoàn hảo mà còn xứng là một bậc mẫu nghi trong thiên hạ, cũng như một phụ nữ tiêu biểu của nước Việt Nam thời hiện đại: hết mình vì gia đình, chồng con, nhưng cũng không quên trách nhiệm của một công dân với Tổ Quốc.
 ','9786047736157_1.jpg',2021/1/1,20,1,12)



INSERT INTO SACH VALUES(N'Những Nhà Khám Phá Lịch Sử Tri Kiến Vạn Vật Và Con Người (Tái Bản 2018)',209000,N'Được coi như cuốn sách lớn nhất của một trong những sử gia lớn nhất thời hiện đại, Những nhà khám phá là một tập khảo luận đồ sộ và bao quát về cách thức nhân loại đã khám phá thế giới, dù còn dang dở (bởi như Einstein đã từng nói, “Cái bí ẩn vĩnh hằng của thế giới là tính khả tri”). Boorstin chứng tỏ mình là một nghệ sĩ bậc thầy khi kết hợp những mảnh tư liệu lớn trong kho tàng lịch sử tri thức thành những cấu trúc trật tự và lô gích, theo một mạch văn sống động, hé mở sự vận động tiệm tiến của tri thức qua truyện kể về những cá nhân kiệt xuất đã từng vạch lối mở đường, bằng niềm tin, sự cẩn trọng cùng ý chí và quyết tâm sắt đá, tiến tới khai phá “miền đất lạ”, làm nên hiểu biết của chúng ta về sự phát triển của vũ trụ trong gần hai thiên niên kỷ qua, truy nguyên từ Ptolemy qua Copernicus và Newton tới Einstein, giúp ta nhìn thấu thời đại Khám phá vĩ đại, Tự nhiên muôn màu và hơn thế nữa... 

Là cuốn mở đầu cho tác phẩm bộ ba lịch sử thế giới bao gồm cả The Creators (Những nhà sáng tạo) và The Seekers (Những người tìm kiếm), nhưng Những nhà khám phá được coi như một kiệt tác độc lập. Một tác phẩm nổi bật, vượt trội, khai mở cho người tò mò muốn biết thế giới đã được khám phá như thế nào, một trong những bách khoa thư lịch sử xuất sắc nhất khó lòng tìm được ở bất cứ nơi đâu khác.','image_181757.jpg'
,2021/1/1,20,1,1)



INSERT INTO SACH VALUES(N'Con Tàu Ma Của Thế Chiến II',229000,N'Câu chuyện bắt đầu với một vài cái tên trong những người thợ lặn biển sâu giỏi nhất thế giới. Ngoài công việc hằng ngày, họ là những thợ lặn cừ khôi, nghiệp dư mà rất chuyên nghiệp. Họ nghiệp dư ở chỗ lặn không phải nghề của họ mà là đam mê và họ rất chuyên nghiệp trong bộ môn này. Đến với lặn biển sâu, có quá nhiều thứ cần phải nắm rõ nếu không sẽ mất mạng. Thợ lặn biển sâu lặn vào xác tàu đắm tối tăm để tìm chiến lợi phẩm như những phần thưởng cho đam mê hiểm nguy của họ. Với một số, đó là những thứ vật chất không thể thiếu nhưng có những người chỉ cần tìm được ý nghĩa và lịch sử của những con tàu đắm đó. Nhóm thợ lặn đã tìm thấy một con tàu ngầm từ thế chiến II. Họ muốn ghi danh vào sử sách khi là người khám phá tên tuổi của con tàu. Việc định danh những nấm mồ biển khơi ấy mang một ý nghĩa đối với lịch sử. Và họ trân trọng nó. Con tàu ở độ sâu quá nguy hiểm và vì nó mà 3 người đã bỏ mạng. Không chỉ nghiên cứu con tàu khi lặn và mò mẫm nó trong lòng đại dương tối đen, họ còn tìm kiếm thông tin về nó trên cạn qua những tài liệu và con người lịch sử. Hành trình tìm kiếm ấy mất tận 7 năm để kết thúc. Cuối cùng, họ cũng đã có được điều họ mong muốn, và câu chuyện sau đó còn tiếp tục được kể với những người có liên quan đến số phận con tàu.','image_226958.jpg'
,2021/1/1,20,1,12)


INSERT INTO SACH VALUES(N'Muôn Kiếp Nhân Sinh (Bìa Cứng)',228000,N'Giáo sư John Vũ – Nguyên Phong và những câu chuyện chưa từng có về tiền kiếp, khám phá luật Nhân quả, Luân hồi.

“Muôn kiếp nhân sinh” là tác phẩm do Giáo sư John Vũ - Nguyên Phong viết từ năm 2017 và hoàn tất đầu năm 2020 ghi lại những câu chuyện, trải nghiệm tiền kiếp kỳ lạ từ nhiều kiếp sống của người bạn tâm giao lâu năm, ông Thomas – một nhà kinh doanh tài chính nổi tiếng ở New York. Những câu chuyện chưa từng tiết lộ này sẽ giúp mọi người trên thế giới chiêm nghiệm, khám phá các quy luật về luật Nhân quả và Luân hồi của vũ trụ giữa lúc trái đất đang gặp nhiều tai ương, biến động, khủng hoảng từng ngày.

“Muôn kiếp nhân sinh” là một bức tranh lớn với vô vàn mảnh ghép cuộc đời, là một cuốn phim đồ sộ, sống động về những kiếp sống huyền bí, trải dài từ nền văn minh Atlantis hùng mạnh đến vương quốc Ai Cập cổ đại của các Pharaoh quyền uy, đến Hợp Chủng Quốc Hoa Kỳ ngày nay.

“Muôn kiếp nhân sinh” cung cấp cho bạn đọc kiến thức mới mẻ, vô tận của nhân loại lần đầu được hé mở, cùng những phân tích uyên bác, tiên đoán bất ngờ về hiện tại và tương lai thế giới của những bậc hiền triết thông thái. Đời người tưởng chừng rất dài nhưng lại trôi qua rất nhanh, sinh vượng suy tử, mong manh như sóng nước. Luật nhân quả cực kỳ chính xác, chi tiết, phức tạp được thu thập qua nhiều đời, nhiều kiếp, liên hệ tương hỗ đan xen chặt chữ lẫn nhau, không ai có thể tính được tích đức này có thể trừ được nghiệp kia không, không ai có thể biết được khi nào nhân sẽ trổ quả. Nhưng, một khi đã gây ra nhân thì chắc chắn sẽ gặt quả - luật Nhân quả của vũ trụ trước giờ không bao giờ sai.

Luật Luân hồi và Nhân quả đã tạo nhân duyên để người này gặp người kia. Gặp nhau có khi là duyên, có khi là nợ; gặp nhau có lúc để trả nợ, có lúc để nối lại duyên xưa. Có biết bao việc diễn ra trong đời, tưởng chừng như là ngẫu nhiên nhưng thật ra đã được sắp đặt từ trước. Luân hồi là một ngôi trường rộng lớn, nơi tất cả con người, tất cả sinh vật đều phải học bài học của riêng mình cho đến khi thật hoàn thiện mới thôi. Nếu không chịu học hay chưa học được trọn vẹn thì buộc phải học lại, chính xác theo quy luật của Nhân quả.

Thomas đã chia sẻ vì sao đã kể những câu chuyện riêng tư huyền bí này với Giáo sư John Vũ để thực hiện tác phẩm “Muôn kiếp nhân sinh”:

“Hiện nay thế giới đang trải qua giai đoạn hỗn loạn, xáo trộn, mà thật ra thì mọi quốc gia đều đang gánh chịu những nghiệp quả mà họ đã gây ra trong quá khứ.

Mỗi quốc gia, cũng như mọi cá nhân, đều có những nghiệp quả riêng do những nhân mà họ đã gây ra. Cá nhân thì có ‘biệt nghiệp‘ riêng của từng người, nhưng quốc gia thì có ‘cộng nghiệp‘ mà tất cả những người sống trong đó đều phải trả.

Thường thì con người, khi hành động, ít ai nghĩ đến hậu quả, nhưng một khi hậu quả xảy đến thì họ nghĩ gì, làm gì? Họ oán hận, trách trời, trách đất, trách những người chung quanh đã gây ra những hậu quả đó? Có mấy ai biết chiêm nghiệm, tự trách mình và thay đổi không?

Tôi mong chúng ta - những cánh bướm bé nhỏ rung động mong manh cũng có thể tạo nên những trận cuồng phong mãnh liệt để thức tỉnh mọi người.

Tương lai của mỗi con người, mỗi tổ chức, mỗi quốc gia và cả hành tinh này sẽ ra sao trong giai đoạn sắp tới là tùy thuộc vào thái độ ứng xử, nhìn nhận và thức tỉnh của từng cá nhân, từng tổ chức, từng quốc gia đó tạo nên. Nếu muốn thay đổi, cần khởi đầu bằng việc nhận thức, chuyển đổi tâm thức, lan tỏa yêu thương và chia sẻ sự hiểu biết từ mỗi người chúng ta trước.

Nhân quả đừng đợi thấy mới tin.

Nhân quả là bảng chỉ đường, giúp con người tìm về thiện lương“

“Muôn kiếp nhân sinh” có hai khổ, bìa mềm khổ 14cmx 20.5cm, bìa cứng khổ 16x24cm ruột giấy Ford kem Nhật Bản 80 gsm, in 3 màu kèm 16 phụ bản màu. Cuốn sách được xuất bản bằng tiếng Việt trước khi được chuyển nhượng bản quyền cho các quốc gia khác trên thế giới.','4f2d0961f6ea3b6d8f0a406fec7f2592.jpg'
,2021/1/1,20,4,6)
INSERT INTO SACH VALUES(N'Biên Niên Sử Thế Giới Bằng Hình (Ấn Phẩm Kỉ Niệm 60 Năm Thành Lập NXB Kim Đồng)',330000,N'Cuốn sách như một dòng thời gian bất tận, với vô số hình ảnh, kể lại cuộc hành trình của loài người xuyên suốt lịch sử. Quá khứ hiện ra sống động trước mặt bạn, dù đó là những công cụ thô sơ từ thời tiền sử hay công nghệ kĩ thuật số trong nhưng năm gần đây.

Tập trung vào các sự kiện lớn trong lịch sử, như cuộc Cách mạng Pháp hay Phong trào Dân quyền ở Mỹ, cuốn sách giúp bạn tìm hiểu cuộc sống của trẻ em ở những thời đại khác nhau.

Cuốn sách chứa đựng hơn 1500 bức ảnh, hình vẽ minh họa, bản đồ và sơ đồ, chính là một hướng dẫn viên lịch sử, dẫn dắt bạn qua từng thế kỉ, qua từng năm tháng.','9786042086080.jpg'
,2021/1/1,20,4,1)
INSERT INTO SACH VALUES(N'Đại Việt Sử Ký Toàn Thư (Tái Bản 2017)',690000,N'Đại Việt sử ký toàn thư là bộ quốc sử danh tiếng, một di sản quý báu của dân tộc Việt Nam nghìn năm văn hiến. Đó là bộ sử cái, có giá trị nhiều mặt, gắn liền với tên tuổi các nhà sử học nổi tiếng như Lê Văn Hưu, Phan Phu Tiên, Ngô Sĩ Liên, Phạm Công Trứ, Lê Hy…

Việc phát hiện ra bản in xưa nhất của bộ Đại Việt sử ký toàn thư này - bản Nội các quan bảnnăm Chính Hòa thứ 18 (năm 1697), mang ý nghĩa đặc biệt. Nhờ đó, bản dịch quốc ngữ Đại Việt sử ký toàn thưtheo bản Nội các quan bảnđã lần lượt ra mắt bạn đọc từ những năm 1980 và được tái bản trọn bộ bốn tập lần đầu tiên vào năm 1998.

Năm 2010, nhân Đại lễ kỷ niệm 1.000 năm Thăng Long - Hà Nội, Công ty Đông A cùng với Nhà xuất bản Khoa học Xã hội đã cho ra mắt ấn bản một tập khổ lớn Đại Việt sử ký toàn thưdựa theo bản in bốn tập năm 1998 với một số thông tin chú thích về địa danh được chỉnh lý theo các đơn vị hành chính mới. Ngay từ khi ra đời, cuốn sách đã nhận được sự yêu quý của đông đảo bạn đọc và giành được Giải vàng Sách đẹp năm 2011.

 Năm 2017, chúng tôi tái bản ấn phẩm này. Bản in lần này được tiếp tục chỉnh lý chú thích về địa danh. Ngoài ra, ban biên tập đã tiến hành đối chiếu, rà soát và bổ sung đầy đủ, chính xác hơn phần Bản tra cứu. Mong rằng một lần nữa lịch sử nước nhà lại được lan tỏa sâu rộng trong lòng người dân Việt.','8936071674074_1_1.jpg'
 ,2021/1/1,20,4,8)
INSERT INTO SACH VALUES(N'Đại Nam Dật Sự Và Sử Ta So Với Sử Tàu',135000,N'Đại Nam dật sự và Sử ta so với sử Tàu là tập hợp hai chuyên luận sử học tiêu biểu của học giả Nguyễn Văn Tố. Với hai công trình này, không quá lời để nói Nguyễn Văn Tố là nhà sử học đầu tiên đặt nền móng cho bộ môn sử liệu học ở Việt Nam thời hiện đại.

Trong suốt hai năm từ 1943 đến 1945, liên tục và đều đặn trên gần 100 số báo Tri Tân và Thanh Nghị, Nguyễn Văn Tố đã phác thảo một lịch sử Việt Nam trải dài từ một nghìn năm Bắc thuộc cho đến thời kỳ đầu độc lập dưới các triều Ngô, Đinh, Tiền Lê, Lý. Trong bối cảnh nguồn sử liệu Hán văn hầu như chưa có bản dịch, tác giả đã làm công việc phiên dịch, đồng thời đối chiếu, phê phán sử liệu một cách tường tận nhằm soi tỏ hàng trăm nhân vật, sự kiện và danh xưng: thời Bắc thuộc đã có những người Nam nào làm quan bên Tàu và những người Tàu nào sang nước ta cai trị, những cuộc khởi nghĩa chống giặc phương Bắc đã tiến hành ra sao, mười hai sứ quân gồm những sứ quân nào, nước ta từng có những tên gọi gì... Những vấn đề tưởng chừng quen thuộc song vẫn hiện lên hết sức sinh động nhờ lối viết vừa khảo vừa kể, chặt chẽ mà hấp dẫn. Đó là biệt tài, cũng là đóng góp tiên phong trong việc tái hiện lịch sử Việt Nam từ các nguồn sử liệu chữ Hán của Ứng Hòe Nguyễn Văn Tố.','image_195509_1_17269.jpg'
,2021/1/1,20,4,4)
INSERT INTO VIETSACH VALUES(1,1,N'')
INSERT INTO VIETSACH VALUES(2,1,N'')
INSERT INTO VIETSACH VALUES(3,1,N'')
INSERT INTO VIETSACH VALUES(3,2,N'')
INSERT INTO VIETSACH VALUES(3,3,N'')
INSERT INTO VIETSACH VALUES(12,4,N'')

INSERT INTO VIETSACH VALUES(13,5,N'')
INSERT INTO VIETSACH VALUES(4,6,N'')

INSERT INTO VIETSACH VALUES(4,7,N'')
INSERT INTO VIETSACH VALUES(5,8,N'')
INSERT INTO VIETSACH VALUES(15,9,N'')
INSERT INTO VIETSACH VALUES(16,10,N'')

INSERT INTO VIETSACH VALUES(6,11,N'')
INSERT INTO VIETSACH VALUES(7,11,N'')
INSERT INTO VIETSACH VALUES(8,11,N'')
INSERT INTO VIETSACH VALUES(9,12,N'')
INSERT INTO VIETSACH VALUES(10,13,N'')
INSERT INTO VIETSACH VALUES(11,14,N'')
INSERT INTO VIETSACH VALUES(14,15,N'')

INSERT INTO VIETSACH VALUES(11,16,N'')
INSERT INTO VIETSACH VALUES(11,17,N'')
INSERT INTO VIETSACH VALUES(11,18,N'')
INSERT INTO VIETSACH VALUES(11,19,N'')
INSERT INTO VIETSACH VALUES(11,20,N'')

INSERT INTO VIETSACH VALUES(17,21,N'')
INSERT INTO VIETSACH VALUES(17,22,N'')
INSERT INTO VIETSACH VALUES(18,23,N'')
INSERT INTO VIETSACH VALUES(19,24,N'')
INSERT INTO VIETSACH VALUES(19,25,N'')

INSERT INTO VIETSACH VALUES(20,26,N'')
INSERT INTO VIETSACH VALUES(21,27,N'')
INSERT INTO VIETSACH VALUES(22,27,N'')
INSERT INTO VIETSACH VALUES(23,28,N'')
INSERT INTO VIETSACH VALUES(24,29,N'')
INSERT INTO VIETSACH VALUES(25,30,N'')

INSERT INTO VIETSACH VALUES(26,31,N'')
INSERT INTO VIETSACH VALUES(27,32,N'')
INSERT INTO VIETSACH VALUES(28,33,N'')
INSERT INTO VIETSACH VALUES(29,34,N'')
INSERT INTO VIETSACH VALUES(29,35,N'')

INSERT INTO VIETSACH VALUES(30,36,N'')
INSERT INTO VIETSACH VALUES(13,37,N'')
INSERT INTO VIETSACH VALUES(11,38,N'')
INSERT INTO VIETSACH VALUES(11,39,N'')
INSERT INTO VIETSACH VALUES(31,40,N'')
