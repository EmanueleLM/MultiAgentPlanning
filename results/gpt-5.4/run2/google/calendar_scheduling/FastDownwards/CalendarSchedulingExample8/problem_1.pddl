(define (problem meeting_scheduler_monday_instance_problem)
  (:domain meeting_scheduler_monday_instance)

  (:objects
    s_0900 s_0930 s_1000 s_1030 s_1100 s_1130 s_1200 s_1230
    s_1300 s_1330 s_1400 s_1430 s_1500 s_1530 s_1600 s_1630 - slot
  )

  (:init
    (required adam)
    (required jerry)
    (required matthew)

    (free adam s_0900)
    (free adam s_0930)
    (free adam s_1030)
    (free adam s_1100)
    (free adam s_1130)
    (free adam s_1200)
    (free adam s_1300)
    (free adam s_1430)
    (free adam s_1500)
    (free adam s_1530)
    (free adam s_1600)
    (free adam s_1630)

    (free jerry s_0930)
    (free jerry s_1000)
    (free jerry s_1030)
    (free jerry s_1100)
    (free jerry s_1130)
    (free jerry s_1230)
    (free jerry s_1300)
    (free jerry s_1330)
    (free jerry s_1400)
    (free jerry s_1430)
    (free jerry s_1600)
    (free jerry s_1630)

    (free matthew s_0900)
    (free matthew s_1100)
    (free matthew s_1230)
    (free matthew s_1400)
  )

  (:goal
    (and
      (meeting_scheduled)
      (chosen_start s_1100)
    )
  )
)