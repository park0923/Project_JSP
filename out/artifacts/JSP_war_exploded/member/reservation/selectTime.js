function categoryChange(e) {
    var endTime_0 = ["시작 시간을 선택하세요"];
    var endTime_1 = ["10:00", "11:00", "12:00", "13:00" ,"14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_2 = ["11:00", "12:00", "13:00" ,"14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_3 = ["12:00", "13:00" ,"14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_4 = ["13:00" ,"14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_5 = ["14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_6 = ["15:00","16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_7 = ["16:00","17:00","18:00","19:00","20:00","21:00"];
    var endTime_8 = ["17:00","18:00","19:00","20:00","21:00"];
    var endTime_9 = ["18:00","19:00","20:00","21:00"];
    var endTime_10 = ["19:00","20:00","21:00"];
    var endTime_11 = ["20:00","21:00"];
    var target = document.getElementById("changeTime");
    var room = document.getElementById("Room");

    if(e.value == "0") {
        var d = endTime_0;
        room.removeAttribute("disabled");
    }
    else if(e.value == "9:00") {
        var d = endTime_1;
        room.removeAttribute("disabled");
    }
    else if(e.value == "10:00") {
        var d = endTime_2;
        room.removeAttribute("disabled");
    }
    else if(e.value == "11:00") {
        var d = endTime_3;
        room.removeAttribute("disabled");
    }
    else if(e.value == "12:00") {
        var d = endTime_4;
        room.removeAttribute("disabled");
    }
    else if(e.value == "13:00") {
        var d = endTime_5;
        room.removeAttribute("disabled");
    }
    else if(e.value == "14:00") {
        var d = endTime_6;
        room.removeAttribute("disabled");
    }
    else if(e.value == "15:00") {
        var d = endTime_7;
        room.removeAttribute("disabled");
    }
    else if(e.value == "16:00") {
        var d = endTime_8;
        room.removeAttribute("disabled");
    }
    else if(e.value == "17:00") {
        var d = endTime_9;
        room.disabled = true;
        alert("강의실을 선택할 수 없고 자동배정 될 예정입니다.");
    }
    else if(e.value == "18:00") {
        var d = endTime_10;
        room.disabled = true;
        alert("강의실을 선택할 수 없고 자동배정 될 예정입니다.");
    }
    else if(e.value == "19:00") {
        var d = endTime_11;
        room.disabled = true;
        alert("강의실을 선택할 수 없고 자동배정 될 예정입니다.");
    }

    target.options.length = 0;

    for (x in d) {
        var opt = document.createElement("option");
        opt.name = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }
}

function disabledRoom(e){
    var room = document.getElementById("Room");
    var endValue = Number(e.value.substr(0,2));
    console.log(endValue);
    if(endValue>=18){
        room.disabled = true;
        room.value="강의실 선택";
        alert("강의실을 선택할 수 없습니다.");
    }
}