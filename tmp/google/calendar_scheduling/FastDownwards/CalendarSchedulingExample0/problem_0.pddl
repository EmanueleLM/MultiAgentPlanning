(define (problem monday-multiagent)
  (:domain monday-ensemble)
  (:init
     ; Agent 1: 9:00-17:00 with 11:00-12:00 busy
     (free slot9)    ; 9:00-10:00 free
     (free slot10)   ; 10:00-11:00 free
     (not (free slot11)) ; 11:00-12:00 busy
     (free slot12)   ; 12:00-13:00 free
     (free slot13)   ; 13:00-14:00 free
     (free slot14)   ; 14:00-15:00 free
     (free slot15)   ; 15:00-16:00 free
     (free slot16)   ; 16:00-17:00 free

     ; Agent 2: given 15-min granularity tokens (all claimed free initially)
     (free a2_s9_30)   (free a2_s10_00)  (free a2_s10_30)
     (free a2_s11_00)   (free a2_s12_00)  (free a2_s12_30)
     (free a2_s13_00)   (free a2_s14_00)  (free a2_s14_30)
     (free a2_s15_00)   (free a2_s16_00)  (free a2_s16_30)

     ; Agent 3: four 15-min tokens covering 14:30-15:30
     (free m14_30) (free m14_45) (free m15_00) (free m15_15)

     ; Optional: mark 11:00-12:00 as not free explicitly if needed by downstream planners
     ; (not (free slot11)) ; already stated above
  )
  (:goal (meeting-scheduled))
)