// random pokemon generated
        $(document).on('turbolinks:load'),function(){
         var pokemon = ["charizard","venusaur","blastiose","jigglypuff","snorlax","mew","eevee","rillaboom","pikachu"];
         const random = Math.floor(Math.random() * pokemon.length);
         var y = pokemon[random];
         var pokemonimage = document.createElement("img");
         pokemonimage.src = y + ".jpg";
         document.body.appendChild(pokemonimage);


         // guess counter
         var guess = 1;

         document.getElementById("submitguess").onclick = function(){

        // pokemon guessed by user
         var x = document.getElementById("guessField").value;

         if(x == y)
         {
            alert("WELL DONE!! The Pokemon was " + y +", you guessed it in "
                      + guess + " attempts! ");
        }
        else
        {
            guess++;
            alert("Not quite! Try again :)")
        }
     }
   });
