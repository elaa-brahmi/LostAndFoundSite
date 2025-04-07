// <% if (request.getAttribute("alert_add") != null) { %>
//     toastr.success('<%= request.getAttribute("alert_add") %>', 'success');
//     <% } %>
//
//
//
// <% if (request.getAttribute("alert_update_item") != null) { %>
//     toastr.info('<%= request.getAttribute("alert_update_item") %>', 'info');
//     <% } %>
//
// <% if (request.getAttribute("alert_update_user") != null) { %>
//     toastr.info('<%= request.getAttribute("alert_update_user") %>', 'info');
//     <% } %>
// $(document).ready(function () {
//     fetchItems();
//     fetchUserInfos();
//     <%--fetchNotifsUser(<%=session.getAttribute("userId")%>);--%>
// });
//
// function fetchUserInfos() {
//     $.ajax({
//         url: 'http://localhost:8080/UserInfos',
//         type: 'GET',
//         data: {
//             userId:<%= session.getAttribute("userId") %>,
// },
//     dataType: 'json',
//         success: function (data) {
//         console.log("user infos "+ data);
//         renderUserInfos(data);
//     },
//     error: function (xhr, status, error) {
//         console.log(error);
//     }
// });
// }
//
// function fetchItems() {
//     $.ajax({
//         url: 'http://localhost:8080/UserItems',
//         type: 'GET',
//         data: {
//             userId: <%= session.getAttribute("userId") %>,
// },
//     dataType: 'json',
//         success: function (data) {
//         console.log("all data "+data);
//         console.log("accepted data "+data.accepted);
//         console.log("pending data "+data.pending);
//         var PostContainer=document.getElementById("PostContainer");
//         var notFound = document.getElementById("notFound");
//         if(data.accepted.length===0 && data.pending.length===0){
//             console.log("no items found");
//             PostContainer.classList.add("hiddenn");
//             notFound.classList.remove("hiddenn");
//
//         }
//         else{
//             PostContainer.classList.remove("hiddenn");
//             notFound.classList.add("hiddenn");
//             renderItemsAccepted(data.accepted);
//             renderItemsPending(data.pending);
//
//         }
//
//
//     },
//     error: function (xhr, status, error) {
//         console.log(error);
//     }
//
// });
// }
//
// function renderItemsPending(PendingPosts) {
//     var Pendingdiv = document.getElementById("PendingPosts");
//     Pendingdiv.innerHTML = "";
//     PendingPosts.forEach(function (item) {
//         var div = document.createElement("div");
//         div.className = "containerPending";
//         div.setAttribute("data-aos","zoom-out-down");
//         div.setAttribute("data-aos-anchor-placement","bottom-bottom");
//         div.setAttribute("data-item-id", item.id); // Add this line
//         div.innerHTML = `
// <div style="display: table-row;>
//              <span style="font-size:18px;">` + item.name + `: ` + item.description + `</span></div>
// <div style="display: table-row;">
//         <div style="font-size:18px;">` + item.datefound + `</div>
//         <div style="font-size:18px;"><strong>` + item.type + `</strong></div></div>
//
// <div style="display: flex;
//     justify-content: center;
//     gap: 4%;">
//
//         <button class="BtnEdit" onclick="editItem(` +item.id+ `)" >
//             Edit
//             <svg viewBox="0 0 512 512" class="svg">
//                 <path
//                         d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"
//                 ></path>
//             </svg>
//
// <button class="BtnEdit" onclick="deleteItem(` +item.id+ `)" >
//             delete
//             <svg viewBox="0 0 512 512" class="svg">
//                 <path
//                         d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"
//                 ></path>
//             </svg>
//         </button>
//
// </div>
//  <div class="w-100"></div><br><button class="lostbtn">` + item.status + `</button>
//             `;
//         Pendingdiv.appendChild(div);
//
//
//     });
// }
//
// function renderItemsAccepted(AcceptedPosts) {
//
//     var acceptedPosts=document.getElementById("acceptedPosts");
//     acceptedPosts.innerHTML = "";
//     AcceptedPosts.forEach(function (item) {
//         var divPosts=document.createElement("div");
//         divPosts.className="containerPending";
//         divPosts.setAttribute("data-aos","zoom-out-down");
//         divPosts.setAttribute("data-aos-anchor-placement","bottom-bottom");
//         divPosts.setAttribute("data-item-id", item.id); // Add this line
//
//         divPosts.innerHTML = `
// <div style="display: table-row;>
//              <span style="font-size:18px;">` + item.name + `: ` + item.description + `</span>
// </div>
//         <div style="display: table-row;">
// <div style="font-size:18px;">` + item.datefound + `</div>
//         <div style="font-size:18px;"><strong>` + item.type + `</strong></div>
// </div>
// <div style="display: flex;
//     justify-content: center;
//     gap: 4%;">
//         <button class="BtnEdit" onclick="editItem(` +item.id+ `)" >
//             Edit
//             <svg viewBox="0 0 512 512" class="svg">
//                 <path
//                         d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"
//                 ></path>
//             </svg>
//         </button>
//
//
// <button class="BtnEdit" onclick="deleteItem(` +item.id+ `)" >
//             delete
//             <svg viewBox="0 0 512 512" class="svg">
//                 <path
//                         d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"
//                 ></path>
//             </svg>
//         </button></div>
// <div class="w-100"></div><br><button class="acceptedBtn">` + item.status + `</button>
//             `;
//         acceptedPosts.appendChild(divPosts);
//     });
// }
//
//
// function renderUserInfos(user) {
//     console.log(user);
//     var div = document.getElementById("userProfile");
//     var userPicture=user.picture==="no image is found" ? "../assets/img/noUser.png": user.picture;
//     console.log("userpictureee"+userPicture);
//     div.innerHTML = `
//         <div class="cardUser">
//         <header class="card-header">
//             <p><%= new Date()%></p>
//             <span class="title">` + user.email + `</span>
//             <span class="title">` + user.phone + `</span>
//         </header>
//         <div class="card-author">
//
// <form id="uploadForm" action="saveUserPic" type="post" enctype="multipart/form-data">
//         <div class="profileimage" onclick="document.getElementById('upload').click()">
//         <input type="file" id="upload" accept="image/*" style="display: none" onchange="previewImage(event)">
//     <img id="preview"  src="` + userPicture+ `">
//
//   </div>
//   </form>
//             <div class="author-name">
//                 <div class="author-name-prefix">user</div> ` + user.name + `
//             </div>
//         </div>
//         <div class="tags" style="display: flex;column-gap: 9%;flex-direction: row;">
// <button class="notifbutton" onclick="fetchNotifss()">
//    <svg viewBox="0 0 448 512" class="bell"><path d="M224 0c-17.7 0-32 14.3-32 32V49.9C119.5 61.4 64 124.2 64 200v33.4c0 45.4-15.5 89.5-43.8 124.9L5.3 377c-5.8 7.2-6.9 17.1-2.9 25.4S14.8 416 24 416H424c9.2 0 17.6-5.3 21.6-13.6s2.9-18.2-2.9-25.4l-14.9-18.6C399.5 322.9 384 278.8 384 233.4V200c0-75.8-55.5-138.6-128-150.1V32c0-17.7-14.3-32-32-32zm0 96h8c57.4 0 104 46.6 104 104v33.4c0 47.9 13.9 94.6 39.7 134.6H72.3C98.1 328 112 281.3 112 233.4V200c0-57.4 46.6-104 104-104h8zm64 352H224 160c0 17 6.7 33.3 18.7 45.3s28.3 18.7 45.3 18.7s33.3-6.7 45.3-18.7s18.7-28.3 18.7-45.3z"></path></svg>
// </button>
// <button class="notifbutton" onclick="editProfile(` +user.id+ `)">
//    <svg viewBox="0 0 448 512" class="bell"><path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path></svg>
// </button>
// <button class="notifbutton" onclick="logout()">
//    <svg viewBox="0 0 448 512" class="bell"><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path></svg>
// </button>
//
// <button class="notifbutton" onclick="fetchConversations()">
//   <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
// </button>
// <button class="notifbutton" onclick="seeFriendRequests()">
//   <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"> <path d="M2 21a8 8 0 0 1 13.292-6"></path>
//    <circle r="5" cy="8" cx="10"></circle>
//         <path d="M19 16v6"></path>
//         <path d="M22 19h-6"></path>
//   </svg>
// </button>
//         </div>
//     </div>
//
//         `;
// }
// function seeFriendRequests(){
//     document.getElementById("friendRequestsContainer").classList.toggle("hiddenn");
//     $.ajax({
//         url:"http://localhost:8080/getPendingFriendRequests",
//         type:'GET',
//         data:{
//             user_id:"<%= session.getAttribute("userId")%>"
//         },
//         success:function(data){
//             console.log("friend requests "+data);
//             var container=document.getElementById("requestContainerDiv");
//             container.innerHTML="";
//             if(data.length===0){
//                 container.innerHTML=`<p style="color: #000000;">No friend requests</p>`;
//             }
//             else{
//                 data.forEach(function(request){
//                     console.log("request"+request);
//
//                     var div=document.createElement("div");
//                     div.className="request";
//                     var userPicture=request.senderPicture==="no image is found" ? "../assets/img/noUser.png": request.senderPicture;
//                     console.log("userPicture"+userPicture);
//
//                     div.innerHTML=`
//                         <p id="info" style="display:flex;"> <b> <img src="`+userPicture+`" width="30px" height="30px" alt="userPicture" style="border-radius: 50%; object-fit: cover; margin-right:8px"></b> <b>`+request.senderName+`</b> <br></p>
//                       <div id="button-block">
//                         <div id="confirm" onclick="updateFriendRequestStatus('ACCEPTED',`+request.requestId+`)">Confirm</div>
//                         <div id="delete" onclick="updateFriendRequestStatus('REJECTED',`+request.requestId+`)">Delete Request</div>
//
//                         </div>
//                         `;
//                     container.appendChild(div);
//                 });
//             }
//         },
//         error:function(data){
//             console.log(data);
//         }
//     });
// }
// function updateFriendRequestStatus(status,requestId) {
//     console.log(status);
//     console.log(requestId);
//     $.ajax({
//         url:"http://localhost:8080/updateFriendRequestStatus",
//         type:'POST',
//         data:{
//             requestId:requestId,
//             status:status
//         },
//         success:function(data){
//             console.log("status updated"+data);
//             if(status==="ACCEPTED"){
//                 toastr.success(data.message, "friend request accepted");
//                 //todo start a conversation
//             }
//             else{
//                 toastr.success(data.message, "friend request rejected");
//             }
//             seeFriendRequests();
//         },
//         error:function(data){
//             console.log(data);
//             toastr.error("An error occurred", "Error");
//         }
//     })
// }
// function fetchConversations(){
//     $.ajax({
//         url:"http://localhost:8080/getConversations",
//         type:'GET',
//         data:{
//             user_id:"<%=session.getAttribute("userId")%>"
//         },
//         success:function(data){
//             console.log(data);
//             //todo create the conversations box and display conversations
//         },
//         error:function(data){
//             console.log(data);
//         }
//     });
//
// }