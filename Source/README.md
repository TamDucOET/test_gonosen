# test_gonosen

Dự án test công ty Gonosen

##Yêu cầu: 
- Sử dung state management: bloc, getx, provider,...
- Màn hình 1:
 + Nhập tên vào textfield: YourName,
 + Nhấn "Next Screen" để sang màn hình thứ 2
- Màn hình 2:
 + Hiển thị tên từ màn hình trước
 + ListView: Data được get từ link: https://api.imgflip.com/get_memes
 + Có tính năng reload
 + Sắp sắp danh sách theo thứ tự từ bé đến lớn theo "width"
 + Sử dụng các thuộc tính cho Item:
  avatar: "url"
  name : "name"
  width * height: "width" x "height". (VD: 1000x2000)
  Id Item: "id"
