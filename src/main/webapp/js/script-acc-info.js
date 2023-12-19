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

function reportLostKey() {
    // Thêm logic để báo mất key
    alert("Báo mất key");
}

function updateKey() {
    // Thêm logic để cập nhật key mới
    alert("Cập nhật key mới");
}
