<div class="cadre">
    <h1 class="contact"> Contact </h1>

    <table class="contact">
        <tr>
            <td> 
                <img src="images/mail.png" alt="mail">
            </td>
            <td>
                <a href={{Contact.getLinkedin()}}><img src="images/linkedin.png" alt="linkedin"></a>
            </td>
            <td> 
                <img src="images/phone.png" alt="phone">
            </td>
        </tr>
        <tr>
            <td> 
                <p> {{Contact.getEmail}} </p>
            </td>
            <td>
                <p>LinkedIn</p>
            </td>
            <td> 
                <p> {{Contact.getTelephone()}} </p>
            </td>
        </tr>
    </table>
</div>