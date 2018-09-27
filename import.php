<?php 
require 'db.php';

if (isset($_POST["import"])) {
    
    $fileName = $_FILES["file"]["tmp_name"];
    
    if ($_FILES["file"]["size"] > 0) {
        
        $file = fopen($fileName, "r");
        $flag = true;
        
        while (($column = fgetcsv($file, 10000, ",")) !== FALSE) {

            if($flag) { $flag = false; continue; }
            $name = $column[0];
            $email = $column[1];
            $event_name = $column[2];

            $users = $conn->prepare("INSERT IGNORE into users (name,email) values ('$name','$email')");

            $usersInsert = $users->execute();

            if($event_name != '')
            {
                $events = $conn->prepare("INSERT IGNORE into events (event_name) values ('$event_name')");

               $eventsInsert = $events->execute();
            }


            if($usersInsert AND $eventsInsert)
            {
                $final = $conn->prepare("INSERT IGNORE INTO attended (user_id,event_id) SELECT users.id ,events.id FROM users,events WHERE users.name='$name' AND events.event_name='$event_name'");

                $final->execute();
            }

            

            // $query = $conn->prepare("INSERT INTO attended (user_id) SELECT users.id FROM users WHERE name='$name'");

            // $query->execute();

            // $query2 = $conn->prepare("INSERT INTO attended (event_id) SELECT events.id FROM events WHERE event_name='$event_name'");

            // $query2->execute();

            // $data = $query->fetchAll();

            // $final = $conn->prepare("INSERT INTO attended (user_id,event_id) SELECT users.id ,events.id FROM users,events WHERE users.name='$name' AND events.name='$event_name'");

            // $final->execute();

            // $attended = $conn->prepare("SELECT id FROM users WHERE name='$name'");

            // $attended->execute();

            // $data = $attended->fetchAll();

            // foreach($data as $id)
            // {
            //     echo $user_id = $id['id']."<br>";

            //     // $user_id_query = $conn->prepare("INSERT INTO attended VALUES ($user_id)");

            //     // $user_id_query->execute();
            // }

            // $attended_event = $conn->prepare("SELECT id FROM events WHERE event_name='$event_name'");

            // $attended_event->execute();

            // $event_data = $attended_event->fetchAll();

            // foreach ($event_data as $id)
            // {
            //     echo $event_id = $id['id']."<br>";

            //     // $event_id_query = $conn->prepare("INSERT INTO attended VALUES ($event_id)");

            //     // $event_id->execute();

            // }

            // if($flag) { $flag = false; continue; }

            // $sqlInsert = $conn->prepare("INSERT IGNORE into users (name,email,event_name)
            //        values ('$name','$email','$event_name')");
            
            // $result = $sqlInsert->execute();
            
            // if (! empty($result)) {
            //     $type = "success";
            //     $message = "CSV Data Imported into the Database";
            // } else {
            //     $type = "error";
            //     $message = "Problem in Importing CSV Data";
            // }
        }
    }
}




?>