/*--JS for DOM Parser--*/

var xmlDoc
var xmlFile ='tenant.xml'

//function to load xml doc
function loadXML()
{
    var xmlReq = new XMLHttpRequest;
    xmlReq.onreadystatechange = function()
    {
        console.log(xmlReq.readyState)
        if((xmlReq.readyState == 4) && (xmlReq.status == 200))
        {
            //xml doc successfully retrieved
            console.log(xmlReq.readyState)

            xmlDoc = xmlReq.responseXML
            displayTable()
        }
    }
    xmlReq.open('GET',xmlFile, true)
    xmlReq.send()
}

//function to display html table from xml data
function displayTable()
{
    var i;
    var table = "<tr><th>NAME</th><th>AGE</th><th>NO_MEMBER</th><th>PHONENUM</th></tr>"

    var x = xmlDoc.getElementsByTagName("Tenant")
    for (i = 0; i < x.length; i++)
    {
        table += "<tr><td>" +
            x[i].getElementsByTagName("Name")[0].childNodes[0].nodeValue + "</td><td>" +
            x[i].getElementsByTagName("Age")[0].childNodes[0].nodeValue + "</td><td>" +
            x[i].getElementsByTagName("NO_MEMBER")[0].childNodes[0].nodeValue + "</td><td>" +
            x[i].getElementsByTagName("Phonenum")[0].childNodes[0].nodeValue + "</td><td>" +
            "<td><span class='material-icons' onclick='deleteRecord(" +i+ ")'>delete</span></td></tr>";
    }
    document.getElementById("table").innerHTML = table
}

//function to delete record from XML
function deleteRecord(i)
{
    y = xmlDoc.getElementsByTagName("Tenant")[i]
    var name = y.getElementsByTagName("Name")[0].childNodes[0].nodeValue
    var reply = confirm("delete record? \nName: " + name)
    if(reply == true)
    {
        xmlDoc.documentElement.removeChild(y)
        console.log("Record deleted: " + name)
        displayTable()
    }
}

//function to open form to add new record to xml
function openForm()
{
    document.getElementById("addRecordForm").style.display = "block"
}

//function to close form to add new record to xml
function closeForm()
{
    document.getElementById("addRecordForm").style.display = "none"
}

//function to add new record to xml
function addNewRecord()
{
    var i
    var doc = []
    var x = document.getElementById("addRecordForm")
    Tenant = xmlDoc.createElement("Tenant")
    doc[0] = xmlDoc.createElement("Name")
    doc[1] = xmlDoc.createElement("Age")
    doc[2] = xmlDoc.createElement("NO_MEMBER")
    doc[3] = xmlDoc.createElement("Phonenum")
    

    for(i = 0; i < 4; i++)
    {
        doc[i].appendChild(xmlDoc.createTextNode(x.elements[i].value))
        Tenant.appendChild(doc[i])
    }
    xmlDoc.documentElement.appendChild(Tenant);
    console.log("Record added: " + x.elements[0].value)
    displayTable()
}