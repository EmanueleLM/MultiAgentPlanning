(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :fluents)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting-scheduled)
    (scheduled-at ?t - timeslot)
  )

  (:functions
    (meeting-start)  ; numeric value (minutes since midnight) of chosen start; minimize this to pick earliest
  )

  ;; Actions correspond to scheduling the 30-minute meeting at a specific start time.
  ;; Each action requires all participants be free at that start slot and that no meeting is already scheduled.
  ;; The action sets meeting-scheduled, records the chosen slot, and assigns the numeric meeting-start value.
  (:action schedule-09-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free diane t0900)
      (free helen t0900)
      (free arthur t0900)
      (free ethan t0900)
      (free beverly t0900)
      (free deborah t0900)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t0900)
      (assign (meeting-start) 540)
    )
  )

  (:action schedule-09-30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free diane t0930)
      (free helen t0930)
      (free arthur t0930)
      (free ethan t0930)
      (free beverly t0930)
      (free deborah t0930)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t0930)
      (assign (meeting-start) 570)
    )
  )

  (:action schedule-10-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free diane t1000)
      (free helen t1000)
      (free arthur t1000)
      (free ethan t1000)
      (free beverly t1000)
      (free deborah t1000)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1000)
      (assign (meeting-start) 600)
    )
  )

  (:action schedule-10-30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free diane t1030)
      (free helen t1030)
      (free arthur t1030)
      (free ethan t1030)
      (free beverly t1030)
      (free deborah t1030)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1030)
      (assign (meeting-start) 630)
    )
  )

  (:action schedule-11-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free diane t1100)
      (free helen t1100)
      (free arthur t1100)
      (free ethan t1100)
      (free beverly t1100)
      (free deborah t1100)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1100)
      (assign (meeting-start) 660)
    )
  )

  (:action schedule-11-30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free diane t1130)
      (free helen t1130)
      (free arthur t1130)
      (free ethan t1130)
      (free beverly t1130)
      (free deborah t1130)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1130)
      (assign (meeting-start) 690)
    )
  )

  (:action schedule-12-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free diane t1200)
      (free helen t1200)
      (free arthur t1200)
      (free ethan t1200)
      (free beverly t1200)
      (free deborah t1200)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1200)
      (assign (meeting-start) 720)
    )
  )

  (:action schedule-12-30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free diane t1230)
      (free helen t1230)
      (free arthur t1230)
      (free ethan t1230)
      (free beverly t1230)
      (free deborah t1230)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1230)
      (assign (meeting-start) 750)
    )
  )

  (:action schedule-13-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free diane t1300)
      (free helen t1300)
      (free arthur t1300)
      (free ethan t1300)
      (free beverly t1300)
      (free deborah t1300)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1300)
      (assign (meeting-start) 780)
    )
  )

  (:action schedule-13-30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free diane t1330)
      (free helen t1330)
      (free arthur t1330)
      (free ethan t1330)
      (free beverly t1330)
      (free deborah t1330)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1330)
      (assign (meeting-start) 810)
    )
  )

  (:action schedule-14-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free diane t1400)
      (free helen t1400)
      (free arthur t1400)
      (free ethan t1400)
      (free beverly t1400)
      (free deborah t1400)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1400)
      (assign (meeting-start) 840)
    )
  )

  (:action schedule-14-30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free diane t1430)
      (free helen t1430)
      (free arthur t1430)
      (free ethan t1430)
      (free beverly t1430)
      (free deborah t1430)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1430)
      (assign (meeting-start) 870)
    )
  )

  (:action schedule-15-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      ;; Diane's stated hard preference: avoid meetings after 15:30.
      ;; Interpreted as meeting must end by 15:30 -> latest start 15:00.
      (free diane t1500)
      (free helen t1500)
      (free arthur t1500)
      (free ethan t1500)
      (free beverly t1500)
      (free deborah t1500)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1500)
      (assign (meeting-start) 900)
    )
  )

  ;; Note: slots after 15:00 are intentionally not provided with scheduling actions,
  ;; to strictly enforce Diane's "avoid after 15:30" constraint (meeting must end by 15:30).
)