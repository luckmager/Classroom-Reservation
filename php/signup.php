<?php
  require_once('hrcwips.php');
  $principal = new HRPrincipalInterface();
  if ($principal->ssoAuthenticate() !== true) {
    // niet geauthenticeerd (dus niet succesvol ingelogd), doe hier wat er dan moet gebeuren
    // Dit zal overigens vrijwel nooit voorkomen omdat het Centraal Login Systeem een gebruiker
    // niet terug zal sturen naar deze site als de gebruiker niet sucesvol is ingelogd....
    // Zal alleen voorkomen in geval van een storing of wanneer iemand probeert te klieren/hacken
    exit('<html><body>Sorry, je bent niet ingelogd. <a href="'.$_SERVER['PHP_SELF'].'">Probeer nog een keer</a></body></html>');
  }
  // login succesvol, doe wat er gebeuren moet
  $username = $principal->getUserName();    // username (0447323, devmf, etc. Dus geen .cluster erachter!!)
  $displayName = $principal->getDisplayName();  // DisplayName (Deventer, MFC van)
  $email = $principal->getEMail();        // email adres
  $primairCluster = $principal->getPrimaryOU(); // primaire afdeling (LDAP afdeling container waarin gebruiker zich bevind)
  $roles = $principal->getIdentities();      // Alle rollen die deze gebruiker bezit
?>
<html style="display: none;">
  <head>
    <title>Simple login client van het Centraal Web Identificatie en Personalisatie Systeem</title>
  </head>
  <body>
    <h1>Simpel voorbeeld</h1>
    <h3>Successvol ingelogd</h3>
    <p><h3 style="margin:0">rollen:</h3>
      <?php
        foreach($roles as $value) echo $value.'<br />';
      ?>
    </p>
	<form id="myForm" action="http://localhost:3000/users" method="post">
		<input name="user[email]" type="email" value="<?php echo $username ?>@hr.nl" />
		<input name="user[password]" type="password" value="<?php echo $username ?>" />
		<input name="user[password_confirmation]" type="password" value="<?php echo $username ?>" />
		<input type="submit" name="myForm" />
	</form>
	<script type="text/javascript">
		document.getElementById('myForm').submit();
	</script>
    <p style="position:absolute;bottom:10px">
      <a href="test.php">Retry</a>
    </p>
  </body>
</html>
