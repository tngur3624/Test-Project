<!DOCTYPE html>
<html lang="en">

<head>

    <title>1차 개별 프로젝트 - 94001592 염수혁</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/TableDnD/1.0.5/jquery.tablednd.min.js"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&display=swap" rel="stylesheet">



    <style>
        * {
            font-family: 'Nanum Gothic', sans-serif;
        }

        body {
            padding: 20px;
        }

        button {
            border: none;
            background: none;
        }

        label {
            text-align: right;
            clear: both;
            float: left;
            margin-top: 20px;
        }

        input {
            width: 85%;
            float: right;
            padding: 5px;
            padding-left: 12px;
            margin-top: 20px;
        }

        textarea {
            width: 85%;
            float: right;
            padding: 5px;
            padding-left: 12px;
            margin-top: 20px;
        }

        td {
            word-break:break-all"
        }

        .btn {
            margin-top: 20px;
        }

        .btn-primary {
            float: left;
            clear: both;
        }

        .btn-danger {
            float: right;
        }

        .btn-close {
            z-index: 100;
        }

        #table {
            text-align: center;
            margin-top: 15em;
        }

        #alert {
            position: absolute;
            top: 50%;
            left: 50%;
            height: 300px;
            width: 400px;
            margin: -150px 0px 0px -200px;
        }
    </style>


</head>

<body>
    <h1>My To Do List</h1>
    <p> add your to-do List!</p>

    <form>


        <div>
            <label for="title">Title</label>
            <input type="text" id="title" placeholder="Leave a title here">
        </div>

        <div id="alert">
        </div>

        <div>
            <label for="content">Content</label>
            <textarea type="html" id="content" placeholder="Leave a content here"></textarea>
        </div>
    </form>

    <button type="button" class="btn btn-primary" id="add">Plus To-Do</button>
    <button type="button" class="btn btn-danger" id="clear">Clear</button>


    <table class="table table-striped" id="table">
        <thead>
            <tr>
                <th scope="col" style="width: 10%;">No</th>
                <th scope="col" style="width: 20%;">Title</th>
                <th scope="col" style="width: 40%;">Content</th>
                <th scope="col" style="width: 20%;">Date of register</th>
                <th scope="col" style="width: 10%;">Delete</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>


    <script>
        var row = 1;


        for (var i = 0; i < 10; i++) {
            $('#table > tbody').append('<tr><th scope="row">' + (i + 1) + '</th><td></td><td></td><td></td><td></td></tr>');
        }


        var alertPlaceholder = document.getElementById('alert');
        var alertTrigger = document.getElementById('add');

        function alert(message, type) {
            var wrapper = document.createElement('div')
            wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible fade show" role="alert">' + message +
                '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

            alertPlaceholder.append(wrapper)
        }


        $(function () {
            $("table").tableDnD();
        })


        $("#table").mousemove(function () {
            var cnt = 1;

            for (var i = 1; i < 11; i++) {
                $("#table tr:eq(" + i + ") th").text(cnt); cnt++;
            }
        })


        $("#add").click(function () {
            var title = $("#title").val();
            var content = $("#content").val().replace(/(\n|\r\n)/g, '<br>'); 

            var currentTime; 
            var today = new Date(); 

            var year = today.getFullYear(); 
            var month = ('0' + (today.getMonth() + 1)).slice(-2); 
            var day = ('0' + today.getDate()).slice(-2); 
            var hours = ('0' + today.getHours()).slice(-2); 
            var minutes = ('0' + today.getMinutes()).slice(-2); 
            
            currentTime = year + '-' + month + '-' + day + " " + hours + ':' + minutes; 
            
            if (title === "") { 
                alert('[Title] is required', 'warning') 
            } else if (content === "") { 
                alert("[Content] is required", 'warning') 
            } else if (row > 10) {
                alert("to-do list can't be more than 10", 'warning')
            } else {
                $("tr:eq(" + row + ") td:eq(0)").text(title);
                $("tr:eq(" + row + ") td:eq(1)").html(content);
                $("tr:eq(" + row + ") td:eq(2)").text(currentTime);
                $("tr:eq(" + row + ") td:eq(3)").html('<button class="delete"><i class="fa-solid fa-trash-can"></i></button>');

                $('form').each(function () {
                    this.reset();
                });
                
                row++;
            }
        })


        $("#clear").click(function () {
            $("#table td").empty();

            row = 1;
        })


        $("#table").on("click", "button.delete", function () {

            var target = $(this).closest("tr");
            target.closest("table").find("tr:last").after(target);

            $("#table tr:eq(10) td").text("");

            var cnt = 1;

            for (var i = 1; i < 11; i++) { $("#table tr:eq(" + i + ") th").text(cnt); cnt++; } row--;
        }) </script>

</body>

</html>
