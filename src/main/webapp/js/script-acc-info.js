function showTab(tabName) {
    // Ẩn tất cả các tab
    document.querySelectorAll('.account-details, .order-list, .success-orders, .key-management').forEach(tab => {
        tab.style.display = 'none';
    });

    // Hủy chọn tất cả các tab
    document.querySelectorAll('.tab').forEach(tab => {
        tab.classList.remove('active');
    });

    // Hiển thị tab được chọn
    document.getElementById(tabName).style.display = 'block';
    // Chọn tab hiện tại
    $('#' + tabName + '-tab').addClass('active');
}

// function showOrderList(username) {
//     $(document).ready(function () {
//         document.getElementById('order-table-value').innerHTML = '';
//         $.ajax({
//             url: 'order-list',
//             type: 'GET',
//             dataType: 'json',
//             success: function (data) {
//                 // Xử lý dữ liệu và hiển thị trong bảng HTML
//                 var table = $('#order-table-value'); // ID của bảng HTML
//
//                 $.each(data, function (index, order) {
//                     // Tạo đối tượng XMLHttpRequest(từ verification)
//                     var xhr = new XMLHttpRequest();
//                     // Cài đặt phương thức và địa chỉ URL cho yêu cầu
//                     xhr.open("POST", "verification", true);
//                     xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//                     // Định dạng dữ liệu gửi đi
//                     var data = "idOrder=" + encodeURIComponent(order.id) + "&username=" + encodeURIComponent(username);
//                     let notificationText = "";
//                     if (xhr.status === 200) {
//                         // Phân tích chuỗi JSON nhận được
//                         var jsonResponse = JSON.parse(xhr.responseText);
//
//                         // Lấy giá trị từ JSON
//                         var isOrderValid = jsonResponse.isOrderValid;
//
//                         // Xử lý dữ liệu theo ý của bạn
//                         if (isOrderValid) {
//                             notificationText = "Đã xác thực"
//                         } else {
//                             notificationText = "Không thể xác thực"
//                         }
//                     }
//                     xhr.send(data);
//
//                     var xhr = new XMLHttpRequest();
//
//                     // Cài đặt phương thức và địa chỉ URL cho yêu cầu
//                     xhr.open("POST", "verifyUser", true);
//                     xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//
//                     // Định dạng dữ liệu gửi đi
//                     var data = "idOrder=" + encodeURIComponent(order.id) + "&username=" + encodeURIComponent(username);
//                     let notificationUserText = "";
//                     // Đặt hàm xử lý sự kiện khi nhận phản hồi
//                     xhr.onload = function () {
//                         if (xhr.status === 200) {
//                             // Hiển thị thông báo từ phản hồi
//                             notificationUserText = "Đã xác thực";
//                         } else {
//                             // Xử lý lỗi nếu có
//                             notificationUserText = "Không thể xác thực";
//                         }
//                     };
//
//                     // Gửi yêu cầu với dữ liệu
//                     xhr.send(data);
//
//
//                     // Tạo một dòng trong bảng cho mỗi đơn hàng
//                     var row = $('<tr>');
//                     row.append($('<td>').text(index + 1)); // STT
//                     row.append($('<td>').text(order.id)); // ID
//                     row.append($('<td>').text(order.phone)); // Phone
//                     row.append($('<td>').text(order.address)); // Address
//                     row.append($('<td>').text(order.date)); // Date create (Cần xử lý định dạng ngày tháng)
//                     row.append($('<td>').text(order.total)); // Total
//                     row.append($('<td>').text(notificationText)); // Status
//                     row.append($('<td>').text(notificationUserText)); // Status
//
//                     // Thêm dòng vào bảng
//                     table.append(row);
//                 });
//             },
//             error: function (error) {
//                 console.log('Error fetching data: ', error);
//             }
//         });
//     });
// }
function showOrderList(username) {
    $(document).ready(function () {
        document.getElementById('order-table-value').innerHTML = '';
        $.ajax({
            url: 'order-list',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                var table = $('#order-table-value');
                $.each(data, function (index, order) {
                    var row = $('<tr>');
                    row.append($('<td>').text(index + 1));
                    row.append($('<td>').text(order.id));
                    row.append($('<td>').text(order.phone));
                    row.append($('<td>').text(order.address));
                    row.append($('<td>').text(order.date));
                    row.append($('<td>').text(order.total));
                    // Gọi servlet 'verification' để xác thực đơn hàng và lấy thông báo
                    verifyOrder(order.id, function(isOrderValid) {
                        row.append($('<td>').text(isOrderValid ? 'Xác thực' : 'Không toàn vẹn'));
                        table.append(row);
                    });
                });
            },
            error: function (error) {
                console.log('Error fetching data: ', error);
            }
        });
    });
}
// Hàm để gọi servlet 'verification' và lấy thông báo xác thực
function verifyOrder(idOrder, callback) {
    $.ajax({
        url: 'verification',
        type: 'POST',
        dataType: 'json',
        data: { idOrder: idOrder },
        success: function (data) {
            callback(data.isOrderValid);
        },
        error: function (error) {
            console.log('Error verifying order: ', error);
        }
    });
}

function editAccount() {
    // Thêm logic để chuyển sang chế độ chỉnh sửa thông tin tài khoản
    alert("Chỉnh sửa thông tin tài khoản");
}

function changePassword() {
    // Thêm logic để chuyển sang trang đổi mật khẩu
    alert("Chuyển sang trang đổi mật khẩu");
}

function createKey() {
    // Thêm logic để tạo key
    var rsa = forge.pki.rsa;
    var keyPair = rsa.generateKeyPair({bits: 2048, e: 0x10001});

    $('#private-key').val(forge.pki.privateKeyToPem(keyPair.privateKey));
    $('#public-key').val(forge.pki.publicKeyToPem(keyPair.publicKey));
    Swal.fire("Tạo key thành công");
}

function reportLostKey() {
    // Thêm logic để báo mất key
    $.post('account-info/report-lost-key');
    Swal.fire("Đã báo mất key");
}

function updateKey() {
    //Tạo public key bằng private key
    var privateKey = forge.pki.privateKeyFromPem($('#private-key').val());
    let publicKey = forge.pki.publicKeyToPem(forge.pki.setRsaPublicKey(privateKey.n, privateKey.e));

    // Dùng AJAX để gửi 1 POST yêu cầu lên server
    $.post('account-info/key-manager?key=' + publicKey, function (data) {
        if (data === 'success') {
            Swal.fire("Cập nhật key mới");
        } else {
            Swal.fire("Cập nhật không thành công");
        }
    }).fail(function () {
        // This block is executed if the AJAX request fails
        Swal.fire("Cập nhật không thành công");
    });
}
