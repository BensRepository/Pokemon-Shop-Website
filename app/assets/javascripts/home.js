// random pokemon generated
        $( document ).ready(function(){
         var pokemon = ["charizard","venusaur","blastiose","jigglypuff","snorlax","mew","eevee","rillaboom","pikachu"]; //pokemon array
         const random = Math.floor(Math.random() * pokemon.length); //random number generated within the length of pokemon array
         var y = pokemon[random]; //random pokemon made
         var pokemonimage = document.createElement("img");
         pokemonimage.src = y + ".jpg";
         document.body.appendChild(pokemonimage); //displays according pokemon


         // guess counter
         var guess = 1;

         document.getElementById("submitguess").onclick = function(){

        // pokemon guessed by user
         var x = document.getElementById("guessField").value;

         if(x == y) //check if the guess is the random pokemon
         {
            alert("WELL DONE!! The Pokemon was " + y +", you guessed it in "
                      + guess + " attempts! "); // if right displays this message
        }
        else
        {
            guess++;
            alert("Not quite! Try again :)") //if wrong displays this message
        }
     }
   });
