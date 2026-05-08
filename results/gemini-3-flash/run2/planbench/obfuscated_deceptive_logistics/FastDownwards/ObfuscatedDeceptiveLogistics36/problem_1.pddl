(define (problem obfuscated_deceptive_logistics_36_prob)
  (:domain obfuscated_deceptive_logistics_36)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 object_14
    object_15 object_16
  )
  (:init
    ;; Vehicle Types
    (cats object_0)
    (sneeze object_3)
    (sneeze object_4)
    
    ;; Package Types
    (hand object_11)
    (hand object_12)
    (hand object_13)
    (hand object_14)
    (hand object_15)
    (hand object_16)

    ;; Location and Region Information
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (texture object_10)
    
    (spring object_5)
    (spring object_8)
    
    (stupendous object_1)
    (stupendous object_2)
    
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)
    (collect object_10 object_2)

    ;; Initial Positions
    (next object_0 object_8)   ;; Cats veh 0 at loc 8
    (next object_3 object_7)   ;; Sneeze veh 3 at loc 7
    (next object_4 object_8)   ;; Sneeze veh 4 at loc 8
    
    (next object_11 object_9)  ;; Pkg 11 at loc 9
    (next object_12 object_7)  ;; Pkg 12 at loc 7
    (next object_13 object_7)  ;; Pkg 13 at loc 7
    (next object_14 object_7)  ;; Pkg 14 at loc 7
    (next object_15 object_10) ;; Pkg 15 at loc 10
    (next object_16 object_9)  ;; Pkg 16 at loc 9
  )
  (:goal
    (and
      (next object_11 object_5)
      (next object_12 object_8)
      (next object_13 object_8)
      (next object_14 object_7)
      (next object_15 object_10)
      (next object_16 object_8)
    )
  )
)