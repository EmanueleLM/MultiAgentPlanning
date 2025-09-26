(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :fluents :action-costs)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting-scheduled)
    (scheduled-at ?t - timeslot)
    (valid-slot ?t - timeslot)
  )

  (:functions
    (total-cost)
  )

  (:action schedule-09-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t0900)
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
      (increase (total-cost) 540)
    )
  )

  (:action schedule-09-30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t0930)
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
      (increase (total-cost) 570)
    )
  )

  (:action schedule-10-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t1000)
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
      (increase (total-cost) 600)
    )
  )

  (:action schedule-10-30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t1030)
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
      (increase (total-cost) 630)
    )
  )

  (:action schedule-11-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t1100)
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
      (increase (total-cost) 660)
    )
  )

  (:action schedule-11-30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t1130)
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
      (increase (total-cost) 690)
    )
  )

  (:action schedule-12-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t1200)
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
      (increase (total-cost) 720)
    )
  )

  (:action schedule-12-30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t1230)
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
      (increase (total-cost) 750)
    )
  )

  (:action schedule-13-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t1300)
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
      (increase (total-cost) 780)
    )
  )

  (:action schedule-13-30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t1330)
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
      (increase (total-cost) 810)
    )
  )

  (:action schedule-14-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t1400)
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
      (increase (total-cost) 840)
    )
  )

  (:action schedule-14-30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t1430)
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
      (increase (total-cost) 870)
    )
  )

  (:action schedule-15-00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot t1500)
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
      (increase (total-cost) 900)
    )
  )
)