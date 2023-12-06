# Storage-Collision
# Trước tiên cần hiểu về Delegatecall
delegatecall hiểu đơn giản là lấy logic function của một contract khác (contract implementation) về dùng nhưng với giá trị biến và hằng số của contract ban đầu (contract proxy)
## address(impl).delegatecall(data) ##
được sử dụng để có thể update code cho các contract mà không cần phải thay đổi hay setup lại địa chỉ proxy

# Storage Collision xảy ra khi thứ tự sắp xếp của các slot biến của 2 contract proxy và impl không giống nhau
Ví dụ như contracts.sol thì tại slot0 của Impl là "uint public num" còn của Proxy là "address public impl"
