(define (problem schedule_meeting_monday_instance_problem)
  (:domain schedule_meeting_monday_instance)

  (:objects
    willie richard noah - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
    meeting1 - meeting
  )

  (:init
    (meeting_unscheduled meeting1)

    (next_slot s0900 s0930)
    (next_slot s0930 s1000)
    (next_slot s1000 s1030)
    (next_slot s1030 s1100)
    (next_slot s1100 s1130)
    (next_slot s1130 s1200)
    (next_slot s1200 s1230)
    (next_slot s1230 s1300)
    (next_slot s1300 s1330)
    (next_slot s1330 s1400)
    (next_slot s1400 s1430)
    (next_slot s1430 s1500)
    (next_slot s1500 s1530)
    (next_slot s1530 s1600)
    (next_slot s1600 s1630)

    (free willie s0900)
    (free willie s0930)
    (free willie s1000)
    (free willie s1030)
    (free willie s1100)
    (free willie s1130)
    (free willie s1200)
    (free willie s1230)
    (free willie s1300)
    (free willie s1330)
    (free willie s1400)
    (free willie s1430)
    (free willie s1500)
    (free willie s1530)
    (free willie s1600)
    (free willie s1630)

    (free richard s0900)
    (free richard s0930)
    (free richard s1030)
    (free richard s1200)
    (free richard s1230)
    (free richard s1400)
    (free richard s1430)
    (free richard s1500)
    (free richard s1530)
    (free richard s1630)

    (free noah s0900)
    (free noah s0930)
    (free noah s1030)
    (free noah s1100)
    (free noah s1300)
    (free noah s1400)
  )

  (:goal
    (and
      (meeting_scheduled meeting1)
    )
  )
)