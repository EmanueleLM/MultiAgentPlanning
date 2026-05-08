(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230
    t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - slot
  )

  (:init
    (unscheduled)

    (next_slot t_0900 t_0930)
    (next_slot t_0930 t_1000)
    (next_slot t_1000 t_1030)
    (next_slot t_1030 t_1100)
    (next_slot t_1100 t_1130)
    (next_slot t_1130 t_1200)
    (next_slot t_1200 t_1230)
    (next_slot t_1230 t_1300)
    (next_slot t_1300 t_1330)
    (next_slot t_1330 t_1400)
    (next_slot t_1400 t_1430)
    (next_slot t_1430 t_1500)
    (next_slot t_1500 t_1530)
    (next_slot t_1530 t_1600)
    (next_slot t_1600 t_1630)

    (candidate_start t_0900)
    (candidate_start t_0930)
    (candidate_start t_1000)
    (candidate_start t_1030)
    (candidate_start t_1100)
    (candidate_start t_1130)
    (candidate_start t_1200)
    (candidate_start t_1230)
    (candidate_start t_1300)
    (candidate_start t_1330)
    (candidate_start t_1400)
    (candidate_start t_1430)
    (candidate_start t_1500)
    (candidate_start t_1530)
    (candidate_start t_1600)

    (busy arthur t_0900)
    (busy arthur t_1030)
    (busy arthur t_1100)
    (busy arthur t_1130)
    (busy arthur t_1600)
    (busy arthur t_1630)

    (busy michael t_1300)
    (busy michael t_1400)

    (busy samantha t_1030)
    (busy samantha t_1200)
    (busy samantha t_1230)
    (busy samantha t_1300)
    (busy samantha t_1330)
    (busy samantha t_1400)
    (busy samantha t_1430)
    (busy samantha t_1530)
    (busy samantha t_1600)
    (busy samantha t_1630)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)