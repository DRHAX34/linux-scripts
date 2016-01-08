output="$(xinput)"
ID=""
MASTER=""

if [ $# -eq 1 ]
  then
	IFS='↳' read -r -a array <<< $output
          for line in "${array[@]}"
          do
                if [[ $line == *"AT Translated Set 2 keyboard"* ]]	
                 then
                 IFS=' ' read -r -a outline <<< $line
                 for word in "${outline[@]}"
                 do
                        if [[ $word == "id="* ]]
                         then
                          foo=${word#"id="}
                          ID="$(echo ${foo})"
                        fi
                        if [[ $word == "("* ]]
                         then
                          foo=${word#"("}
                          foo=${foo%")]"}
                          MASTER="$(echo ${foo})"
                        fi
                 done
                fi
          done

  	if [ $1 == --on ]
	 then
	  xinput reattach $ID $MASTER
	  printf "Enabled Internal Keyboard ID: $ID to master: $MASTER\n"
	else
	  if [ $1 == --off ]
	   then
	    xinput float $ID
	    printf "Disabled Internal Keyboard ID: $ID\n";
	  else
	   printf "Invalid Option: $1\n";
	  fi
	fi
  else

  printf "Usage $0 --on/--off\n";

fi
