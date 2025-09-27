(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :adl :action-costs)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (checked ?s - slot)
    (candidate ?s - slot)
    (assigned ?s - slot)
    (meeting-scheduled)
    (earlier ?s1 - slot ?s2 - slot)
  )
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
    :parameters ()
    :precondition (and (candidate s0900) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s0900))
    :cost 1
  )
  (:action assign-s0930
    :parameters ()
    :precondition (and (candidate s0930) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s0930))
    :cost 2
  )
  (:action assign-s1000
    :parameters ()
    :precondition (and (candidate s1000) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1000))
    :cost 3
  )
  (:action assign-s1030
    :parameters ()
    :precondition (and (candidate s1030) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1030))
    :cost 4
  )
  (:action assign-s1100
    :parameters ()
    :precondition (and (candidate s1100) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1100))
    :cost 5
  )
  (:action assign-s1130
    :parameters ()
    :precondition (and (candidate s1130) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1130))
    :cost 6
  )
  (:action assign-s1200
    :parameters ()
    :precondition (and (candidate s1200) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1200))
    :cost 7
  )
  (:action assign-s1230
    :parameters ()
    :precondition (and (candidate s1230) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1230))
    :cost 8
  )
  (:action assign-s1300
    :parameters ()
    :precondition (and (candidate s1300) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1300))
    :cost 9
  )
  (:action assign-s1330
    :parameters ()
    :precondition (and (candidate s1330) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1330))
    :cost 10
  )
  (:action assign-s1400
    :parameters ()
    :precondition (and (candidate s1400) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1400))
    :cost 11
  )
  (:action assign-s1430
    :parameters ()
    :precondition (and (candidate s1430) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1430))
    :cost 12
  )
  (:action assign-s1500
    :parameters ()
    :precondition (and (candidate s1500) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1500))
    :cost 13
  )
  (:action assign-s1530
    :parameters ()
    :precondition (and (candidate s1530) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1530))
    :cost 14
  )
  (:action assign-s1600
    :parameters ()
    :precondition (and (candidate s1600) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1600))
    :cost 15
  )
  (:action assign-s1630
    :parameters ()
    :precondition (and (candidate s1630) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (assigned s1630))
    :cost 16
  )
)