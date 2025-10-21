(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (available margaret s1000)
    (available margaret s1100)
    (available margaret s1200)
    (available margaret s1230)
    (available margaret s1330)
    (available margaret s1400)
    (available margaret s1430)
    (available margaret s1530)
    (available margaret s1600)
    (available margaret s1630)

    (available donna s0900)
    (available donna s0930)
    (available donna s1000)
    (available donna s1030)
    (available donna s1100)
    (available donna s1130)
    (available donna s1200)
    (available donna s1230)
    (available donna s1300)
    (available donna s1330)
    (available donna s1400)
    (available donna s1500)
    (available donna s1530)
    (available donna s1630)

    (available helen s0930)
    (available helen s1130)
    (available helen s1200)
    (available helen s1230)
  )

  (:goal
    (meeting-scheduled)
  )
)