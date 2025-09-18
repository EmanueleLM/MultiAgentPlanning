(define (problem integrated-meet-betty)
  (:domain integrated-travelers)
  (:objects
    traveler betty - person
    marina richmond - location
    t540 t1230 t1305 t1320 - time
  )
  (:init
    (at traveler marina)
    (at betty richmond)
    (now t540)
    (leq t540 t1230)
    (leq t1230 t1305)
    (leq t1305 t1320)
    (can_meet t1230 t1305)
  )
  (:goal (met-betty))
)