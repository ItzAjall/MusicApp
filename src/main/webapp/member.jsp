<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="header.jsp" %>

<div class="container">
    <div class="flex-between" style="margin-bottom: 32px;">
        <div>
            <h2>خرید و رای‌دهی</h2>
            <p class="text-muted">آلبوم‌های محبوب خود را سفارش دهید و رای ثبت کنید.</p>
        </div>
    </div>

    <div class="grid">
        <div class="card glass">
            <h3 style="margin-bottom: 4px;">بی نام</h3>
            <div class="text-muted" style="font-size: 0.85rem; margin-bottom: 12px;">محسن چاوشی • سبک پاپ</div>
            <audio controls><source src="#" type="audio/mpeg"></audio>
            <div class="flex-between" style="margin-top: 12px; padding-top: 12px; border-top: 1px solid var(--glass-border);">
                <div style="font-weight: bold; color: var(--accent);">۶۵,۰۰۰ تومان</div>
                <div style="display: flex; gap: 8px;">
                    <input type="number" id="qty-1" value="1" min="1" style="width: 60px; padding: 4px; text-align: center;">
                    <button class="btn btn-primary" style="padding: 6px 12px;" onclick="addToCart(1, 'بی نام', 65000)">افزودن</button>
                </div>
            </div>
            <button class="btn" style="width: 100%; margin-top: 12px; border-color: rgba(255,255,255,0.2);" onclick="voteAlbum('پاپ')">★ رای به این آلبوم (در این ماه)</button>
        </div>
    </div>
</div>

<!-- Cart Modal -->
<div class="modal-overlay" id="cartModal">
    <div class="modal-content glass" style="max-width: 500px;">
        <div class="flex-between" style="margin-bottom: 20px; border-bottom: 1px solid var(--glass-border); padding-bottom: 16px;">
            <h3 style="margin: 0;">سبد سفارش شما</h3>
            <button class="btn" onclick="document.getElementById('cartModal').classList.remove('active')" style="padding: 4px 10px; border-radius: 50%;">✕</button>
        </div>
        <div id="cartItems" style="min-height: 100px; max-height: 300px; overflow-y: auto; margin-bottom: 20px;">
            <p class="text-muted" style="text-align: center; margin-top: 30px;">سبد سفارش خالی است.</p>
        </div>
        <div class="flex-between" style="border-top: 1px solid var(--glass-border); padding-top: 16px;">
            <div>جمع: <strong id="cartTotal" style="color: var(--accent);">0</strong> تومان</div>
            <button class="btn btn-primary" onclick="submitOrder()">تکمیل سفارش</button>
        </div>
    </div>
</div>

<script>
    let cart = [];

    function addToCart(id, name, price) {
        const qtyInput = document.getElementById(`qty-${id}`);
        const qty = parseInt(qtyInput.value);
        const existing = cart.find(item => item.id === id);
        if(existing) { existing.qty += qty; } else { cart.push({ id, name, price, qty }); }
        qtyInput.value = 1;
        document.getElementById('cartCount').innerText = cart.reduce((sum, item) => sum + item.qty, 0);
        updateCartUI();
    }

    function updateCartUI() {
        const cartContainer = document.getElementById('cartItems');
        let total = 0;
        if (cart.length === 0) {
            cartContainer.innerHTML = '<p class="text-muted" style="text-align: center;">سبد سفارش خالی است.</p>';
        } else {
            let html = '<div style="display: flex; flex-direction: column; gap: 8px;">';
            cart.forEach((item, index) => {
                total += item.price * item.qty;
                // نکته مهم: قبل از تمام علامت‌های $ یک بک‌اسلش گذاشتیم تا JSP خطا ندهد
                html += `<div style="display: flex; justify-content: space-between; align-items: center; background: rgba(0,0,0,0.2); padding: 10px; border-radius: 8px;">
                        <div><div>\${item.name}</div><div class="text-muted" style="font-size: 0.8rem;">تعداد: \${item.qty}</div></div>
                        <div style="display: flex; align-items: center; gap: 12px;"><span>\${(item.price * item.qty).toLocaleString()}</span>
                        <button class="btn" style="color: var(--danger); border: none; padding: 4px;" onclick="removeFromCart(\${index})">✕</button></div></div>`;
            });
            cartContainer.innerHTML = html + '</div>';
        }
        document.getElementById('cartTotal').innerText = total.toLocaleString();
    }

    function removeFromCart(index) { cart.splice(index, 1); document.getElementById('cartCount').innerText = cart.reduce((sum, item) => sum + item.qty, 0); updateCartUI(); }
    function submitOrder() { if(cart.length === 0) return alert('سبد خالی است.'); alert('سفارش شما در سیستم ثبت شد.'); cart = []; updateCartUI(); document.getElementById('cartModal').classList.remove('active'); document.getElementById('cartCount').innerText = 0; }
    function voteAlbum(genre) { alert(`رای شما در سبک "${genre}" برای این ماه ثبت شد.`); }
</script>
<%@ include file="footer.jsp" %>