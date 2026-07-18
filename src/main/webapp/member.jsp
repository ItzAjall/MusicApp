<%@ page import="com.daniyal.finalapp.model.Users" %>
<%@ page import="com.daniyal.finalapp.dao.AlbumDAO" %>
<%@ page import="com.daniyal.finalapp.model.Album" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="header.jsp"/>
<%
    Users user = (Users) session.getAttribute("user");
    AlbumDAO albumDAO = new AlbumDAO();
    if (user == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    else if (user.isAdmin())
        response.sendRedirect("admin.jsp");
%>

<div class="container">
    <div class="flex-between" style="margin-bottom: 32px;">
        <div>
            <h2>آلبوم های خریداری شده</h2>
        </div>
    </div>

    <div class="grid">
        <%
        for (Album album : user.getBoughtAlbums().keySet()){
        %>
        <div class="card glass">
            <h3 style="margin-bottom: 4px;"><%=album.getAlbumName()%></h3>
            <div class="text-muted" style="font-size: 0.85rem; margin-bottom: 12px;"><%=album.getSinger().getFirstName()%>  <%=album.getSinger().getLastName()%>• <%=album.getGenre().getGenreName()%></div>
            <div class="text-muted" style="font-size: 0.85rem; margin-bottom: 12px;">تعداد خریده شده: <%=user.getBoughtAlbums().get(album)%></div>
            <audio controls><source src="music/<%=album.getSongPath()%>" type="audio/mpeg"></audio>
            <button class="btn" style="width: 100%; margin-top: 12px; border-color: rgba(255,255,255,0.2);" onclick="voteAlbum('پاپ')">★ رای به این آلبوم (در این ماه)</button>
        </div>

        <%}%>
    </div>
</div>
<div class="container">
    <div class="flex-between" style="margin-bottom: 32px;">
        <div>
            <h2>خرید آلبوم</h2>
        </div>
    </div>

    <div class="grid">
            <%
                for (Album album : albumDAO.findAll()){
            %>
            <div class="card glass">
                <h3 style="margin-bottom: 4px;"><%=album.getAlbumName()%></h3>
                <div class="text-muted" style="font-size: 0.85rem; margin-bottom: 12px;"> <%=album.getSinger().getFirstName()%> <%=album.getSinger().getLastName()%> •  <%=album.getGenre().getGenreName()%> </div>
                <audio controls><source src="music/<%=album.getSongPath()%>" type="audio/mpeg"></audio>
                <div class="flex-between" style="margin-top: 12px; padding-top: 12px; border-top: 1px solid var(--glass-border);">
                    <div style="font-weight: bold; color: var(--accent);">
                        <%=album.getAlbumPrice()%>
                        <span style="color: white;">تومان</span>
                    </div>
                    <div style="display: flex; gap: 8px;">
                        <input type="number" id="qty-<%=album.getId()%>" value="1" min="1" style="width: 60px; padding: 4px; text-align: center;">
                        <button class="btn btn-primary" style="padding: 6px 12px;" onclick="addToCart(<%=album.getId()%>)">افزودن</button>
                    </div>
                </div>
            </div>

            <%}%>
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
            <%
            if (user.getCart().isEmpty()){
            %>
            <p class="text-muted" style="text-align: center; margin-top: 30px;">سبد سفارش خالی است.</p>
            <%} else {
                for (Album album : user.getCart().keySet()){%>


            <div style="display: flex; flex-direction: column; gap: 8px;"><div style="display: flex; justify-content: space-between; align-items: center; background: rgba(0,0,0,0.2); padding: 10px; border-radius: 8px;">
                <div><div><%=album.getAlbumName()%></div><div class="text-muted" style="font-size: 0.8rem;">تعداد: <%=user.getCart().get(album)%></div></div>
                <div style="display: flex; align-items: center; gap: 12px;"><span><%=user.getCart().get(album) * album.getAlbumPrice()%> تومان</span>
                    <input type="number" id="remove-qty-<%=album.getId()%>" value="1" min="1" max="<%=user.getCart().get(album)%>" style="width: 60px; padding: 4px; text-align: center;"><button class="btn" style="color: var(--danger); border: none; padding: 4px;" onclick="removeFromCart(<%=album.getId()%>)">✕</button></div></div></div>
            <br>





            <%}}%>
        </div>
        <div class="flex-between" style="border-top: 1px solid var(--glass-border); padding-top: 16px;">
            <div>جمع: <strong id="cartTotal" style="color: var(--accent);"><%=user.getCartTotalPrice()%></strong> تومان</div>
            <button class="btn btn-primary" onclick="window.location.href ='submitOrder'">تکمیل سفارش</button>
        </div>
    </div>
</div>

<script>
    function addToCart(albumId) {
        let qty = document.getElementById("qty-" + albumId).value;
        window.location.href = "addToCart?id=" + albumId + "&qty=" + qty;
    }
    function removeFromCart(albumId) {
        let qty = document.getElementById("remove-qty-" + albumId).value;
        window.location.href = "removeFromCart?id=" + albumId + "&qty=" + qty;
    }



    function voteAlbum(genre) { alert(`رای شما در سبک "${genre}" برای این ماه ثبت شد.`); }
</script>
<%@ include file="footer.jsp" %>