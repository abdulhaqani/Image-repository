# README
this repo has all of the code for the portfolio app

The deployed link is below.
https://still-lowlands-26861.herokuapp.com/images

Things you may want to consider:

- This application renders images from image urls. I was going to a implement a server that saves the images with s3, however, in the end I determined that for the purposes of this app image urls should be good enough.
- For the payment system:
  - use card number 4242 4242 4242 4242, any ccv and a date in the future. The api I am using is their test api so there is no real payments (for obvious reasons, not trying to be paying for testing a development application).

- Inventories are updated with each purchase. 

- Only public images can be viewed.

- User functionality and validation was for the most part fully implemented.

- db relationships are mainly done

- Front end is more or less done with some rough spots here and there. (I was under heavy time constraints as I have been occupied with a major family emergency for a little while)

- transactions are saved in the charges model. Fairly simplified model for that one.

- etc
  
I hope you guys like the work I put into this! :)
