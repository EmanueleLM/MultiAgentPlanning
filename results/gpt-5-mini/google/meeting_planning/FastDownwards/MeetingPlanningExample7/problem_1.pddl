(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    john alice bob - person
    office cafe1 cafe2 park - location
    s1 s2 s3 s4 s5 s6 s7 s8 - slot
  )

  (:init
    (slot-next s1 s2)
    (slot-next s2 s3)
    (slot-next s3 s4)
    (slot-next s4 s5)
    (slot-next s5 s6)
    (slot-next s6 s7)
    (slot-next s7 s8)

    (at john office s1)

    (available alice s3)
    (available alice s4)
    (available alice s5)
    (at alice cafe1 s3)
    (at alice cafe1 s4)
    (at alice cafe1 s5)

    (available bob s4)
    (available bob s5)
    (available bob s6)
    (at bob cafe2 s4)
    (at bob cafe2 s5)
    (at bob cafe2 s6)

    (available john s2)
    (available john s3)
    (available john s4)
    (available john s5)
    (available john s6)
    (available john s7)

    (duration1 office cafe1)
    (duration1 cafe1 office)
    (duration2 office cafe2)
    (duration2 cafe2 office)
    (duration1 cafe1 park)
    (duration1 park cafe1)
    (duration1 cafe2 park)
    (duration1 park cafe2)
  )

  (:goal (and
    (met alice)
    (met bob)
    (at john office s8)
  ))
)