(define (problem schedule_team_meeting_monday)
  (:domain jack_of_all_trades)

  (:objects
    lisa bobby randy - participant
    team_meeting - meeting
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    (slot_within_workhours t0900) (slot_within_workhours t0930)
    (slot_within_workhours t1000) (slot_within_workhours t1030)
    (slot_within_workhours t1100) (slot_within_workhours t1130)
    (slot_within_workhours t1200) (slot_within_workhours t1230)
    (slot_within_workhours t1300) (slot_within_workhours t1330)
    (slot_within_workhours t1400) (slot_within_workhours t1430)
    (slot_within_workhours t1500) (slot_within_workhours t1530)
    (slot_within_workhours t1600) (slot_within_workhours t1630)

    (allowed_by_bobby t0900) (allowed_by_bobby t0930)
    (allowed_by_bobby t1000) (allowed_by_bobby t1030)
    (allowed_by_bobby t1100) (allowed_by_bobby t1130)
    (allowed_by_bobby t1200) (allowed_by_bobby t1230)
    (allowed_by_bobby t1300) (allowed_by_bobby t1330)
    (allowed_by_bobby t1400) (allowed_by_bobby t1430)

    (busy_existing lisa t0900)
    (busy_existing lisa t0930)
    (busy_existing lisa t1030)
    (busy_existing lisa t1100)
    (busy_existing lisa t1230)
    (busy_existing lisa t1600)

    (busy_existing bobby t0900)
    (busy_existing bobby t1000)
    (busy_existing bobby t1130)
    (busy_existing bobby t1500)

    (busy_existing randy t0930)
    (busy_existing randy t1030)
    (busy_existing randy t1130)
    (busy_existing randy t1200)
    (busy_existing randy t1300)
    (busy_existing randy t1430)
    (busy_existing randy t1500)
    (busy_existing randy t1600)
  )

  (:goal (scheduled team_meeting))
)