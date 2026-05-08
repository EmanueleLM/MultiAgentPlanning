(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  ;; Instance-specific constants (participants and 30-min start slots)
  (:constants
    jesse kathryn megan - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:predicates
    (busy ?p - person ?s - slot)     ; participant is busy at a given 30-min start slot
    (scheduled ?s - slot)            ; meeting has been scheduled at this slot
    (meeting_scheduled)              ; goal flag: meeting scheduled somewhere
  )

  ;; Each schedule action tries to place the 30-minute meeting at a specific slot.
  ;; Preconditions:
  ;;  - no participant is busy at that slot (checked with negative preconditions over busy facts)
  ;;  - no earlier slot has already been scheduled (explicit negative preconditions on scheduled facts)
  ;; Effects:
  ;;  - set meeting_scheduled and mark this slot as scheduled
  ;; Note: domain is specific to this instance (three participants and the concrete slots).
  (:action schedule_s0900
    :parameters ()
    :precondition (and
      (not (busy jesse s0900)) (not (busy kathryn s0900)) (not (busy megan s0900))
    )
    :effect (and (meeting_scheduled) (scheduled s0900))
  )

  (:action schedule_s0930
    :parameters ()
    :precondition (and
      (not (busy jesse s0930)) (not (busy kathryn s0930)) (not (busy megan s0930))
      (not (scheduled s0900))
    )
    :effect (and (meeting_scheduled) (scheduled s0930))
  )

  (:action schedule_s1000
    :parameters ()
    :precondition (and
      (not (busy jesse s1000)) (not (busy kathryn s1000)) (not (busy megan s1000))
      (not (scheduled s0900)) (not (scheduled s0930))
    )
    :effect (and (meeting_scheduled) (scheduled s1000))
  )

  (:action schedule_s1030
    :parameters ()
    :precondition (and
      (not (busy jesse s1030)) (not (busy kathryn s1030)) (not (busy megan s1030))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000))
    )
    :effect (and (meeting_scheduled) (scheduled s1030))
  )

  (:action schedule_s1100
    :parameters ()
    :precondition (and
      (not (busy jesse s1100)) (not (busy kathryn s1100)) (not (busy megan s1100))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030))
    )
    :effect (and (meeting_scheduled) (scheduled s1100))
  )

  (:action schedule_s1130
    :parameters ()
    :precondition (and
      (not (busy jesse s1130)) (not (busy kathryn s1130)) (not (busy megan s1130))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100))
    )
    :effect (and (meeting_scheduled) (scheduled s1130))
  )

  (:action schedule_s1200
    :parameters ()
    :precondition (and
      (not (busy jesse s1200)) (not (busy kathryn s1200)) (not (busy megan s1200))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130))
    )
    :effect (and (meeting_scheduled) (scheduled s1200))
  )

  (:action schedule_s1230
    :parameters ()
    :precondition (and
      (not (busy jesse s1230)) (not (busy kathryn s1230)) (not (busy megan s1230))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200))
    )
    :effect (and (meeting_scheduled) (scheduled s1230))
  )

  (:action schedule_s1300
    :parameters ()
    :precondition (and
      (not (busy jesse s1300)) (not (busy kathryn s1300)) (not (busy megan s1300))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230))
    )
    :effect (and (meeting_scheduled) (scheduled s1300))
  )

  (:action schedule_s1330
    :parameters ()
    :precondition (and
      (not (busy jesse s1330)) (not (busy kathryn s1330)) (not (busy megan s1330))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300))
    )
    :effect (and (meeting_scheduled) (scheduled s1330))
  )

  (:action schedule_s1400
    :parameters ()
    :precondition (and
      (not (busy jesse s1400)) (not (busy kathryn s1400)) (not (busy megan s1400))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)) (not (scheduled s1330))
    )
    :effect (and (meeting_scheduled) (scheduled s1400))
  )

  (:action schedule_s1430
    :parameters ()
    :precondition (and
      (not (busy jesse s1430)) (not (busy kathryn s1430)) (not (busy megan s1430))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)) (not (scheduled s1330)) (not (scheduled s1400))
    )
    :effect (and (meeting_scheduled) (scheduled s1430))
  )

  (:action schedule_s1500
    :parameters ()
    :precondition (and
      (not (busy jesse s1500)) (not (busy kathryn s1500)) (not (busy megan s1500))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)) (not (scheduled s1330)) (not (scheduled s1400)) (not (scheduled s1430))
    )
    :effect (and (meeting_scheduled) (scheduled s1500))
  )

  (:action schedule_s1530
    :parameters ()
    :precondition (and
      (not (busy jesse s1530)) (not (busy kathryn s1530)) (not (busy megan s1530))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)) (not (scheduled s1330)) (not (scheduled s1400)) (not (scheduled s1430)) (not (scheduled s1500))
    )
    :effect (and (meeting_scheduled) (scheduled s1530))
  )

  (:action schedule_s1600
    :parameters ()
    :precondition (and
      (not (busy jesse s1600)) (not (busy kathryn s1600)) (not (busy megan s1600))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)) (not (scheduled s1330)) (not (scheduled s1400)) (not (scheduled s1430)) (not (scheduled s1500)) (not (scheduled s1530))
    )
    :effect (and (meeting_scheduled) (scheduled s1600))
  )

  (:action schedule_s1630
    :parameters ()
    :precondition (and
      (not (busy jesse s1630)) (not (busy kathryn s1630)) (not (busy megan s1630))
      (not (scheduled s0900)) (not (scheduled s0930)) (not (scheduled s1000)) (not (scheduled s1030)) (not (scheduled s1100)) (not (scheduled s1130)) (not (scheduled s1200)) (not (scheduled s1230)) (not (scheduled s1300)) (not (scheduled s1330)) (not (scheduled s1400)) (not (scheduled s1430)) (not (scheduled s1500)) (not (scheduled s1530)) (not (scheduled s1600))
    )
    :effect (and (meeting_scheduled) (scheduled s1630))
  )
)