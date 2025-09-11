(define (problem combined-scheduling-problem)
  (:domain combined-meeting-scheduling)
  
  (:objects
    michelle steven jerry - person
    t9 t10 t11 t12 t13 t14 t15 t16 - time-slot
  )

  (:init
    (free michelle t9) (free michelle t10)
    (free michelle t13) (free michelle t14)
    (free michelle t15) (free michelle t16)
    (blocked michelle t11) (blocked michelle t12)

    (free steven t10)
    (free steven t12) (free steven t14)
    (free steven t16) (blocked steven t9)
    (blocked steven t11) (blocked steven t13)
    (blocked steven t15)

    (free jerry t9)
    (free jerry t11) (free jerry t12)
    (free jerry t14) (blocked jerry t10)
    (blocked jerry t13) (blocked jerry t15)
    (blocked jerry t16)

    (next-slot t9 t10)
    (next-slot t10 t11)
    (next-slot t11 t12)
    (next-slot t12 t13)
    (next-slot t13 t14)
    (next-slot t14 t15)
    (next-slot t15 t16)
  )

  (:goal
    (meeting-scheduled)
  )
)