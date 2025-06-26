- Code from   
<a href = "https://github.com/thou05/assembly-learn">thou05</a>

- [Chương 1](#chương-1)

# Chương 1
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Các thành phần cơ bản của máy tính
- CPU: Central Processing Unit 
- ALU: Arithmetic Logic Unit: Tính toán số học và Logic 
- CU: Control Unit: Đảm nhận vai trò điều khiển 
- Registers: Các thanh ghi đóng vai trò là bộ nhớ tạm thời trong CPU
  
Memory
- Internal (trong):
  - ROM - Read Only Memory: thông tin không bị mất khi mất điện,  dùng để chứa BIOS: basic input output system 
  - Khi bật máy tính, quá trình POST (Power on Self Test) sẽ được thực thi 
  - PROM - Programmable ROM: loại ROM có thể lập trình được 
  - EPROM - Erase PROM: loại ROM có thể xóa được (phải xóa bằng tia cực tím)
  - EEPROM - Electrical EPROM: có thể xóa và ghi bằng điện (không cần tia cực tím)

  - RAM - Random Access Memory: có 2 loại DRAM (Dynamic RAM), SRAM (Static RAM)
  - Cache L2: đặt giữa CPU và máy tính

- External (ngoài):
  - Hard Disk, SSD, HHD 
  - Registers → L1 cache → L2 cache → main memory → external memory …. cloud
- I/O devices:
  - Input: keyboard, mouse, camera, micro, modem,... 
  - Output: monitor, printer, speaker, modem,...

- Để “nối” các thành phần trên với nhau nhằm cho máy tính có thể hoạt động được, ta dùng System Bus
- Có 3 loại System bus:
  - Address bus: 1 chiều 
  - Data bus: 2 chiều 
  - Control bus: 2 chiều

## Tổng quan hiệu năng máy tính
- Hiệu năng (Performance), kí hiệu P
- Công thức: P=1/t, t: thời gian thực hiện

- Xung nhịp của CPU:
  - Hoạt động của CPU được điều khiển bởi xung nhịp có tần số xác động 
  - Chu kì xung nhịp T0 (Clock period): thời gian của một chu kì 
  - Tần số xung nhịp f0 (Clock period): số chu kì trong 1s
  - $f_0$ = $\frac{1}{T_0}$


- Thời gian CPU ($t_{CPU}$)
  - $t_{CPU}$ = n.$T_0$ = $\frac{n}{f_0}$, n: số chu kì xung nhịp, 

- Số lệnh và số chu kỳ trên 1 lệnh 
  - Số chu kì = Số lệnh * Số chu kì trên 1 lệnh (n = IC (Instruction Count) * CPI (Cycles per Instruction))

- Thời gian thực hiện của CPU:
  - $t_{CPU}$ = IC * PCI * $T_0$ (Trong trường hợp các lệnh khác nhau có CPI khác nhau, cần tính CPI trung bình)
  - $CPI_{TB}$ = n / IC, $CPI_{TB}$: số chu kì trên 1 lệnh trung bình, n: tổng số chu kì, IC: số lệnh

# Chương 2: Biểu diễn thông tin trong máy tính
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Các hệ đếm cơ bản
Hệ thập phân
Hệ nhị phân
- Bits, Bytes, Nibbles

## Mã hóa và lưu trữ dữ liệu trong máy tính

# Chương 3: CPU
<p align="right">(<a href="#readme-top">back to top</a>)</p>

Mô hình máy tính 
- Havard: Lệnh và dữ liệu được lưu trữ trên hệ thống bộ nhớ riêng biệt 
- Von Neumann: Lệnh và dữ liệu được lưu trữ trộn lẫn trên cùng 1 hệ thống bộ nhớ → mô hình chính của máy tính cá nhân hiện nay

Nhiệm vụ của CPU:
- Nhận lệnh (Fetch Instruction): CPU đọc lệnh từ bộ nhớ
- Giải mã lệnh (Decode Instruction): Xác định thao tác mà lệnh yêu cầu
- Nhận dữ liệu (Fetch Data): nhận dữ liệu từ bộ nhớ hoặc các cổng vào-ra
- Xử lý dữ liệu (Process Data): thực hiện phép toán số học hay phép toán logic với các dữ liệu
- Ghi dữ liệu (Write Data): ghi dữ liệu ra bộ nhớ hay cổng vào-ra

ALU:
- Chức năng: Thực hiện phép toán số học và logic
- Số học: cộng, trừ, nhân, chia, tăng, giảm, đảo dấu 
- Logic: AND, OR, XOR, NOT, phép dịch bit

CU:
- Điều khiển nhận lệnh từ bộ nhớ đưa vào thanh ghi lệnh
- Tăng nội dung của PC để trỏ sang lệnh kế tiếp
- Giải mã lệnh đã được nhận để xác định thao tác mà lệnh yêu cầu
- Phát ra các tín hiệu điều khiển thực hiện lệnh
- Nhận các tín hiệu yêu cầu từ bus hệ thống và đáp ứng với các yêu cầu đó

- Tín hiệu đến CU 
  - Clock: tín hiệu nhịp từ mạch tạo dao động bên ngoài 
  - Mã lệnh từ thanh ghi lệnh đưa đến để giải mã 
  - Các cờ từ thanh ghi cờ cho biết trạng thái của CPU 
  - Các tín hiệu yêu cầu từ bus điều khiển

- Tín hiệu điều khiển của CU 
  - Các tín hiệu điều khiển bên trong CU: điều khiển các thanh ghi, điều khiển ALU 
  - Các tín hiệu điều khiển bên ngoài CU: điều khiển bộ nhớ, điều khiển các module vào-ra

Tập thanh ghi
- Tập hợp các thanh ghi nằm trong CPU
- Chứa các thông tin tạm thời phục vụ cho hoạt động ở thời điểm hiện tại của CPU
- Được coi là mức đầu tiên của hệ thống nhớ
- Tuy thuộc vào bộ xử lý cụ thể
- Số lượng thanh ghi nhiều → tăng hiệu năng của CPU
- Có 2 loại thanh ghi: Các thanh ghi lập trình được và không lập trình được

- Phân loại theo chức năng:
  - Thanh ghi địa chỉ: quản lý địa chỉ của ngăn nhớ hay cổng vào-ra 
  - Thanh ghi dữ liệu: chứa tạm thời các dữ liệu 
  - Thanh ghi đa năng: có thể chứa địa chỉ hoặc dữ liệu 
  - Thanh ghi điều khiển/ trạng thái: chứa các thông tin điều khiển và trạng thái của CPU 
  - Thanh ghi lệnh: chứa lệnh đang được thực hiện

- Một số thanh ghi điển hình:
- Các thanh ghi địa chỉ 
- Bộ đếm chương trình PC (Program Counter)
- Con trỏ dữ liệu DP (Data Pointer)
- Con trỏ ngăn xếp SP (Stack Pointer)
- Thanh ghi cơ sở và thanh ghi chỉ số (Base Register & Index Register)
- Các thanh ghi dữ liệu 
- Thanh ghi trạng thái

Bộ đếm chương trình (PC - Program Counter)
- Còn được gọi là con trỏ lệnh IP (Instruction Pointer)
- Chứa địa chỉ của lệnh tiếp theo sẽ được nhận vào
- Sau khi 1 lệnh được nhận vào, nội dung PC tự động tăng để trỏ sang lệnh tiếp theo

Thanh ghi con trỏ dữ liệu (DP - Data pointer)
- Chứa địa chỉ của ngăn nhớ dữ liệu mà CPU muốn truy cập
- Thường có 1 số thanh ghi con trỏ dữ liệu: ds, es,...

Ngăn xếp
- Là vùng nhớ có cấu trúc LIFO
- Ngăn xếp thường dùng để phục vị cho chương trình con
- Đáy ngăn xếp là 1 ngăn nhớ xác định
- Đỉnh ngăn xếp là thông tin nằm ở vị trí trên cùng trong ngăn xếp
- Đỉnh ngăn xếp có thể bị thay đổi

Con trỏ ngăn xếp SP (Stack Pointer)
- SP chứa địa chỉ của ngăn nhớ đỉnh ngăn xếp
- Khi cất 1 thông tin vào ngăn xếp:
  - Nội dung của SP tự động giảm 
  - Thông tin được cất vào ngăn nhớ được trỏ bởi SP
- Khi lấy 1 thông tin ra khỏi ngăn xếp:
  - Thông tin được đọc từ ngăn nhớ được trỏ bởi SP 
  - Nội dung của SP tự động tăng
- Khi ngăn xếp rỗng, SP trỏ vào đáy

Thanh ghi cơ sở - thanh ghi chỉ số
- Thanh ghi cơ sở: chứa địa chỉ của ngăn nhớ cơ sở (địa chỉ cơ sở)
- Thanh ghi chỉ số: chứa độ lệch địa chỉ giữa ngăn nhớ mà CPU cần truy nhập so với ngăn nhớ cơ sở (chỉ số)
- Địa chỉ của ngăn nhớ cần truy nhập = địa chi cơ sở + chỉ số 

Thanh ghi dữ liệu
- Thanh ghi AX: Lưu kết quả tính toán
- Thanh ghi BX: Thường dùng để lưu địa chỉ cơ sở
- Thanh ghi CX: Lưu số lần lặp trong lệnh LOOP
- Thanh ghi DX: Kết hợp với thanh ghi AX để lưu kết quả của phép nhân hoặc chia số 16 bit. Ngoài ra còn dùng để lưu địa chỉ 16 bit của cổng vào ra

Status Register
- Còn gọi là thanh ghi cờ - Flag Register
- Chứa các thông tin trạng thái của CPU 
  - Các cờ phép toán: báo hiệu trạng thái của kết quả phép toán 
  - Các cờ điều khiển: biểu thị trạng thái điều khiển của CPU

Ví dụ cờ phép toán:
- Cờ zero (cờ rỗng): được thiết lập lên 1 khi kết quả của phép toán = 0 
- Cờ Sign (cờ dấu): được thiết lập lên 1 khi kết quả của phép toán < 0 
- Cờ Carry (cờ nhớ): được thiết lập lên 1 nếu phép toán có nhớ ra ngoài bit cao nhất. Cờ báo tràn với số không dấu 
- Cờ Overflow (cờ tràn): được thiết lập lên 1 nếu cộng 2 số nguyên cùng dấu mà kết quả có dấu ngược lại. Cờ báo tràn với số có dấu

Ví dụ cờ điều khiển:
- Cờ Interupt (cờ cho phép ngắt):
  - Nếu IF = 1 → CPU ở trạng thái cho phép ngắt với tín hiệu yêu cầu ngắt từ bên ngoài gửi tới 
  - Nếu IF = 0 → CPU ở trạng thái cấm ngắt với tín hiệu yêu cầu ngắt từ bên ngoài gửi tới 

Thanh ghi truy nhập bộ nhớ
- Thanh ghi địa chỉ bộ nhớ MAR (Memory Address Register)
  - Là giao tiếp giữa CPU và bus địa chỉ 
  - Nhận địa chỉ bộ nhớ của lệnh kế tiếp từ PC và chuyển cho bus địa chỉ
- Thanh ghi dữ liệu bộ nhớ MBR (Memory Buffer Register)
  - Là giao tiếp giữa CPU và bus dữ liệu 
  - Nhận lệnh từ bus dữ liệu và chuyển cho IR

- Đây là 2 thanh ghi được dùng riêng, người lập trình không thể truy cập được 

# Chương 6: Tập lệnh 8086
## Thanh ghi
Thanh ghi đa năng
- Thanh ghi AX: Lưu kết quả tính toán
- Thanh ghi BX: Thường dùng để lưu địa chỉ cơ sở
- Thanh ghi CX: Lưu số lần lặp trong lệnh LOOP
- Thanh ghi DX: Kết hợp với thanh ghi AX để lưu kết quả của phép nhân hoặc chia số 16 bit. Ngoài ra còn dùng để lưu địa chỉ 16 bit của cổng vào ra

Thanh ghi đoạn
- Thanh ghi CS: Để ghi địa chỉ mã lệnh
- Thanh ghi DS: Chứa địa chỉ dữ liệu
- Thanh ghi SS: Chứa địa chỉ ngăn xếp
- Thanh ghi ES: Thanh ghi phụ, thường dùng để chứa địa chỉ chuỗi
