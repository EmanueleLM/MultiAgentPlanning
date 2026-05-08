(define (problem visit_san_francisco)
  (:domain meet_friends)
  (:objects
    marina_district mission_district - location
    stephanie - friend
    t0 t1 t2 t3 t4 t5 t6 t7 t8 - time
  )
  (:init
    (at marina_district t0)

    (friend_at stephanie mission_district t3)
    (friend_at stephanie mission_district t4)
    (friend_at stephanie mission_district t5)
    (friend_at stephanie mission_district t6)
    
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4)
    (next t4 t5) (next t5 t6) (next t6 t7) (next t7 t8)
  )
  (:goal
    (and 
      (met stephanie t4)
      (met stephanie t5)
    )
  )
)