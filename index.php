<?php 
    require 'db.php';
    require_once 'inc/header.php';
    // require 'pagination.php';

    // $getUsers = $conn->prepare("SELECT users.name, users.email, events.event_name as eventName FROM `users`,`events`,`attended` WHERE users.id = attended.user_id AND events.id = attended.event_id");
    // $getUsers->execute();
    // $users = $getUsers->fetchAll();
    // $count = $getUsers->rowCount();
    // $a = $count/5;
    // $a = ceil($a);
    
    // echo $a;

    $query = $conn->prepare("SELECT users.name FROM `users`,`events`,`attended` WHERE users.id = attended.user_id AND events.id = attended.event_id");
    $query->execute();
	$rows = $query->rowCount();

	// $rows = $row[0];
	
	$page_rows = 5;

	$last = ceil($rows/$page_rows);

	if($last < 1){
		$last = 1;
	}

	$pagenum = 1;

	if(isset($_GET['pn'])){
		$pagenum = preg_replace('#[^0-9]#', '', $_GET['pn']);
	}

	if ($pagenum < 1) { 
		$pagenum = 1; 
	} 
	else if ($pagenum > $last) { 
		$pagenum = $last; 
	}

	$limit = 'LIMIT ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $pre_query = $conn->prepare("SELECT users.id,users.name, users.email, events.event_name as eventName FROM `users`,`events`,`attended` WHERE users.id = attended.user_id AND events.id = attended.event_id $limit");
    
    $pre_query->execute();

	$users = $pre_query->fetchAll();

	$paginationCtrls = '';

	if($last != 1){
		
	if ($pagenum > 1) {
        $previous = $pagenum - 1;
		$paginationCtrls .= '<a href="'.$_SERVER['PHP_SELF'].'?pn='.$previous.'" class="btn btn-outline-secondary">Previous</a> &nbsp; &nbsp; ';
		
		for($i = $pagenum-4; $i < $pagenum; $i++){
			if($i > 0){
		        $paginationCtrls .= '<a href="'.$_SERVER['PHP_SELF'].'?pn='.$i.'" class="btn btn-outline-secondary">'.$i.'</a> &nbsp; ';
			}
	    }
    }
	
	$paginationCtrls .= ''.$pagenum.' &nbsp; ';
	
	for($i = $pagenum+1; $i <= $last; $i++){
		$paginationCtrls .= '<a href="'.$_SERVER['PHP_SELF'].'?pn='.$i.'" class="btn btn-outline-secondary">'.$i.'</a> &nbsp; ';
		if($i >= $pagenum+4){
			break;
		}
	}

    if ($pagenum != $last) {
        $next = $pagenum + 1;
        $paginationCtrls .= ' &nbsp; &nbsp; <a href="'.$_SERVER['PHP_SELF'].'?pn='.$next.'" class="btn btn-outline-secondary">Next</a> ';
    }
	}



?>

    <div class="row">

        <div class="col-md-6">
            <form action="export.php" method="POST">
                <input type="submit" name="download" value="Export" class="btn btn-primary">
            </form>
        </div>


        <div class="col-md-6">
            <form class="form-horizontal" action="import.php" method="post" name="frmCSVImport" id="frmCSVImport" enctype="multipart/form-data">
                <div class="input-row">
                <input type="file" name="file" id="file" accept=".csv">
                    <button type="submit" id="submit" name="import" class="btn-submit btn btn-primary">Import</button>
                </div>
            </form>
        </div>

    </div>


    <table class="table">
        <thead>
            <th>Sr No</th>
            <th>Name</th>
            <th>Email</th>
            <th>Event Name</th>
        </thead>

        <tbody>
		
            <?php $i = 1; ?>
    
            <?php foreach ($users as $user) : ?>
                    <tr>
                        <td><?php echo $user['id']; ?></td>
                        <td><?php echo $user['name']; ?></td>
                        <td><?php echo $user['email']; ?></td>
                        <td><?php echo $user['eventName']; ?></td>
                    </tr>
            <?php endforeach; ?>

        </tbody>

    </table>

    <div id="pagination_controls"><?php echo $paginationCtrls; ?></div>
	</div>
	<div class="col-lg-2">
	</div>

  


<?php require_once 'inc/footer.php'; ?>

<script src="js/jquery.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        $("#frmCSVImport").on("submit", function () {

            $("#response").attr("class", "");
            $("#response").html("");
            var fileType = ".csv";
            var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(" + fileType + ")$");
            if (!regex.test($("#file").val().toLowerCase())) {
                    $("#response").addClass("error");
                    $("#response").addClass("display-block");
                $("#response").html("Invalid File. Upload : <b>" + fileType + "</b> Files.");
                return false;
            }
            return true;
        });
    });
</script>