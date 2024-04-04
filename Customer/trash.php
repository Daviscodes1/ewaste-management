<?php include "header.php" ?>

<div class="card" style="width: 18rem;">
	  <div class="card-body">
		<h3 class="card-title">Total Regions</h3>
		<p class="card-text">
		<?php
			$stmt = $conn->prepare('SELECT * FROM region');
			$stmt->execute();
			$regionCount = $stmt->rowCount();
			echo $regionCount;
		?>
		</p>
	  </div>
	</div>

    <div class="container">
	<div class="d-inline">
		<button class="btn btn-info btn-lg" data-toggle="modal" data-target="#Add"> 
			New Region 
		</button>
	</div>
  <h2>List of Regions</h2>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Region Name</th>
        <th>phone</th>
		<th>status</th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
<div class="modal fade" id="Add" role="dialog">
	<div class="modal-dialog">

	  <!-- Modal content-->
	  <div class="modal-content">
		<div class="modal-header">
		<h3>Add Region:</h3>
		  <button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		<div class="modal-body">
		<form action="action.php" method="POST">
				<input type="hidden" name="user" value="<?php echo $_SESSION['name']; ?>">
				  <div class="form-group">
					<label for="exampleFormControlInput1">Region Name:</label>
					<input type="text" class="form-control" id="region" name="region" placeholder="Region Name" required>
				 </div>
				<button type="submit" name="submit" class="btn btn-success" value="addregion" >Add</button>			  
			</form>
		</div>
		<div class="modal-footer">
		<div class="alert alert-warning" role="alert" align="left">
			<b>Confirm Before You Submit</b>
		</div>
		</div>
	  </div>
	</div>
</div>
    

<?php include "footer.php" ?>
