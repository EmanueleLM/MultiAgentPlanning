(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types participant timeslot)

  (:predicates
    (free ?p - participant ?t - timeslot)
    (meeting-scheduled)
    (scheduled-at ?t - timeslot)
  )

  (:functions (total-cost))

  ;; schedule actions for each 30-minute slot between 09:00 and 16:30
  ;; action preconditions require every participant to be free at that timeslot
  ;; and that no meeting has been scheduled yet. Effects set meeting scheduled
  ;; at the chosen timeslot and increase total-cost. Costs are assigned so
  ;; earlier slots have lower cost (to prefer earliest feasible slot).
  
  (:action schedule-0900
    :precondition (and
      (free nicole t0900) (free christine t0900) (free anna t0900)
      (free terry t0900) (free julie t0900) (free abigail t0900)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t0900)
      (increase (total-cost) 1)
    )
  )

  (:action schedule-0930
    :precondition (and
      (free nicole t0930) (free christine t0930) (free anna t0930)
      (free terry t0930) (free julie t0930) (free abigail t0930)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t0930)
      (increase (total-cost) 2)
    )
  )

  (:action schedule-1000
    :precondition (and
      (free nicole t1000) (free christine t1000) (free anna t1000)
      (free terry t1000) (free julie t1000) (free abigail t1000)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1000)
      (increase (total-cost) 3)
    )
  )

  (:action schedule-1030
    :precondition (and
      (free nicole t1030) (free christine t1030) (free anna t1030)
      (free terry t1030) (free julie t1030) (free abigail t1030)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1030)
      (increase (total-cost) 4)
    )
  )

  (:action schedule-1100
    :precondition (and
      (free nicole t1100) (free christine t1100) (free anna t1100)
      (free terry t1100) (free julie t1100) (free abigail t1100)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1100)
      (increase (total-cost) 5)
    )
  )

  (:action schedule-1130
    :precondition (and
      (free nicole t1130) (free christine t1130) (free anna t1130)
      (free terry t1130) (free julie t1130) (free abigail t1130)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1130)
      (increase (total-cost) 6)
    )
  )

  (:action schedule-1200
    :precondition (and
      (free nicole t1200) (free christine t1200) (free anna t1200)
      (free terry t1200) (free julie t1200) (free abigail t1200)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1200)
      (increase (total-cost) 7)
    )
  )

  (:action schedule-1230
    :precondition (and
      (free nicole t1230) (free christine t1230) (free anna t1230)
      (free terry t1230) (free julie t1230) (free abigail t1230)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1230)
      (increase (total-cost) 8)
    )
  )

  (:action schedule-1300
    :precondition (and
      (free nicole t1300) (free christine t1300) (free anna t1300)
      (free terry t1300) (free julie t1300) (free abigail t1300)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1300)
      (increase (total-cost) 9)
    )
  )

  (:action schedule-1330
    :precondition (and
      (free nicole t1330) (free christine t1330) (free anna t1330)
      (free terry t1330) (free julie t1330) (free abigail t1330)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1330)
      (increase (total-cost) 10)
    )
  )

  (:action schedule-1400
    :precondition (and
      (free nicole t1400) (free christine t1400) (free anna t1400)
      (free terry t1400) (free julie t1400) (free abigail t1400)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1400)
      (increase (total-cost) 11)
    )
  )

  (:action schedule-1430
    :precondition (and
      (free nicole t1430) (free christine t1430) (free anna t1430)
      (free terry t1430) (free julie t1430) (free abigail t1430)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1430)
      (increase (total-cost) 12)
    )
  )

  (:action schedule-1500
    :precondition (and
      (free nicole t1500) (free christine t1500) (free anna t1500)
      (free terry t1500) (free julie t1500) (free abigail t1500)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1500)
      (increase (total-cost) 13)
    )
  )

  (:action schedule-1530
    :precondition (and
      (free nicole t1530) (free christine t1530) (free anna t1530)
      (free terry t1530) (free julie t1530) (free abigail t1530)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1530)
      (increase (total-cost) 14)
    )
  )

  (:action schedule-1600
    :precondition (and
      (free nicole t1600) (free christine t1600) (free anna t1600)
      (free terry t1600) (free julie t1600) (free abigail t1600)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1600)
      (increase (total-cost) 15)
    )
  )

  (:action schedule-1630
    :precondition (and
      (free nicole t1630) (free christine t1630) (free anna t1630)
      (free terry t1630) (free julie t1630) (free abigail t1630)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at t1630)
      (increase (total-cost) 16)
    )
  )

)