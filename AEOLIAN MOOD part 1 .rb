#by azertype 
#IG azertype_ 
#soudcloud & youtube: azertype

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
  live_loop :melo1 do
    with_fx :ping_pong ,phase:0.8  ,mix:1  do
      with_fx :flanger  ,feedback:0 ,mix:1,wave:0 do
        # divisor 0 ,0.1 jusque 1  ,ab2,ab4 divisor 100 ,divisor 1000 puis hat
        synth    :fm,note:(scale :ab4,:aeolian).tick ,release:8  ,detune:-0 ,amp:1 ,divisor:0,depth:100 ,cutoff:100 if (spread 3,7).tick  # divisor 0 ,0.1 jusque 1  fnir a 100
        sleep 2
      end
    end
  end
end


in_thread do
  live_loop :bibi do
    stop
    density 1 do
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
    end
    with_fx :ixi_techno ,phase:0.01 do
      sample hat,0
      sleep 0.125
      sample hat,0
      sleep 0.125
      sample hat,0
      density ring(1,1,10).tick do
        sleep 0.25
        sample hat,0
        sleep 0.5
      end
    end
  end
end

in_thread do
  live_loop :snar do
    stop
    density 1 do
      sleep 8
      at 2 do
        sample  snare,1 ,amp:3
      end
      at 6 do
        sample  snare,1,amp:3
      end
    end
  end
  
  in_thread do
    live_loop :kik do
      stop
      density 1 do
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
        density ring(1).tick do
          with_fx :flanger ,feedback:0.9 do
            #sample satan ,beat_stretch:8 ,rpitch:-20 ,amp:5 ,finish:0.2
            sleep 1
          end
        end
      end
    end
  end
end
end

