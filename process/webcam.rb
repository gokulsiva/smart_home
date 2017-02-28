system "cvlc v4l2:///dev/video0 :v4l2-standard= :live-caching=300 :sout='#transcode{vcodec=theo,vb=800,acodec=vorb,ab=128,channels=2,samplerate=44100}:http{dst=:8080/webcam.ogg}' :sout-keep"
