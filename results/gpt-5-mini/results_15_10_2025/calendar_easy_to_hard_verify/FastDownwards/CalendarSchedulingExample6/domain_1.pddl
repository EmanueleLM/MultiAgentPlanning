(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (free ?person - person ?slot - slot)
    (slot-allowed ?start - slot)
    (scheduled)
    (scheduled-at ?start - slot)
  )

  (:action schedule-s0900
    :parameters ()
    :precondition (and (slot-allowed s0900) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s0900))
  )

  (:action schedule-s0930
    :parameters ()
    :precondition (and (slot-allowed s0930) (not (slot-allowed s0900)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s0930))
  )

  (:action schedule-s1000
    :parameters ()
    :precondition (and (slot-allowed s1000) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1000))
  )

  (:action schedule-s1030
    :parameters ()
    :precondition (and (slot-allowed s1030) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1030))
  )

  (:action schedule-s1100
    :parameters ()
    :precondition (and (slot-allowed s1100) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1100))
  )

  (:action schedule-s1130
    :parameters ()
    :precondition (and (slot-allowed s1130) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (slot-allowed s1100)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1130))
  )

  (:action schedule-s1200
    :parameters ()
    :precondition (and (slot-allowed s1200) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1200))
  )

  (:action schedule-s1230
    :parameters ()
    :precondition (and (slot-allowed s1230) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1230))
  )

  (:action schedule-s1300
    :parameters ()
    :precondition (and (slot-allowed s1300) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1300))
  )

  (:action schedule-s1330
    :parameters ()
    :precondition (and (slot-allowed s1330) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230)) (not (slot-allowed s1300)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1330))
  )

  (:action schedule-s1400
    :parameters ()
    :precondition (and (slot-allowed s1400) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230)) (not (slot-allowed s1300)) (not (slot-allowed s1330)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1400))
  )

  (:action schedule-s1430
    :parameters ()
    :precondition (and (slot-allowed s1430)
                       (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030))
                       (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230))
                       (not (slot-allowed s1300)) (not (slot-allowed s1330)) (not (slot-allowed s1400)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1430))
  )

  (:action schedule-s1500
    :parameters ()
    :precondition (and (slot-allowed s1500)
                       (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030))
                       (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230))
                       (not (slot-allowed s1300)) (not (slot-allowed s1330)) (not (slot-allowed s1400)) (not (slot-allowed s1430)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1500))
  )

  (:action schedule-s1530
    :parameters ()
    :precondition (and (slot-allowed s1530)
                       (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030))
                       (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230))
                       (not (slot-allowed s1300)) (not (slot-allowed s1330)) (not (slot-allowed s1400)) (not (slot-allowed s1430)) (not (slot-allowed s1500)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1530))
  )

  (:action schedule-s1600
    :parameters ()
    :precondition (and (slot-allowed s1600)
                       (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030))
                       (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230))
                       (not (slot-allowed s1300)) (not (slot-allowed s1330)) (not (slot-allowed s1400)) (not (slot-allowed s1430)) (not (slot-allowed s1500)) (not (slot-allowed s1530)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1600))
  )
)