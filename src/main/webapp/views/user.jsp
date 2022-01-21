<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Panel</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/user.css">
</head>
<body>
<nav class="navbar navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
            aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    WELCOME ${userName}
    <a class="navbar-brand cursor" onclick="logout()">LOGOUT</a>

    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="nav-link cursor" data-toggle="modal" data-target="#exampleModalCenter">Ticket Information<span
                        class="sr-only">(current)</span></a>
            </li>
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Ticket Information</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form id="ticketLicencePlate" action="#">
                            <div class="form-group" style="margin-left: 1rem; margin-right: 1rem; display: flex;">
                                <label for="licencePlate" class="col-form-label">Licence Plate:</label>
                                <input type="text" class="form-control" id="licencePlate"
                                       style="width: 50% ;margin-left: 1rem;">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                            <div style="margin-left: 1rem; margin-right: 1rem; display: flex; margin-bottom: 1rem;">
                                <label for="totalCost" class="col-form-label">Total cost:</label>
                                <input type="text" class="form-control" id="totalCost"
                                       style="width: 50% ;margin-left: 1rem;">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </ul>
    </div>
</nav>

<script>

    function logout() {
        $.ajax({
            url: "/logout",
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            data: "",
            success: function (data) {
                window.location.href = "/dashboard";
            }, error: function (data) {
                console.log("System error: " + data);
            }
        });
    }

    document.getElementById("ticketLicencePlate").addEventListener("submit", ticketInfo);

    function ticketInfo() {
        debugger;
        let licencePlate = document.getElementById("licencePlate").value;

        $.ajax({
            url: "/searchTicketByLicencePlate",
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            data: licencePlate,
            success: function (resp) {
                if (resp.success) {
                    $("#totalCost").val(resp.data + " TL");
                } else {
                    $("#totalCost").val(licencePlate + " plakaya ait bilet bulunamadı");
                }
            }
        });
    }

</script>

</body>
</html>