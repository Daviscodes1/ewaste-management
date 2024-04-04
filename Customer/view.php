<?php include "header.php" ?>
<div class="container">
  <h2>My Bills</h2>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Date</th>
		<th>Quantity</th>
        <th>Amount</th>
      </tr>
    </thead>
    <tbody>
	<?php
	$phone = $_SESSION['name'];
	$stmt = $conn->query("SELECT customer.customerid, customer.phone, bills.quantity, bills.amount, bills.customerid, bills.date 
	FROM customer, bills where customer.phone = '$phone' AND customer.customerid = bills.customerid order by bills.id desc");
	while($row = $stmt->fetch()){
	?>
      <tr>
		<td><?php echo $row['date']; ?></td>
		<td><?php echo $row['quantity']; ?></td>
		<td><?php echo $row['amount']; ?></td>
      </tr>
	<?php } ?>
    </tbody>
  </table>
</div>

<?php include "footer.php" ?>
		
		