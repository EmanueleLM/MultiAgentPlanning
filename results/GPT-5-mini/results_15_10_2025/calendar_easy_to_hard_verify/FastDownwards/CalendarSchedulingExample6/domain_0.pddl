(define (domain meeting-scheduling)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (free ?person ?slot)            ; person is free for 30-min slot ?slot
    (slot-allowed ?start)           ; all participants free for start (start and next slot)
    (scheduled)                     ; meeting scheduled
    (scheduled-at ?start)           ; meeting scheduled at start
  )

  ; Actions: schedule meeting at a given start (60 minutes = two consecutive 30-min slots).
  ; To enforce "earliest feasible slot" as a hard preference, each later-start action
  ; requires that no earlier slot-allowed fact holds (negative preconditions).
  (:action schedule-s0900
    :precondition (and (slot-allowed s0900) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s0900))
  )

  (:action schedule-s0930
    :precondition (and (slot-allowed s0930) (not (slot-allowed s0900)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s0930))
  )

  (:action schedule-s1000
    :precondition (and (slot-allowed s1000) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1000))
  )

  (:action schedule-s1030
    :precondition (and (slot-allowed s1030) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1030))
  )

  (:action schedule-s1100
    :precondition (and (slot-allowed s1100) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1100))
  )

  (:action schedule-s1130
    :precondition (and (slot-allowed s1130) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (slot-allowed s1100)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1130))
  )

  (:action schedule-s1200
    :precondition (and (slot-allowed s1200) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1200))
  )

  (:action schedule-s1230
    :precondition (and (slot-allowed s1230) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1230))
  )

  (:action schedule-s1300
    :precondition (and (slot-allowed s1300) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1300))
  )

  (:action schedule-s1330
    :precondition (and (slot-allowed s1330) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230)) (not (slot-allowed s1300)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1330))
  )

  (:action schedule-s1400
    :precondition (and (slot-allowed s1400) (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030)) (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230)) (not (slot-allowed s1300)) (not (slot-allowed s1330)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1400))
  )

  (:action schedule-s1430
    :precondition (and (slot-allowed s1430)
                       (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030))
                       (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230))
                       (not (slot-allowed s1300)) (not (slot-allowed s1330)) (not (slot-allowed s1400)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1430))
  )

  (:action schedule-s1500
    :precondition (and (slot-allowed s1500)
                       (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030))
                       (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230))
                       (not (slot-allowed s1300)) (not (slot-allowed s1330)) (not (slot-allowed s1400)) (not (slot-allowed s1430)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1500))
  )

  (:action schedule-s1530
    :precondition (and (slot-allowed s1530)
                       (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030))
                       (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230))
                       (not (slot-allowed s1300)) (not (slot-allowed s1330)) (not (slot-allowed s1400)) (not (slot-allowed s1430)) (not (slot-allowed s1500)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1530))
  )

  (:action schedule-s1600
    :precondition (and (slot-allowed s1600)
                       (not (slot-allowed s0900)) (not (slot-allowed s0930)) (not (slot-allowed s1000)) (not (slot-allowed s1030))
                       (not (slot-allowed s1100)) (not (slot-allowed s1130)) (not (slot-allowed s1200)) (not (slot-allowed s1230))
                       (not (slot-allowed s1300)) (not (slot-allowed s1330)) (not (slot-allowed s1400)) (not (slot-allowed s1430)) (not (slot-allowed s1500)) (not (slot-allowed s1530)) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at s1600))
  )
)