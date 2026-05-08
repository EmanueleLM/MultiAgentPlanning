(define (domain CalendarScheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (all-free ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action schedule-s0900
    :parameters ()
    :precondition (and (all-free s0900))
    :effect (and (meeting-scheduled) (scheduled s0900) (not (all-free s0900)))
  )

  (:action schedule-s0930
    :parameters ()
    :precondition (and (all-free s0930) (not (all-free s0900)))
    :effect (and (meeting-scheduled) (scheduled s0930) (not (all-free s0930)))
  )

  (:action schedule-s1000
    :parameters ()
    :precondition (and (all-free s1000) (not (all-free s0900)) (not (all-free s0930)))
    :effect (and (meeting-scheduled) (scheduled s1000) (not (all-free s1000)))
  )

  (:action schedule-s1030
    :parameters ()
    :precondition (and (all-free s1030) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)))
    :effect (and (meeting-scheduled) (scheduled s1030) (not (all-free s1030)))
  )

  (:action schedule-s1100
    :parameters ()
    :precondition (and (all-free s1100) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)) (not (all-free s1030)))
    :effect (and (meeting-scheduled) (scheduled s1100) (not (all-free s1100)))
  )

  (:action schedule-s1130
    :parameters ()
    :precondition (and (all-free s1130) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)) (not (all-free s1030)) (not (all-free s1100)))
    :effect (and (meeting-scheduled) (scheduled s1130) (not (all-free s1130)))
  )

  (:action schedule-s1200
    :parameters ()
    :precondition (and (all-free s1200) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)) (not (all-free s1030)) (not (all-free s1100)) (not (all-free s1130)))
    :effect (and (meeting-scheduled) (scheduled s1200) (not (all-free s1200)))
  )

  (:action schedule-s1230
    :parameters ()
    :precondition (and (all-free s1230) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)) (not (all-free s1030)) (not (all-free s1100)) (not (all-free s1130)) (not (all-free s1200)))
    :effect (and (meeting-scheduled) (scheduled s1230) (not (all-free s1230)))
  )

  (:action schedule-s1300
    :parameters ()
    :precondition (and (all-free s1300) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)) (not (all-free s1030)) (not (all-free s1100)) (not (all-free s1130)) (not (all-free s1200)) (not (all-free s1230)))
    :effect (and (meeting-scheduled) (scheduled s1300) (not (all-free s1300)))
  )

  (:action schedule-s1330
    :parameters ()
    :precondition (and (all-free s1330) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)) (not (all-free s1030)) (not (all-free s1100)) (not (all-free s1130)) (not (all-free s1200)) (not (all-free s1230)) (not (all-free s1300)))
    :effect (and (meeting-scheduled) (scheduled s1330) (not (all-free s1330)))
  )

  (:action schedule-s1400
    :parameters ()
    :precondition (and (all-free s1400) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)) (not (all-free s1030)) (not (all-free s1100)) (not (all-free s1130)) (not (all-free s1200)) (not (all-free s1230)) (not (all-free s1300)) (not (all-free s1330)))
    :effect (and (meeting-scheduled) (scheduled s1400) (not (all-free s1400)))
  )

  (:action schedule-s1430
    :parameters ()
    :precondition (and (all-free s1430) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)) (not (all-free s1030)) (not (all-free s1100)) (not (all-free s1130)) (not (all-free s1200)) (not (all-free s1230)) (not (all-free s1300)) (not (all-free s1330)) (not (all-free s1400)))
    :effect (and (meeting-scheduled) (scheduled s1430) (not (all-free s1430)))
  )

  (:action schedule-s1500
    :parameters ()
    :precondition (and (all-free s1500) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)) (not (all-free s1030)) (not (all-free s1100)) (not (all-free s1130)) (not (all-free s1200)) (not (all-free s1230)) (not (all-free s1300)) (not (all-free s1330)) (not (all-free s1400)) (not (all-free s1430)))
    :effect (and (meeting-scheduled) (scheduled s1500) (not (all-free s1500)))
  )

  (:action schedule-s1530
    :parameters ()
    :precondition (and (all-free s1530) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)) (not (all-free s1030)) (not (all-free s1100)) (not (all-free s1130)) (not (all-free s1200)) (not (all-free s1230)) (not (all-free s1300)) (not (all-free s1330)) (not (all-free s1400)) (not (all-free s1430)) (not (all-free s1500)))
    :effect (and (meeting-scheduled) (scheduled s1530) (not (all-free s1530)))
  )

  (:action schedule-s1600
    :parameters ()
    :precondition (and (all-free s1600) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)) (not (all-free s1030)) (not (all-free s1100)) (not (all-free s1130)) (not (all-free s1200)) (not (all-free s1230)) (not (all-free s1300)) (not (all-free s1330)) (not (all-free s1400)) (not (all-free s1430)) (not (all-free s1500)) (not (all-free s1530)))
    :effect (and (meeting-scheduled) (scheduled s1600) (not (all-free s1600)))
  )

  (:action schedule-s1630
    :parameters ()
    :precondition (and (all-free s1630) (not (all-free s0900)) (not (all-free s0930)) (not (all-free s1000)) (not (all-free s1030)) (not (all-free s1100)) (not (all-free s1130)) (not (all-free s1200)) (not (all-free s1230)) (not (all-free s1300)) (not (all-free s1330)) (not (all-free s1400)) (not (all-free s1430)) (not (all-free s1500)) (not (all-free s1530)) (not (all-free s1600)))
    :effect (and (meeting-scheduled) (scheduled s1630) (not (all-free s1630)))
  )
)