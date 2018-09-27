<?php 

    if (isset($_POST['download'])) 
    {
        require_once 'db.php';
        header('Content-Type: text/csv; charset-utf-8');
        header('Content-Disposition:attachment;filename=data.csv');
        $output = fopen("php://output","w");
        fputcsv($output,array('name','email','event name'));

    
        $getUsers = $conn->prepare("SELECT users.name, users.email, events.event_name as eventName FROM `users`,`events`,`attended` WHERE users.id = attended.user_id AND events.id = attended.event_id");
        $getUsers->execute();

        while ($row = $getUsers->fetch(PDO::FETCH_ASSOC)) 
            {
                fputcsv($output,$row);
            }
       

        fclose($output);
    }
?>