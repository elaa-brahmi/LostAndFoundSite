$(document).ready(function(){
    fetchUsersNmbers();
    fetchNbPendingItems();
    fetchNbMatchedItems();
    fetchNbResolvedItems();
    fetchAllUsers();
    fetchAllItems();
});
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
function fetchAllUsers(){  
    $.ajax({
        url: 'http://localhost:8080/allUsers',
        type: 'GET',
        datatype: 'json',
        success: function(data){
            console.log('All users fetched successfully:', data);
            let usersTable = $('#usersTable tbody');
            usersTable.empty(); // Clear existing rows
            $.each(data, function(index, user){
                usersTable.append('<tr><td>' + user.id + '</td><td>' + user.name + '</td><td>' + user.email + '</td></tr>');
            });
        },
        error: function(xhr, status, error){
            console.error('Error fetching all users:', error);
        }

    });
    
}
