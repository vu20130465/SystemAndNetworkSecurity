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
    $('#' + tabName+'-tab').addClass('active');
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
    var keyPair = rsa.generateKeyPair({ bits: 2048, e: 0x10001 });

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
    // Thêm logic để cập nhật key mới
    $.post('account-info/key-manager?key='+$('#public-key').val());
    Swal.fire("Cập nhật key mới");
}
