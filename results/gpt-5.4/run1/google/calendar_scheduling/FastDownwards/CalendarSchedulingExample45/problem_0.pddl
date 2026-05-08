(define (problem monday_meeting_scheduling_instance_problem)
  (:domain monday_meeting_scheduling_instance)

  (:objects
    andrew grace samuel - participant
    meeting_1 - meeting
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230
    t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - timeslot
  )

  (:init
    (meeting_pending meeting_1)
    (current_slot t_0900)

    (participant_required meeting_1 andrew)
    (participant_required meeting_1 grace)
    (participant_required meeting_1 samuel)

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

    (free andrew t_0900)
    (free andrew t_0930)
    (free andrew t_1000)
    (free andrew t_1030)
    (free andrew t_1100)
    (free andrew t_1130)
    (free andrew t_1200)
    (free andrew t_1230)
    (free andrew t_1300)
    (free andrew t_1330)
    (free andrew t_1400)
    (free andrew t_1430)
    (free andrew t_1500)
    (free andrew t_1530)
    (free andrew t_1600)
    (free andrew t_1630)

    (free grace t_0900)
    (free grace t_0930)
    (free grace t_1000)
    (free grace t_1030)
    (free grace t_1100)
    (free grace t_1130)
    (free grace t_1200)
    (free grace t_1230)
    (free grace t_1300)
    (free grace t_1330)
    (free grace t_1400)
    (free grace t_1430)
    (free grace t_1500)
    (free grace t_1530)
    (free grace t_1600)
    (free grace t_1630)

    (free samuel t_1030)
    (free samuel t_1100)
    (free samuel t_1200)
    (free samuel t_1230)
    (free samuel t_1330)
    (free samuel t_1600)
  )

  (:goal
    (and
      (scheduled meeting_1 t_1030)
      (not (meeting_pending meeting_1))
    )
  )
)