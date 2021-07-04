

#hat="F:/Fango/Desktop/sample pi/Travis Scott Drum Kit/Hats"
hat= :drum_cymbal_closed
#kik="F:/Fango/Desktop/sample pi/Travis Scott Drum Kit/Kick"
kik = :bd_haus
#snare="F:/Fango/Desktop/sample pi/Travis Scott Drum Kit/Snares"
snare= :drum_snare_soft
use_debug false
use_bpm 145
set_volume! 5





in_thread do
  live_loop :bibi do
    density 1 do
      with_fx :ixi_techno ,phase:0.01  ,mix:0, res:0.5 do
        density 1 do#4 do
          8.times do
            sample hat,0
            sleep 0.5
          end
          
          sample hat,0
          sleep 0.125
          sample hat,0
          sleep 0.125
          sample hat,0
          
          sleep 0.25
          sample hat,0
          sleep 0.5
          4.times do
            sample hat,0
            sleep 0.5
          end
          sample hat,0
          sleep 0.125
          sample hat,0
          sleep 0.125
          #sample hat,0
          density ring(1,1,10).tick do
            sleep 0.25
            sample hat,0
            sleep 0.5
          end
        end
      end
    end
  end
end
in_thread do
  live_loop :snar do
    density 1 do
      
      sleep 8
      at 2 do
        sample  snare,1 ,amp:5
      end
      at 6 do
        sample  snare,1,amp:5
      end
      
    end
  end
  in_thread do
    live_loop :kik do
      
      sleep 8
      at 0 do sample kik,0
      end
      at 1.5do sample kik,0
    end
    at 3 do sample kik,0
      
    end
    at 4.5 do sample kik,0
    end
    at 5 do sample kik,0
    end
    at 5,5 do
      density ring(1,2,10).tick do
        with_fx :flanger ,feedback:0.9 ,mix:1 do
          #sample satan ,beat_stretch:8 ,rpitch:-20 ,amp:5 ,finish:0.2
          #sleep 1
        end
      end
    end
  end
end
end
#sample "C:/Users/ji/Desktop/sample assielou",16 ,amp:20

in_thread do
  
  live_loop :melo  do
    #decendre distor 0.8 ,0.5,0.2
    #d3
    #hat mettre effet et density 2
    #krush mix 0
    tick_reset_all    #enlever sync
    with_fx :distortion ,distort:0.9  do
      with_fx :flanger ,feedback:1 ,depth:1 ,wave:2 ,mix:0.3,amp:3 do # wave 1 wave 3
        notes = (scale :d4 ,:aeolian ,num_octaves:2).shuffle  #d1  #gb3
        
        with_fx :krush  ,cutoff:130 ,gain:rrand(1,3000) ,mix:1  do   #toujours la ,monte cutoff jusqu a 130 valeur de base 60
          
          n = synth:piano,release:1,attack:0, sustain:0,note:notes.tick ,amp:5
          
          #sleep (line ,0.225,2,steps:10).tick
          
          #control n, note:notes.tick ,amp:3
          
        end
        sleep 1
      end
    end
  end
end





