(define (problem schedule-meeting-monday-combined)
  (:domain meeting-scheduling-combined)

  (:objects
    kathryn charlotte lauren - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (available kathryn s0930)
    (available kathryn s1000)
    (available kathryn s1100)
    (available kathryn s1200)
    (available kathryn s1230)
    (available kathryn s1300)
    (available kathryn s1430)
    (available kathryn s1500)
    (available kathryn s1530)
    (available kathryn s1600)

    (available charlotte s0900)
    (available charlotte s0930)
    (available charlotte s1000)
    (available charlotte s1030)
    (available charlotte s1100)
    (available charlotte s1130)
    (available charlotte s1230)
    (available charlotte s1300)
    (available charlotte s1330)

    (available lauren s1000)
    (available lauren s1030)
    (available lauren s1100)
    (available lauren s1130)
    (available lauren s1230)
    (available lauren s1300)
    (available lauren s1430)
    (available lauren s1600)
  )

  (:goal (meeting-scheduled))
)