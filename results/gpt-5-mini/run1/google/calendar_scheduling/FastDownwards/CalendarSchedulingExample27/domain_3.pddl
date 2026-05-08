(define (domain calendar_scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (slot_free ?s - slot)
    (scheduled ?s - slot)
    (meeting_scheduled)
  )

  ;; Schedule the earliest available slot. Each slot-action requires that
  ;; no earlier slot has been scheduled (explicit negative preconditions).
  ;; Actions are specific to this instance's discrete 30-minute slots.
  (:action schedule_s0900
    :parameters ()
    :precondition (and (slot_free s0900))
    :effect (and (meeting_scheduled) (scheduled s0900) (not (slot_free s0900)))
  )

  (:action schedule_s0930
    :parameters ()
    :precondition (and (slot_free s0930) (not (scheduled s0900)))
    :effect (and (meeting_scheduled) (scheduled s0930) (not (slot_free s0930)))
  )

  (:action schedule_s1000
    :parameters ()
    :precondition (and (slot_free s1000)
                       (not (scheduled s0900)) (not (scheduled s0930)))
    :effect (and (meeting_scheduled) (scheduled s1000) (not (slot_free s1000)))
  )

  (:action schedule_s1030
    :parameters ()
    :precondition (and (slot_free s1030)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)))
    :effect (and (meeting_scheduled) (scheduled s1030) (not (slot_free s1030)))
  )

  (:action schedule_s1100
    :parameters ()
    :precondition (and (slot_free s1100)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)))
    :effect (and (meeting_scheduled) (scheduled s1100) (not (slot_free s1100)))
  )

  (:action schedule_s1130
    :parameters ()
    :precondition (and (slot_free s1130)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)))
    :effect (and (meeting_scheduled) (scheduled s1130) (not (slot_free s1130)))
  )

  (:action schedule_s1200
    :parameters ()
    :precondition (and (slot_free s1200)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)))
    :effect (and (meeting_scheduled) (scheduled s1200) (not (slot_free s1200)))
  )

  (:action schedule_s1230
    :parameters ()
    :precondition (and (slot_free s1230)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)))
    :effect (and (meeting_scheduled) (scheduled s1230) (not (slot_free s1230)))
  )

  (:action schedule_s1300
    :parameters ()
    :precondition (and (slot_free s1300)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)))
    :effect (and (meeting_scheduled) (scheduled s1300) (not (slot_free s1300)))
  )

  (:action schedule_s1330
    :parameters ()
    :precondition (and (slot_free s1330)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)))
    :effect (and (meeting_scheduled) (scheduled s1330) (not (slot_free s1330)))
  )

  (:action schedule_s1400
    :parameters ()
    :precondition (and (slot_free s1400)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)) (not (scheduled s1330)))
    :effect (and (meeting_scheduled) (scheduled s1400) (not (slot_free s1400)))
  )

  (:action schedule_s1430
    :parameters ()
    :precondition (and (slot_free s1430)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)) (not (scheduled s1330)) (not (scheduled s1400)))
    :effect (and (meeting_scheduled) (scheduled s1430) (not (slot_free s1430)))
  )

  (:action schedule_s1500
    :parameters ()
    :precondition (and (slot_free s1500)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)) (not (scheduled s1330)) (not (scheduled s1400)) (not (scheduled s1430)))
    :effect (and (meeting_scheduled) (scheduled s1500) (not (slot_free s1500)))
  )

  (:action schedule_s1530
    :parameters ()
    :precondition (and (slot_free s1530)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)) (not (scheduled s1330)) (not (scheduled s1400)) (not (scheduled s1430)) (not (scheduled s1500)))
    :effect (and (meeting_scheduled) (scheduled s1530) (not (slot_free s1530)))
  )

  (:action schedule_s1600
    :parameters ()
    :precondition (and (slot_free s1600)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)) (not (scheduled s1330)) (not (scheduled s1400)) (not (scheduled s1430)) (not (scheduled s1500)) (not (scheduled s1530)))
    :effect (and (meeting_scheduled) (scheduled s1600) (not (slot_free s1600)))
  )

  (:action schedule_s1630
    :parameters ()
    :precondition (and (slot_free s1630)
                       (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)) (not (scheduled s1330)) (not (scheduled s1400)) (not (scheduled s1430)) (not (scheduled s1500)) (not (scheduled s1530)) (not (scheduled s1600)))
    :effect (and (meeting_scheduled) (scheduled s1630) (not (slot_free s1630)))
  )
)