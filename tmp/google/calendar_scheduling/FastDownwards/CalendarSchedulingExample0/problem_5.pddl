(define (problem monday-ensemble-problem)
  (:domain monday-ensemble)
  (:objects slot9_10 slot10_11 slot11_12 slot12_13 slot13_14 slot14_15 slot15_16 slot16_17 - slot)
  (:init
     (free michelle slot9_10)
     (free michelle slot10_11)

     (free michelle slot12_13)
     (free michelle slot13_14)
     (free michelle slot14_15)
     (free michelle slot15_16)
     (free michelle slot16_17)

     (free steven slot10_11)
     (free steven slot12_13)
     (free steven slot14_15)
     (free steven slot16_17)

     (free jerry slot12_13)
     (free jerry slot14_15)
  )
  (:goal (meeting_scheduled))
)