precap="F:/Fango/Desktop/sample pi/sociétés precapitalistes_Ferderici.wav"
sombre ="F:/Fango/Desktop/sample pi/SOMBRE.wav"
triste="F:/Fango/Desktop/sample pi/TRISTE.wav"

use_debug false

in_thread do
  sleep 5
  sample precap ,amp:5
end

live_loop :tempo do
  sleep 0.5
  #sleep (line 0.0005 ,2, steps:10).mirror.tick  # de base sleep 0.5   , line  0.001 ,0.5
end

live_loop :sol do
  # sample soleil ,amp:10
  sleep 4
end

live_loop :melo_hollow  do
  tick_reset_all
  use_random_seed 12
  4.times do
    with_fx :flanger ,feedback:0 ,amp:1 ,mix:0 do
      notes = (scale :d2 ,:aeolian ,num_octaves:2)  #d1  #changer octaves 1
      with_fx :tanh ,krunch:10 ,mix:0.1 ,amp:1 do
        n = synth   :hollow ,release:2,attack:0, sustain:0.3,note:notes.choose ,amp:2 ,norm:0 , decay_level:0  ##jouer avec norme
        #c= synth     :chiplead ,release:1,attack:1, sustain:0.5,note:notes.choose ,amp:0.1 ,norm:0 , decay_level:0  #decendre attack a 0
        
        sync   "/live_loop/tempo"
        #control n, note:notes.look ,amp:1
        #control c, note:notes.look ,amp:0.5 # a metre quand on est en d2
        
      end
    end
  end
end

live_loop :bibi do
  tick
  with_fx :flanger ,feedback:1 ,depth:10 ,phase:10  ,mix:0 do
    use_random_seed 200
    8.times do
      with_fx :flanger ,feedback:0 ,depth:0 do
        #  sample  :loop_electric  ,onset:tick ,rpitch:-5 ,amp:3 if one_in(2)
        # sample triste if one_in (4)
        # sample travaille if one_in(10)
        sleep 0.1
      end
      sync "/live_loop/tempo"
      #sample sombre ,amp:5 if one_in(4)
      #sample  :bd_tek ,amp:2 ,rpitch:rrand(-15,10)
      #sample  :drum_tom_lo_soft ,rate:1 ,rate:1 ,rpitch:rrand(-50,10),amp:5 if (spread 2,5).look  #spread 25  #jouer avec rpitch 00 ,-10 ,10    -50 ,100
      #sample :bd_haus ,rate:0.1 ,compress:1 ,rpitch:3 ,amp:5 if (spread 2,5).look  # r pitch -15
      
      # sleep 2 #avec mettre avec flanger mix 0.3 sans drum lo
    end
  end
end











