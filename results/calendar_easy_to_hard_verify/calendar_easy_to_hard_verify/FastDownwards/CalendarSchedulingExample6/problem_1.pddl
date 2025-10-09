(define (problem meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    thomas dylan jerry - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (free thomas s0900) (free thomas s0930) (free thomas s1000) (free thomas s1030)
    (free thomas s1100) (free thomas s1130) (free thomas s1200) (free thomas s1230)
    (free thomas s1300) (free thomas s1330) (free thomas s1400) (free thomas s1430)
    (free thomas s1500) (free thomas s1530) (free thomas s1600) (free thomas s1630)

    (free dylan s0900) (free dylan s0930) (free dylan s1000)
    (free dylan s1100) (free dylan s1130) (free dylan s1200) (free dylan s1230)
    (free dylan s1300)
    (free dylan s1400) (free dylan s1430) (free dylan s1500) (free dylan s1530) (free dylan s1600) (free dylan s1630)

    (free jerry s1100) (free jerry s1430) (free jerry s1500) (free jerry s1530)

    (slot-allowed s1430)
    (slot-allowed s1500)
  )

  (:goal (and (scheduled)))
)