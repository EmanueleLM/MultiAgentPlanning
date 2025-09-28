(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    start0 start1 start2 start3 start4 start5 start6 start7 start8 start9 start10 start11 start12 start13 start14 start15 - start
    alan nancy patricia - person
  )
  (:init
    (available alan start11)
    (available alan start12)
    (available alan start13)
    (available alan start14)
    (available alan start15)

    (available nancy start0)
    (available nancy start1)
    (available nancy start2)
    (available nancy start3)
    (available nancy start7)
    (available nancy start9)
    (available nancy start12)
    (available nancy start13)
    (available nancy start14)
    (available nancy start15)

    (available patricia start0)
    (available patricia start1)
    (available patricia start6)
    (available patricia start8)
    (available patricia start14)
    (available patricia start15)

    (all-available start14)
    (all-available start15)
  )
  (:goal (and (scheduled start14)))
)