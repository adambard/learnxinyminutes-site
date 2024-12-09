<!-- Điều này đồng nghĩa ta có thể sử dụng các phần tử HTML
trong Markdown, ví dụ như phần tử chú thích/comment.
Tuy nhiên, nếu sử dụng một phần tử HTML trong file Markdown,
ta không thể sử dụng cú pháp Markdown cho nội dung bên trong phần tử đó. -->
# Đây là đầu mục <h1>
## Đây là đầu mục <h2>
### Đây là đầu mục <h3>
#### Đây là đầu mục <h4>
##### Đây là đầu mục <h5>
###### Đây là đầu mục <h6>
Đây là đầu mục h1
=============

Đây là đầu mục h2
-------------
*Đoạn văn bản này được in nghiêng.*
_Và đoạn này cũng như vậy._

**Đoạn văn bản này được in đậm.**
__Và đoạn này cũng vậy.__

***Đoạn văn bản này được in nghiêng và đậm.***
**_Cách này cũng tương tự_**
*__Và cách này nữa__*
~~Đoạn văn bản này được gạch ngang.~~
Đây là đoạn văn thứ nhất.

Đây là đoạn văn thứ hai.
Dòng này vẫn thuộc đoạn văn thứ hai, do không có cách dòng.


Đây là đoạn văn thứ ba.
Dòng này kết thúc với 2 dấu cách (highlight để nhìn thấy).

Có phần tử <br /> ở bên trên.
> Đây là khối trích dẫn. Ta có thể
> ngắt dòng thủ công và thêm kí tự `>` trước mỗi dòng hoặc ta có thể để dòng tự ngắt nếu cần thiệt khi quá dài.
> Không có sự khác biệt nào, chỉ cần nó bắt đầu với kí tự `>`

> Ta còn có thể dùng nhiều mức
>> của khối trích dẫn.
> Như vậy có tốt không?

* Một mục
* Một mục
* Một mục nữa

hoặc

+ Một mục
+ Một mục
+ Một mục khác

hay

- Một mục
- Một mục
- Một mục sau
1. Mục thứ nhất
2. Mục thứ hai
3. Mục thứ ba
1. Mục thứ nhất
1. Mục thứ hai
1. Mục thứ ba
1. Mục thứ nhất
2. Mục thứ hai
3. Mục thứ ba
    * Mục nhỏ
    * Mục nhỏ
4. Mục thứ tư
Boxes below without the 'x' are unchecked HTML checkboxes.
- [ ] First task to complete.
- [ ] Second task that needs done
This checkbox below will be a checked HTML checkbox.
- [x] This task has been completed
    This is code
    So is this
    my_array.each do |item|
      puts item
    end
John didn't even know what the `go_to()` function did!
***
---
- - -
****************
[Click me!](http://test.com/)
[Click me!](http://test.com/ "Link to Test.com")
[Go to music](/music/).
[Nhấn vào đây][link1] để xem thêm!
[Ngoài ra nhấn vào đây][foobar] nếu bạn muốn xem qua.

[link1]: http://test.com/ "Tuyệt!"
[foobar]: http://foobar.biz/ "Tốt!"
[This][] is a link.

[this]: http://thisisalink.com/
![Thuộc tính alt cho ảnh](http://imgur.com/myimage.jpg "Tiêu đề tùy chọn")
![Đây là thuộc tính alt.][myimage]

[myimage]: relative/urls/cool/image.jpg "Đây là tiêu đề"
<http://testwebsite.com/> tương đương với
[http://testwebsite.com/](http://testwebsite.com/)
<foo@bar.com>
Khi ta muốn viết *đoạn văn bản này có dấu sao bao quanh* nhưng ta không muốn nó bị in nghiêng, ta có thể sử dụng: \*đoạn văn bản này có dấu sao bao quanh\*.
Máy treo? Thử bấm tổ hợp
<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Del</kbd>
| Cột 1        | Cột2     | Cột 3         |
| :----------- | :------: | ------------: |
| Căn trái     | Căn giữa | Căn phải      |
| blah         | blah     | blah          |
Cột 1 | Cột 2 | Cột 3
:-- | :-: | --:
blah | blah | blah
