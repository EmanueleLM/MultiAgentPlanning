(define (problem orchestrate-monday-meeting)
  (:domain orchestrated-meeting)
  (:objects
    benjamin hannah brenda - person
    m1 - meeting

    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (within-workhours s0900) (within-workhours s0930)
    (within-workhours s1000) (within-workhours s1030)
    (within-workhours s1100) (within-workhours s1130)
    (within-workhours s1200) (within-workhours s1230)
    (within-workhours s1300) (within-workhours s1330)
    (within-workhours s1400) (within-workhours s1430)
    (within-workhours s1500) (within-workhours s1530)
    (within-workhours s1600) (within-workhours s1630)

    (free benjamin s0900) (free benjamin s0930) (free benjamin s1000) (free benjamin s1030)
    (free benjamin s1100) (free benjamin s1130) (free benjamin s1200) (free benjamin s1230)
    (free benjamin s1300) (free benjamin s1330) (free benjamin s1400) (free benjamin s1430)
    (free benjamin s1500) (free benjamin s1530) (free benjamin s1600) (free benjamin s1630)
    (preferred benjamin s0900)

    (free hannah s0900) (free hannah s0930) (free hannah s1000) (free hannah s1030)
    (free hannah s1100) (free hannah s1130) (free hannah s1200) (free hannah s1230)
    (free hannah s1300) (free hannah s1330) (free hannah s1400) (free hannah s1430)
    (free hannah s1500) (free hannah s1530) (free hannah s1600) (free hannah s1630)

    (occupied s0930)
    (occupied s1130) (occupied s1200)
    (occupied s1400) (occupied s1430) (occupied s1500) (occupied s1530) (occupied s1600)

    (free brenda s0900) (free brenda s1000) (free brenda s1030) (free brenda s1100)
    (free brenda s1230) (free brenda s1300) (free brenda s1330) (free brenda s1630)
  )

  (:goal (and
    (scheduled m1 s0900)
    (in-meeting benjamin m1)
    (in-meeting hannah m1)
    (in-meeting brenda m1)
  ))
)