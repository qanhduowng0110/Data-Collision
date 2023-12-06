# Storage-Collision
# Trước tiên cần hiểu về Delegatecall
delegatecall hiểu đơn giản là lấy logic function của một contract khác (contract implementation) về dùng nhưng với giá trị biến và hằng số của contract ban đầu (contract proxy)
## address(impl).delegatecall(data) ##
được sử dụng để có thể update code cho các contract mà không cần phải thay đổi hay setup lại địa chỉ proxy

# Storage Collision xảy ra khi thứ tự sắp xếp của các slot biến của 2 contract proxy và impl không giống nhau
Ví dụ như contracts.sol thì tại slot0 của Impl là "uint public num" còn của Proxy là "address public impl"

# Điều này nghĩa là khi tại contract Proxy gọi function performOperation thì EVM sẽ hiểu là thay đổi giá trị của slot0 của Proxy (tức thay đổi địa chỉ impl) chứ không phải là thay đổi num như mục đích ban đầu.

Hacker có thể lợi dụng điều này bằng cách truyền vào tham số là địa chỉ của chính Hacker khi gọi function performOperation của Proxy và sau đó thay đổi logic của function performOperation trong contract của Hacker để chiến quyền kiểm soát.
