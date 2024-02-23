VAR counter_correct=0
VAR perfect=false
VAR mediocre=false
VAR horrible=false

It's your first day working at the smoothie shop. Can you make it through the day without getting fired?  There are customers waiting around, but none of them are lined up in any order. Your coworker who is clocking out says that the boss is in a {~good | bad} mood!

->customers_in_line
 === customers_in_line ===
 
 Which customer's order are you going to take?
  * [Barbara with the Blue Hair]->barbara
  *[Pauley with the Pink Hair]->pauley
  *[Gary with the Green Hair]->Gary
  *[Olivia with the Orange Hair]->Olivia
  *[Ray with the Red Hair]->Ray
  *->broken_blender
  
=barbara
*[Barbara: I want a chocolate banana protein shake please.] Barbara orders her smoothie.
->customers_in_line
=pauley
*[Pauley: I want a Blueberry Bliss please.] Pauley orders his smoothie.
->customers_in_line
=Gary
*[Gary: I want a Strawberry Kiwi Sublime please.] Gary orders his smoothie->customers_in_line
=Olivia
*[Olivia: I want a green juice please.] Olivia orders her smoothie.->customers_in_line
=Ray
*[Ray: I want a Pineapple Mango Magic please.] Ray orders his smoothie.
->customers_in_line

=broken_blender
There are no customers left, so it is time to start making smoothies.
Wow, that was a lot of orders. Why isn't there any paper around here to write things down??? 
You  leave the front of the shop and walk into the kitchen. The kitchen is a mess and the blender isn't working!! Should you try to fix it?
+[Yes]->fixing_blender

=fixing_blender
 {&Smoke starts pouring out of the bottom | The blades spin out of control | The lights start flashing}
    ++{fixing_blender} [Press Button one] You press the first button, hoping it will fix the blender.
    ->fixing_blender
    ++{fixing_blender} [Press Button two] You press the second button, hoping it will fix the blender.
    ->fixing_blender
    ++{fixing_blender} [Press button three] You press the third button, hoping it will fix the blender. It does!!!
    ->kitchen
    
    
=kitchen

*What should you make for Barbara?
    ++[Chocolate Banana Protein Shake] You make Barbara her smoothie and hope you remembered correctly.
         ~counter_correct+=1
         ->kitchen
    ++[Green Juice] You make Barbara her smoothie and hope you remembered correctly.
    ->kitchen
    ++[Pineapple Mango Magic] You make Barbara her smoothie and hope you remembered correctly.
     ->kitchen
    ++[Strawberry Kiwi Sublime] You make Barbara her smoothie and hope you remembered correctly.
     ->kitchen
    ++[Blueberry Bliss] You make Barbara her smoothie and hope you remembered correctly.
     ->kitchen
    
    
*What should you make for Gary?
    ++[Chocolate Banana Protein Shake] You make Gary his smoothie, and hope you remembered correctly.
         ->kitchen
    ++[Green Juice] You make Gary his smoothie and hope you remembered correctly.
    ->kitchen
    ++[Pineapple Mango Magic] You make Gary his smoothie and hope you remembered correctly.
     ->kitchen
    ++[Strawberry Kiwi Sublime] You make Gary his smoothie and hope you remembered correctly.
    ~counter_correct+=1
     ->kitchen
    ++[Blueberry Bliss] You make Gary his smoothie and hope you remembered correctly.
     ->kitchen
     
     
*What should you make for Pauley?
    ++[Chocolate Banana Protein Shake] You make Pauley his smoothie and hope you remembered correctly.
         ->kitchen
    ++[Green Juice] You make Pauley his smoothie and hope you remembered correctly.
    ->kitchen
    ++[Pineapple Mango Magic] You make Pauley his smoothie and hope you remembered correctly.
     ->kitchen
    ++[Strawberry Kiwi Sublime] You make Pauley his smoothie and hope you remembered correctly.
     ->kitchen
    ++[Blueberry Bliss] You make Pauley his smoothie and hope you remembered correctly.
    ~counter_correct+=1
     ->kitchen     
     
*What should you make for Olivia?
    ++[Chocolate Banana Protein Shake] You make Olivia her smoothie and hope you remembered correctly.
         ->kitchen
    ++[Green Juice] You make Olivia her smoothie and hope you remembered correctly.
    ~counter_correct+=1
    ->kitchen
    ++[Pineapple Mango Magic] You make Olivia her smoothie and hope you remembered correctly.
     ->kitchen
    ++[Strawberry Kiwi Sublime] You make Olivia her smoothie and hope you remembered correctly.
     ->kitchen
    ++[Blueberry Bliss] You make Olivia her smoothie and hope you remembered correctly.
     ->kitchen          

*What should you make for Ray?
    ++[Chocolate Banana Protein Shake] You make Ray his smoothie and hope you remembered correctly.
         ->kitchen
    ++[Green Juice] You make Ray his smoothie and hope you remembered correctly.
    ->kitchen
    ++[Pineapple Mango Magic] You make Ray his smoothie and hope you remembered correctly.
     ~counter_correct+=1
     ->kitchen
    ++[Strawberry Kiwi Sublime] You make Ray his smoothie and hope you remembered correctly.
     ->kitchen
    ++[Blueberry Bliss] You make Ray his smoothie and hope you remembered correctly.
     ->kitchen   
*->back_to_the_customers




=back_to_the_customers
Now that you're done making smoothies, you bring them back to the customers.
You hope that you got all of their orders right. Let's see how happy everyone is.
*{counter_correct==5} You got all of the orders correct! Everyone is happy!!
    ~perfect=true
    ->meeting_with_the_boss
*{counter_correct==0} Wow, you got literally every single order wrong.
   ~horrible=true
    ->meeting_with_the_boss
*{counter_correct>0 && counter_correct<5} Some people were happy with their smoothies and others weren't.
    ~mediocre=true
    ->meeting_with_the_boss



==meeting_with_the_boss==
*{horrible} Your boss says that they are dissapointed in you. You've failed the smoothie shop, ruined its reputation, and permamentley ruined the customers' perceptions of fruit for the rest of their lives. Leave your apron and go. ->END
*{mediocre}Your boss says that you did okay, but they might have to fire you.->keep_your_job
*{perfect}
    Your boss says that you've been promoted! You're the best smoothie maker on the east coast!!!
    ->countdown

=keep_your_job
{! Your boss says you have one chance to convince them why you shouldn't be fired | The boss gets angry.Now this is reallyyyyy your last chance to convince them.}
+{keep_your_job} [Promise to practice making smoothies all night!] You say, "I promise that I'll perfect my smoothie craft by tomorrow. Please let me keep this job! Your boss says, "I'll see you tomorrow."
->countdown
*{keep_your_job}[Protest against these accusations, you are a great smoothie maker!] You refuse to accept that you failed. "The customers probably forgot what they ordered", you say.
->keep_your_job

=clean_up_the_shop
    You can go home and you didn't get fired! Congrats on a successful day at the smoothie shop!
    ->END
    
=countdown
{Three seconds left | two seconds left | one second left | 5 pm!}
*{countdown}Hang up your apron.
->countdown
*{countdown} Turn off the lights.
->countdown
*{countdown} Shut down the blenders.
->countdown
*->clean_up_the_shop




 
