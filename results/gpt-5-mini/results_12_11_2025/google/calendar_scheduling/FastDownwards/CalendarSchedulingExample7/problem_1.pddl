(define (problem schedule_monday_30min)
  (:domain meeting_scheduling)

  ;; Timeslot objects for 09:00-16:30 start times on 30-minute grid
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
    heather nicholas zachary - participant
  )

  (:init
    ;; Participant availability on 30-minute grid (free_X facts)
    ;; Heather busy: 09:00-09:30 (t0900), 10:30-11:00 (t1030), 13:00-14:00 (t1300,t1330),
    ;; 14:30-15:00 (t1430), 16:00-16:30 (t1600).
    ;; Therefore Heather free slots:
    (free_heather t0930)
    (free_heather t1000)
    (free_heather t1100)
    (free_heather t1130)
    (free_heather t1200)
    (free_heather t1230)
    (free_heather t1400)
    (free_heather t1500)
    (free_heather t1530)
    (free_heather t1630)

    ;; Nicholas has no meetings the whole day (free all slots)
    (free_nicholas t0900) (free_nicholas t0930) (free_nicholas t1000) (free_nicholas t1030)
    (free_nicholas t1100) (free_nicholas t1130) (free_nicholas t1200) (free_nicholas t1230)
    (free_nicholas t1300) (free_nicholas t1330) (free_nicholas t1400) (free_nicholas t1430)
    (free_nicholas t1500) (free_nicholas t1530) (free_nicholas t1600) (free_nicholas t1630)

    ;; Zachary busy: 09:00-10:30 (t0900,t0930,t1000), 11:00-12:00 (t1100,t1130),
    ;; 12:30-13:00 (t1230), 13:30-16:30 (t1330,t1400,t1430,t1500,t1530,t1600).
    ;; Therefore Zachary free slots:
    (free_zachary t1030)
    (free_zachary t1200)
    (free_zachary t1300)
    (free_zachary t1630)

    ;; The intersection of the free sets yields two feasible slots for all three:
    ;; t1200 (12:00-12:30) and t1630 (16:30-17:00).
    ;; To encode the soft preference "Zachary would rather not meet after 14:00",
    ;; and following the audit recommendation, we mark only the preferred pre-14:00
    ;; feasible slot as choosable. This makes the recommended slot the natural
    ;; satisfying plan for the Fast Downward solver when a pre-14:00 feasible
    ;; slot exists.
    (choosable t1200)

    ;; Note: t1630 is feasible by availability facts above but not marked choosable
    ;; because a preferred pre-14:00 feasible slot exists (t1200). This enforces
    ;; the soft preference as a resolved policy in the initial state.
  )

  ;; Goal: ensure exactly one meeting is scheduled (the planner will apply schedule once)
  ;; The chosen timeslot is not named in the goal (meeting_scheduled only).
  (:goal (meeting_scheduled))
)