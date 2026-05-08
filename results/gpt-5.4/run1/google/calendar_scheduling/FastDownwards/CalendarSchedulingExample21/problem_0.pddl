(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    bobby scott kimberly - participant
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230
    t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - slot
  )

  (:init
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

    (meeting_start_option t_0900)
    (meeting_start_option t_0930)
    (meeting_start_option t_1000)
    (meeting_start_option t_1030)
    (meeting_start_option t_1100)
    (meeting_start_option t_1130)
    (meeting_start_option t_1200)
    (meeting_start_option t_1230)
    (meeting_start_option t_1300)
    (meeting_start_option t_1330)
    (meeting_start_option t_1400)
    (meeting_start_option t_1430)
    (meeting_start_option t_1500)
    (meeting_start_option t_1530)
    (meeting_start_option t_1600)

    (busy scott t_1130)
    (busy scott t_1530)

    (busy kimberly t_1100)
    (busy kimberly t_1130)
    (busy kimberly t_1230)
    (busy kimberly t_1330)
    (busy kimberly t_1430)
    (busy kimberly t_1530)
    (busy kimberly t_1600)
    (busy kimberly t_1630)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)