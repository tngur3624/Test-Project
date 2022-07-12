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

    <style>
        body {
            padding: 20px;
        }

        button {
            border: none;
            background: none;
        }

        button:hover {
            background: magenta;
        }

        label {
            text-align: right;
            clear: both;
            float: left;
            margin-right: 15px;
        }

        input {
            width: 90%;
            float: right;
            margin-top: 20px;

        }

        label {
            margin-top: 20px;
        }

        textarea {
            width: 90%;
            float: right;
            margin-top: 20px;
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

        #table {
            text-align: center;
            margin-top: 15em;
        }
    </style>


</head>

<body>
    <h1>My To Do List</h1>
    <p> add your to-do list!</p>

    <form>


        <div>
            <label for="title">Title</label>
            <input type="text" id="title" placeholder="Leave a title here">
        </div>


        <div>
            <label for="content">Content</label>
            <textarea id="content" placeholder="Leave a content here"></textarea>
        </div>
    </form>

    <button type="button" class="btn btn-primary" id="add">Plus To-Do</button>
    <button type="button" class="btn btn-danger" id="clear">Clear</button>

    <div class="alert alert-warning" role="alert">
        A simple warning alert—check it out!
    </div>

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
            <tr>
                <th scope="row">1</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>

            </tr>
            <tr>
                <th scope="row">2</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>

            </tr>
            <tr>
                <th scope="row">4</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">6</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">7</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">8</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">9</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">10</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>

    <script>
        var row = 1
        var del = $('<i class="fa-solid fa-trash-can"></i>')










        $("#add").click(function () {
            var title = $("#title").val();
            var content = $("#content").val();

            var currentTime

            var today = new Date();

            var year = today.getFullYear();
            var month = ('0' + (today.getMonth() + 1)).slice(-2);
            var day = ('0' + today.getDate()).slice(-2);

            var hours = ('0' + today.getHours()).slice(-2);
            var minutes = ('0' + today.getMinutes()).slice(-2);
            var seconds = ('0' + today.getSeconds()).slice(-2);


            currentTime = year + '-' + month + '-' + day + " " + hours + ':' + minutes;



            if (title == "") {
                alert("[Title] is required");
            } else if (content == "") {
                alert("[Content] is required");
            } else if (row > 10) {
                alert(" to do list can't be more than 10");
            } else {




                $("tr:eq(" + row + ") td:eq(0)").text(title);
                $("tr:eq(" + row + ") td:eq(1)").text(content);
                $("tr:eq(" + row + ") td:eq(2)").html(currentTime);
                $("tr:eq(" + row + ") td:eq(3)").html('<button class="delete" id="delete' + row + '"><i class="fa-solid fa-trash-can"></i></button>');


                // $('form').each(function () {
                //     this.reset();
                // });



                row++;
            }
        })


        $("#clear").click(function () {
            $("#table td").empty();

            row = 1;
        })




        // $("#table").on("click", "button.delete", function () {
        //     for (var i = 0; i < 10; i++) {
        //         $("#table").on("click", "button.delete#delete"+i, function () {

        //             var nextTitle = $(this).parent().parent().next().children().eq(1).text();
        //             var nextContent = $(this).parent().parent().next().children().eq(2).text();
        //             var nextTime = $(this).parent().parent().next().children().eq(3).text();


        //             $(this).parent().parent().children().eq(1).text(nextTitle);
        //             $(this).parent().parent().children().eq(2).text(nextContent);
        //             $(this).parent().parent().children().eq(3).text(nextTime);

        //             if (nextTitle != "") {
        //                 $(this).parent().parent().children().eq(4).html('<button class="delete" id="delete' + row + '"><i class="fa-solid fa-trash-can"></i></button>');

        //             } else {
        //                 $(this).parent().parent().children().eq(4).empty();
        //             }
        //             i++;
        //         })

        //     }
        // })

        $(document).on("click", "button[class=delete]", function () {

            var str = ""
            var tdArr = new Array();	// 배열 선언
            var checkBtn = $(this);

            var tr = checkBtn.parent().parent();
            var td = tr.children();

            var nextTr = checkBtn.parent().parent().next();
            var nextTd = tr.children();





            console.log("클릭한 Row의 모든 데이터 : " + tr.text());

            var no = td.eq(0).text();
            var title = td.eq(1).text();
            var content = td.eq(2).text();
            var time = td.eq(3).text();


            // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
            td.each(function (i) {
                tdArr.push(td.eq(i).text());
            });

            console.log("배열에 담긴 값 : " + tdArr);

            str += " * 인덱스 = No. : <font color='red'>" + no + "</font>" +
                ", 제목 : <font color='red'>" + title + "</font>" +
                ", 내용 : <font color='red'>" + content + "</font>" +
                ", 시간 : <font color='red'>" + time + "</font>";

            // $("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());
            // $("#ex2_Result2").html(str);






        })






    </script>

</body>

</html>
