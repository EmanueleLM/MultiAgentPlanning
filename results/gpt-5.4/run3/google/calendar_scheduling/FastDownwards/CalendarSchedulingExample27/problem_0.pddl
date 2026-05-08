(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    jesse kathryn megan - participant
    t_0900_0930 t_0930_1000 t_1000_1030 t_1030_1100
    t_1100_1130 t_1130_1200 t_1200_1230 t_1230_1300
    t_1300_1330 t_1330_1400 t_1400_1430 t_1430_1500
    t_1500_1530 t_1530_1600 t_1600_1630 t_1630_1700 - slot
  )

  (:init
    (current_slot t_0900_0930)

    (next_slot t_0900_0930 t_0930_1000)
    (next_slot t_0930_1000 t_1000_1030)
    (next_slot t_1000_1030 t_1030_1100)
    (next_slot t_1030_1100 t_1100_1130)
    (next_slot t_1100_1130 t_1130_1200)
    (next_slot t_1130_1200 t_1200_1230)
    (next_slot t_1200_1230 t_1230_1300)
    (next_slot t_1230_1300 t_1300_1330)
    (next_slot t_1300_1330 t_1330_1400)
    (next_slot t_1330_1400 t_1400_1430)
    (next_slot t_1400_1430 t_1430_1500)
    (next_slot t_1430_1500 t_1500_1530)
    (next_slot t_1500_1530 t_1530_1600)
    (next_slot t_1530_1600 t_1600_1630)
    (next_slot t_1600_1630 t_1630_1700)

    (busy jesse t_1000_1030)
    (busy jesse t_1530_1600)

    (busy megan t_1030_1100)
    (busy megan t_1130_1200)
    (busy megan t_1200_1230)
    (busy megan t_1330_1400)
    (busy megan t_1400_1430)
    (busy megan t_1500_1530)
    (busy megan t_1530_1600)
    (busy megan t_1600_1630)

    (blocked_for_meeting t_1000_1030)
    (blocked_for_meeting t_1030_1100)
    (blocked_for_meeting t_1130_1200)
    (blocked_for_meeting t_1200_1230)
    (blocked_for_meeting t_1330_1400)
    (blocked_for_meeting t_1400_1430)
    (blocked_for_meeting t_1500_1530)
    (blocked_for_meeting t_1530_1600)
    (blocked_for_meeting t_1600_1630)
  )

  (:goal
    (and
      (meeting_scheduled)
      (scheduled t_0900_0930)
    )
  )
)