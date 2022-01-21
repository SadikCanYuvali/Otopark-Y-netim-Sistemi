<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin.css">
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
                <a class="nav-link cursor" onclick="parkingLotStatus()">Status of Parking Lot<span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>
</nav>
<div style="display: none; width: 100%; height: 100%" id="parkinLotDiv" class="hide">
    <div class="button-wrapper" style="align-self: center; margin: 0 auto;">
        <div>
            <div class="btn-toolbar justify-content-between btn-toolbar mb-3" role="toolbar"
                 aria-label="Toolbar with button groups">
                <label style="color:white; align-self: center">Bölüm A </label>
                <button id="seca1" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">1
                </button>
                <button id="seca2" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">2
                </button>
                <button id="seca3" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">3
                </button>
                <button id="seca4" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">4
                </button>
                <button id="seca5" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">5
                </button>
                <button id="seca6" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">6
                </button>
                <button id="seca7" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">7
                </button>
                <button id="seca8" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">8
                </button>
                <button id="seca9" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">9
                </button>
                <button id="seca10" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">10
                </button>
            </div>


            <div class="btn-toolbar justify-content-between btn-toolbar mb-3" role="toolbar"
                 aria-label="Toolbar with button groups">
                <label style="color:white; align-self: center">Bölüm B </label>
                <button id="secb1" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">1
                </button>
                <button id="secb2" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">2
                </button>
                <button id="secb3" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">3
                </button>
                <button id="secb4" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">4
                </button>
                <button id="secb5" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">5
                </button>
                <button id="secb6" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">6
                </button>
                <button id="secb7" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">7
                </button>
                <button id="secb8" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">8
                </button>
                <button id="secb9" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">9
                </button>
                <button id="secb10" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">10
                </button>
            </div>


            <div class="btn-toolbar justify-content-between btn-toolbar mb-3" role="toolbar"
                 aria-label="Toolbar with button groups">
                <label style="color:white; align-self: center">Bölüm C </label>
                <button id="secc1" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">1
                </button>
                <button id="secc2" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">2
                </button>
                <button id="secc3" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">3
                </button>
                <button id="secc4" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">4
                </button>
                <button id="secc5" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">5
                </button>
                <button id="secc6" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">6
                </button>
                <button id="secc7" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">7
                </button>
                <button id="secc8" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">8
                </button>
                <button id="secc9" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">9
                </button>
                <button id="secc10" type="button" class="btn btn-secondary button-color" data-toggle="modal"
                        data-target="#exampleModalCenter">10
                </button>
            </div>
        </div>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Ticket</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary"
                                style="width: 120px; background-color: #ff3654; border: 0;" data-toggle="modal"
                                data-target="#exampleModal">Ticket
                        </button>
                        <button type="button" onclick="reOpen()" class="btn btn-secondary" data-dismiss="modal"
                                style="width: 120px;">Free
                        </button>
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="background-color: darkgray;">

                                    <div class="modal-body">
                                        <form id="saveCar" action="#">
                                            <div class="form-group">
                                                <label for="licencePlate" class="col-form-label">Licence Plate:</label>
                                                <input type="text" class="form-control" id="licencePlate">
                                            </div>
                                            <div class="form-group">
                                                <label for="brand" class="col-form-label">Brand:</label>
                                                <input type="text" class="form-control" id="brand">
                                            </div>
                                            <div class="form-group">
                                                <label for="carColor" class="col-form-label">Color:</label>
                                                <input type="text" class="form-control" id="carColor">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        onclick="clearModalClose()" data-dismiss="modal">Close
                                                </button>
                                                <button type="submit" class="btn btn-primary">Confirm</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    var elId = "";
    var checkId = "";
    window.addEventListener("load", function () {
        let a = document.getElementsByTagName("button");

        for (let i = 0; i < a.length; i++) {
            a[i].addEventListener('click', redirect, false);
        }

        function redirect(ev) {
            if (ev.target.id.startsWith("seca") || ev.target.id.startsWith("secb") || ev.target.id.startsWith("secc")) {
                elId = checkId = ev.target.id;
            } else {
                elId = checkId;
            }
        }
    });

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

    function parkingLotStatus() {
        let el = document.getElementById("parkinLotDiv");
        if (el.classList.contains("hide")) {
            el.style.display = "flex";
            el.classList.remove("hide");
            el.classList.add("show");
        } else {
            el.classList.remove("show");
            el.classList.add("hide");
            setTimeout(function () {
                el.style.display = "none";
            }, 1000);
        }
    }

    document.getElementById("saveCar").addEventListener("submit", insertCar);

    function insertCar(event) {
        event.preventDefault();
        debugger;
        if (document.getElementById(elId).style.backgroundColor !== 'rgb(255, 54, 84)') {
            let licencePlate = document.getElementById("licencePlate").value;
            let brand = document.getElementById("brand").value;
            let carColor = document.getElementById("carColor").value;
            let section = elId.split("sec")[1].substring(0, 1);
            let sectionNumber = elId.split("sec")[1].substring(1);

            let param = JSON.stringify({
                "licencePlate": licencePlate,
                "brand": brand,
                "color": carColor,
                "section": section,
                "sectionNumber": sectionNumber
            });

            $.ajax({
                url: "/insertCar",
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                data: param,
                success: function (resp) {
                    if (resp.success) {
                        debugger;
                        alert("Car has been saved");
                        $('#exampleModal').modal('hide');
                        reservation();
                        let div = document.createElement("div");
                        div.innerHTML = licencePlate;
                        document.getElementById(elId).appendChild(div);
                        clearModalClose();
                    } else {
                        alert("This car has been saved already");
                        clearModalClose();
                    }
                }
            });
        } else {
            alert("Lütfen başka bir park alanı seçiniz");
        }
    }

    function reservation() {
        document.getElementById(elId).style.backgroundColor = "#ff3654";
        $('#exampleModalCenter').modal('hide');

    }

    function reOpen() {
        let elem = document.getElementById(elId);
        let licencePlate = document.getElementById(elId).childNodes[1].innerHTML;
        document.getElementById(elId).style.backgroundColor = "#d19d01";
        $('#exampleModalCenter').modal('show');
        elem.removeChild(elem.childNodes[1]);
        $.ajax({
            url: "/removeCar",
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            data: licencePlate,
            success: function (data) {
                alert("Car has been deleted.");
            }, error: function (data) {

            }
        });
    }

    function clearModalClose() {
        $("#licencePlate").val("");
        $("#brand").val("");
        $("#carColor").val("");
    }

</script>

</body>
</html>