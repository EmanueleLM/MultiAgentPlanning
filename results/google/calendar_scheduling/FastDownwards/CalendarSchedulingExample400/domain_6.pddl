(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :adl :equality :fluents)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (checked ?s - slot)
    (candidate ?s - slot)
    (assigned ?s - slot)
    (meeting-scheduled)
    (earlier ?s1 - slot ?s2 - slot)
  )
  (:functions (total-cost))

  (:action check-slot-available
    :parameters (?s - slot)
    :precondition (and
      (not (checked ?s))
      (free rachel ?s)
      (free katherine ?s)
      (free kelly ?s)
      (free cynthia ?s)
      (free anthony ?s)
      (free ryan ?s)
      (free richard ?s)
    )
    :effect (and (checked ?s) (candidate ?s))
  )

  (:action mark-checked-unavailable
    :parameters (?s - slot ?p - participant)
    :precondition (and
      (not (checked ?s))
      (not (free ?p ?s))
    )
    :effect (checked ?s)
  )

  (:action assign-s0900
    :precondition (and (candidate s0900) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s0900) (increase (total-cost) 1))
  )
  (:action assign-s0930
    :precondition (and (candidate s0930) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s0930) (increase (total-cost) 2))
  )
  (:action assign-s1000
    :precondition (and (candidate s1000) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1000) (increase (total-cost) 3))
  )
  (:action assign-s1030
    :precondition (and (candidate s1030) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1030) (increase (total-cost) 4))
  )
  (:action assign-s1100
    :precondition (and (candidate s1100) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1100) (increase (total-cost) 5))
  )
  (:action assign-s1130
    :precondition (and (candidate s1130) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1130) (increase (total-cost) 6))
  )
  (:action assign-s1200
    :precondition (and (candidate s1200) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1200) (increase (total-cost) 7))
  )
  (:action assign-s1230
    :precondition (and (candidate s1230) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1230) (increase (total-cost) 8))
  )
  (:action assign-s1300
    :precondition (and (candidate s1300) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1300) (increase (total-cost) 9))
  )
  (:action assign-s1330
    :precondition (and (candidate s1330) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1330) (increase (total-cost) 10))
  )
  (:action assign-s1400
    :precondition (and (candidate s1400) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1400) (increase (total-cost) 11))
  )
  (:action assign-s1430
    :precondition (and (candidate s1430) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1430) (increase (total-cost) 12))
  )
  (:action assign-s1500
    :precondition (and (candidate s1500) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1500) (increase (total-cost) 13))
  )
  (:action assign-s1530
    :precondition (and (candidate s1530) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1530) (increase (total-cost) 14))
  )
  (:action assign-s1600
    :precondition (and (candidate s1600) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1600) (increase (total-cost) 15))
  )
  (:action assign-s1630
    :precondition (and (candidate s1630) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1630) (increase (total-cost) 16))
  )
)