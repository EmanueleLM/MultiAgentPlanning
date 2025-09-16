(define (problem monday-multiagent)
  (:domain monday-ensemble)
  (:objects slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16
            a2_s9_30 a2_s10_00 a2_s10_30 a2_s11_00 a2_s12_00 a2_s12_30
            a2_s13_00 a2_s14_00 a2_s14_30 a2_s15_00 a2_s16_00 a2_s16_30
            m14_30 m14_45 m15_00 m15_15 - slot)
  (:init
     (free slot9)
     (free slot10)
     (free slot12)
     (free slot13)
     (free slot14)
     (free slot15)
     (free slot16)

     (free a2_s9_30) (free a2_s10_00) (free a2_s10_30)
     (free a2_s11_00) (free a2_s12_00) (free a2_s12_30)
     (free a2_s13_00) (free a2_s14_00) (free a2_s14_30)
     (free a2_s15_00) (free a2_s16_00) (free a2_s16_30)

     (free m14_30) (free m14_45) (free m15_00) (free m15_15)
     ; initial meeting not scheduled is assumed false
  )
  (:goal (meeting_scheduled))
)