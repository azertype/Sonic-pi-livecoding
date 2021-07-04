live_loop :melo  do
  
  
  tick_reset_all    #enlever sync
  with_fx :distortion ,distort:0.9  do
    with_fx :flanger ,feedback:0 do
      notes = (scale :gb3 ,:aeolian ,num_octaves:1).shuffle  #d1
      
      with_fx :krush  ,cutoff:130 ,gain:rrand(1,3000)  do   #monté cutoff jusqu a 130 valeur de base 60
        
        n = synth:piano,release:0,attack:4, sustain:0,note:notes.tick ,amp:1
        
        sleep (line ,0.225,0.1,steps:10).tick
        
        control n, note:notes.tick ,amp:3
        
      end
      sleep 0.2
    end
  end
end

live_loop :baya do
  
  with_fx :flanger ,feedback:0 do
    sample :bd_fat ,amp:3 if (spread 7,7).tick
    sync "/live_loop/melo"
  end
end

