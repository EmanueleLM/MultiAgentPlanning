(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    slot-0 slot-1 slot-2 slot-3 slot-4 slot-5 slot-6 slot-7
    slot-8 slot-9 slot-10 slot-11 slot-12 slot-13 slot-14 slot-15 - slot

    alan michael michelle roy judy natalie brian - participant
  )

  (:init
    (free alan slot-1)
    (free alan slot-3)
    (free alan slot-7)
    (free alan slot-8)
    (free alan slot-9)
    (free alan slot-11)
    (free alan slot-12)
    (free alan slot-13)
    (free alan slot-14)
    (free alan slot-15)

    (free michael slot-0) (free michael slot-1) (free michael slot-2) (free michael slot-3)
    (free michael slot-4) (free michael slot-5) (free michael slot-6) (free michael slot-7)
    (free michael slot-8) (free michael slot-9) (free michael slot-10) (free michael slot-11)
    (free michael slot-12) (free michael slot-13) (free michael slot-14) (free michael slot-15)

    (free michelle slot-0) (free michelle slot-1) (free michelle slot-2) (free michelle slot-3)
    (free michelle slot-4) (free michelle slot-5) (free michelle slot-6) (free michelle slot-7)
    (free michelle slot-8) (free michelle slot-9) (free michelle slot-10) (free michelle slot-11)
    (free michelle slot-12) (free michelle slot-13) (free michelle slot-14) (free michelle slot-15)

    (free roy slot-0)
    (free roy slot-2)
    (free roy slot-3)
    (free roy slot-4)
    (free roy slot-5)
    (free roy slot-6)
    (free roy slot-8)
    (free roy slot-11)
    (free roy slot-12)
    (free roy slot-13)
    (free roy slot-14)
    (free roy slot-15)

    (free judy slot-3)
    (free judy slot-13)

    (free natalie slot-1)
    (free natalie slot-2)
    (free natalie slot-3)
    (free natalie slot-7)

    (free brian slot-0)
    (free brian slot-3)
    (free brian slot-6)
    (free brian slot-7)
    (free brian slot-8)
    (free brian slot-10)
    (free brian slot-12)
    (free brian slot-14)
  )

  (:goal (scheduled))

  (:action-costs
    ((schedule slot-0) 0)
    ((schedule slot-1) 1)
    ((schedule slot-2) 2)
    ((schedule slot-3) 3)
    ((schedule slot-4) 4)
    ((schedule slot-5) 5)
    ((schedule slot-6) 6)
    ((schedule slot-7) 7)
    ((schedule slot-8) 8)
    ((schedule slot-9) 9)
    ((schedule slot-10) 10)
    ((schedule slot-11) 11)
    ((schedule slot-12) 12)
    ((schedule slot-13) 13)
    ((schedule slot-14) 14)
    ((schedule slot-15) 15)
  )
)