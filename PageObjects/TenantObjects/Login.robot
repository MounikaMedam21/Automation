*** Variables ***
${url}    https://ig-web-channel.qa.iguroo.com/auth/signin
${browser}    Chrome
${loginEmailOrMobile}  //input[@placeholder='Enter Mobile Number or Email']
${loginPassword}       //input[@placeholder='Password']
${signIn_btn}              xpath://button[text()='Sign In']
${sign_header}    //span[@class='ig-heading ig-sign-heading' and contains(text(),'Sign In')]

