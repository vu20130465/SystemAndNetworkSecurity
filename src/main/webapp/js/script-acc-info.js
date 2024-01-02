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

function showOrderList(username) {
    $(document).ready(function () {
        document.getElementById('order-table-value').innerHTML = '';
        $.ajax({
            url: 'order-list',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                // Xử lý dữ liệu và hiển thị trong bảng HTML
                var table = $('#order-table-value'); // ID của bảng HTML

                $.each(data, function (index, order) {
                    // Tạo một dòng trong bảng cho mỗi đơn hàng
                    var row = $('<tr>');
                    row.append($('<td>').text(index + 1)); // STT
                    row.append($('<td>').text(order.id)); // ID
                    row.append($('<td>').text(order.phone)); // Phone
                    row.append($('<td>').text(order.address)); // Address
                    row.append($('<td>').text(order.date)); // Date create (Cần xử lý định dạng ngày tháng)
                    row.append($('<td>').text(order.total)); // Total
                    row.append($('<td>').text('Đang xử lý')); // Status

                    // Thêm dòng vào bảng
                    table.append(row);
                });
            },
            error: function (error) {
                console.log('Error fetching data: ', error);
            }
        });
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
    document.getElementById('public-key').value = publicKey;
    $.post('account-info/key-manager?key=' + publicKey);
    Swal.fire("Cập nhật key mới");
}
