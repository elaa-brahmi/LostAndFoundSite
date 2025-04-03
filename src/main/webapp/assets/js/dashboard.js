$(document).ready(function(){
    fetchUsersNmbers();
    fetchNbPendingItems();
    fetchNbMatchedItems();
    fetchNbResolvedItems();
    fetchPercentageAcceptedNotifs();
    fetchPercentageRejectedNotifs();
    fetchPendingMatches();
    fetchAllUsers();
    fetchAllItems();
    fetchAllItemsPending();
});
function fetchAllUsers(){
    $.ajax({
        url: 'http://localhost:8080/allUsers',
        type: 'GET',
        datatype: 'json',
        success: function(data){
            console.log('Users fetched successfully:', data);
            var tableBody = $('#tbodyUsers');
            tableBody.empty(); // Clear existing rows
            data.forEach(user => {
                console.log("user :",user);
                var row=document.createElement('tr');
                row.innerHTML=`
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div>
                            <img src="${user.picture}" class="avatar avatar-sm me-3" alt="user1">
                          </div>
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">${user.name}</h6>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">${user.email}</p>
                     
                      </td>
                      <td class="align-middle text-center text-sm">
                         <span class="text-xs font-weight-bold mb-0">${user.phone}</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold">${user.role}</span>
                      </td>
                      <td class="align-middle text-center">
                      <button  onclick="deleteUser(${user.id})" class="btn btn-danger" >delete</button>
                        </td>
                `;

                tableBody.append(row);

                
            });},
           
        error: function(xhr, status, error){
            console.error('Error fetching users:', error);
        }
    });
}
function fetchUsersNmbers(){
    $.ajax({
        url: 'http://localhost:8080/NbUsers',
        type: 'GET',
        datatype: 'text',
        success: function(data){
            console.log('Users numbers fetched successfully:', data);
            $('#nbUsers').text(data);
        },
        error: function(xhr, status, error){
            console.error('Error fetching users numbers:', error);
        }

    });
    
}
function fetchNbPendingItems(){ 
    $.ajax({
        url: 'http://localhost:8080/NbPendingItems',
        type: 'GET',
        datatype: 'text',
        success: function(data){
            console.log('Pending items numbers fetched successfully:', data);
            $('#nbPendingItems').text(data);
        },
        error: function(xhr, status, error){
            console.error('Error fetching pending items numbers:', error);
        }

    });
}
function fetchNbResolvedItems(){
    $.ajax({    
        url: 'http://localhost:8080/NbResolvedItems',
        type: 'GET',
        datatype: 'text',
        success: function(data){
            console.log('Resolved items numbers fetched successfully:', data);
            $('#nbResolvedItems').text(data);
        },
        error: function(xhr, status, error){
            console.error('Error fetching resolved items numbers:', error);
        }

    });
    
}
function fetchNbMatchedItems(){
    $.ajax({    
        url: 'http://localhost:8080/matchedItems',
        type: 'GET',
        datatype: 'text',
        success: function(data){
            console.log('Matched items numbers fetched successfully:', data);
            $('#nbMatchedItems').text(data);
        },
        error: function(xhr, status, error){
            console.error('Error fetching matched items numbers:', error);
        }

    });
    
}

function fetchPercentageAcceptedNotifs(){
    $.ajax({
        url: 'http://localhost:8080/PercentageAcceptedNotifs',
        type: 'GET',
        datatype: 'text',
        success: function(data){
            let integerPart = Math.trunc(data); 
            console.log('Percentage of accepted notifications fetched successfully:', data);
            $('#acceptedMatches').text(integerPart + '%');
            var progressBar = $('#acceptedPercentage');
            progressBar.attr('aria-valuenow', integerPart); // Set the current value of the progress bar
            progressBar.css('width', integerPart + '%'); // Set the width of the progress bar
          
        },
        error: function(xhr, status, error){
            console.error('Error fetching percentage of accepted notifications:', error);
        }

    });
    
}
function fetchPercentageRejectedNotifs(){
    $.ajax({
        url: 'http://localhost:8080/rejectedNotifs',
        type: 'GET',
        datatype: 'text',
        success: function(data){
            let integerPart = Math.trunc(data); 
            console.log('Percentage of rejected notifications fetched successfully:', data);
            $('#rejectedMatches').text(integerPart + '%');
            var progressBar = $('#rejectedPercentage');
            progressBar.attr('aria-valuenow', integerPart); // Set the current value of the progress bar
            progressBar.css('width', integerPart + '%'); // Set the width of the progress bar
        
        },
        error: function(xhr, status, error){
            console.error('Error fetching percentage of rejected notifications:', error);
        }

    });
    
}
function fetchPendingMatches(){
    $.ajax({
        url: 'http://localhost:8080/pendingMatches',
        type: 'GET',
        datatype: 'text',
        success: function(data){
            let integerPart = Math.trunc(data); 
            console.log('Percentage of pending notifications fetched successfully:', integerPart);
            $('#pendingMatches').text(integerPart + '%');
            var progressBar = $('#pendingPercentage');
            progressBar.attr('aria-valuenow', integerPart); // Set the current value of the progress bar
            progressBar.css('width', integerPart + '%'); // Set the width of the progress bar
        
        },
        error: function(xhr, status, error){
            console.error('Error fetching percentage of rejected notifications:', error);
        }

    });
    
}
function fetchPendingItems(){
        $.ajax({
            url: 'http://localhost:8080/pendingItems',
            type: 'GET',
            datatype: 'json',
            success: function(data){
                console.log('Pending items numbers fetched successfully:', data);
            },
            error: function(xhr, status, error){
                console.error('Error fetching pendingItems');
            }
        });

}
function fetchAllItems(){
    $.ajax({
        url: 'http://localhost:8080/allItemsNoPagi',
        type: 'GET',
        datatype: 'json',
        success: function(data){
            console.log('All items numbers fetched successfully:', data);
            var tbdoy=$('#tbodyItems'); 
            tbdoy.empty(); // Clear existing rows
            data.forEach(item => {
                console.log("item :",item);
                var row=document.createElement('tr');
                if(item.status=="PENDING"){
                    row.innerHTML=`
                
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div>
                            <img src="${item.image}" class="avatar avatar-sm me-3" alt="user1">
                          </div>
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">${item.name}</h6>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">${item.description}</p>
                     
                      </td>
                      <td class="align-middle text-center text-sm">
                         <span class="text-xs font-weight-bold mb-0">${item.location}</span>
                      </td>
                        <td class="align-middle text-center text-sm">
                         <span class="text-xs font-weight-bold mb-0">${item.datefound}</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="badge badge-sm bg-gradient-warning">${item.status}</span>
                      </td>
                        <td class="align-middle text-center text-sm">
                        <span class="text-xs font-weight-bold mb-0">${item.type}</span>
                      </td>
                        <td class="align-middle text-center text-sm">
                         <span class="text-xs font-weight-bold mb-0">${item.
                            matchedStatus}</span>
                      </td>
                      <td class="align-middle">
                        <button onclick="editStatus(${item.id},'accepted')" class="btn btn-primary" >
                          accept
                        </button>
                         <button onclick="editStatus(${item.id},'rejected')" class="btn btn-secondary" >
                          reject
                        </button>
                      </td>
                `;
                   
                }else {  
                    row.innerHTML=`
                
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div>
                            <img src="${item.image}" class="avatar avatar-sm me-3" alt="user1">
                          </div>
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">${item.name}</h6>
                           
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">${item.description}</p>
                     
                      </td>
                      <td class="align-middle text-center text-sm">
                        <p class="text-xs font-weight-bold mb-0">${item.location}</p>
                      </td>
                        
                        <td class="align-middle text-center text-sm">
                        <p class="text-xs font-weight-bold mb-0">${item.datefound}</p>
                      </td>
                      <td class="align-middle text-center">
                        <span class="badge badge-sm bg-gradient-success">${item.status}</span>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="text-xs font-weight-bold mb-0">${item.type}</span>
                      </td>
                        <td class="align-middle text-center text-sm">
                       <span class="text-xs font-weight-bold mb-0">${item.matchedStatus}</span>
                      </td>
                      <td class="align-middle">
                      <p class="text-xs font-weight-bold mb-0">accepted</p>
                        
                      </td>
                    
                 
                `;
                }
                

                tbdoy.append(row);

                
            });
        },
        error: function(xhr, status, error){
            console.error('Error fetching allItems');
        }
    });
}
function editStatus(id,status){
    $.ajax({
        url: 'http://localhost:8080/updateStatusItems',
        type: 'POST',
        data:{
            itemid: id,
            status: status
        },
        success: function(){
            console.log('Status updated successfully to :', status);
            fetchAllItems(); // Refresh the items after updating the status
            fetchAllItemsPending();
        },
        error: function(xhr, status, error){
            console.error('Error updating status:', error);
        }
    });

}


function fetchAllItemsPending(){
    $.ajax({
        url: 'http://localhost:8080/pendingItems',
        type: 'GET',
        datatype: 'json',
        success: function(data){
            console.log('All items numbers fetched successfully:', data);
            var tbdoy=$('#tbodyItemsPending');
            tbdoy.empty(); // Clear existing rows
            data.forEach(item => {
                console.log("item :",item);
                var row=document.createElement('tr');

                    row.innerHTML=`
                
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div>
                            <img src="${item.image}" class="avatar avatar-sm me-3" alt="user1">
                          </div>
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">${item.name}</h6>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">${item.description}</p>
                     
                      </td>
                      <td class="align-middle text-center text-sm">
                         <span class="text-xs font-weight-bold mb-0">${item.location}</span>
                      </td>
                        <td class="align-middle text-center text-sm">
                         <span class="text-xs font-weight-bold mb-0">${item.datefound}</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="badge badge-sm bg-gradient-warning">${item.status}</span>
                      </td>
                        <td class="align-middle text-center text-sm">
                        <span class="text-xs font-weight-bold mb-0">${item.type}</span>
                      </td>
                        <td class="align-middle text-center text-sm">
                         <span class="text-xs font-weight-bold mb-0">${item.
                        matchedStatus}</span>
                      </td>
                      <td class="align-middle">
                        <button onclick="editStatus(${item.id},'accepted')" class="btn btn-primary" >
                          accept
                        </button>
                         <button onclick="editStatus(${item.id},'rejected')" class="btn btn-secondary" >
                          reject
                        </button>
                      </td>
                `;




                tbdoy.append(row);


            });
        },
        error: function(xhr, status, error){
            console.error('Error fetching allItems');
        }
    });
}
function signout(){
    fetch("logout", { method: "GET" })
        .then(response => {
            if (response.redirected) {
                window.location.href = response.url; // Redirect to login page
            }
        });
}
function deleteUser(id){
    $.ajax({
        url: 'http://localhost:8080/deleteUser',
        type: 'POST',
        data:{
            userId: id
        },
        success: function(data){
            console.log('User deleted successfully to :', data);
        },
        error: function(xhr, status, error){
            console.error('Error deleting user');
        }
    });
}

