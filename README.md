# Storage-Collision
# Trước tiên cần hiểu về Delegatecall
delegatecall hiểu đơn giản là lấy logic function của một contract khác (contract implementation) về dùng nhưng với giá trị biến và hằng số của contract ban đầu (contract proxy)
## address(impl).delegatecall(data) ##
được sử dụng để có thể update code cho các contract mà không cần phải thay đổi hay setup lại địa chỉ proxy

