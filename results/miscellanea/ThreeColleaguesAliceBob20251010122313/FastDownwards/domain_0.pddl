(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types slot agent)
  (:predicates
    ;; time / availability predicates
    (slot ?s - slot)

    ;; per-agent availability (namespaced)
    (alice-available ?s - slot)
    (bob-available ?s - slot)
    (carol-available ?s - slot)

    ;; slot is free for all participants (precomputed intersection)
    (slot-free ?s - slot)

    ;; flags used for tie-breaking / preference encoding
    (interrupts-bob-morning ?s - slot)

    ;; scheduling outcome
    (meeting-scheduled ?s - slot)
    (meeting-done)
  )

  ;; There is one schedule action per discrete 30-minute slot.
  ;; Each action requires that the chosen slot is free AND that no earlier slot is free,
  ;; which enforces selecting the earliest feasible slot.
  ;; Effects mark the meeting as scheduled (meeting-done).
  (:action schedule-0900
    :precondition (and (slot slot-0900) (slot-free slot-0900))
    :effect (and (meeting-scheduled slot-0900) (meeting-done))
  )

  (:action schedule-0930
    :precondition (and (slot slot-0930) (slot-free slot-0930)
                       (not (slot-free slot-0900)))
    :effect (and (meeting-scheduled slot-0930) (meeting-done))
  )

  (:action schedule-1000
    :precondition (and (slot slot-1000) (slot-free slot-1000)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930)))
    :effect (and (meeting-scheduled slot-1000) (meeting-done))
  )

  (:action schedule-1030
    :precondition (and (slot slot-1030) (slot-free slot-1030)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000)))
    :effect (and (meeting-scheduled slot-1030) (meeting-done))
  )

  (:action schedule-1100
    :precondition (and (slot slot-1100) (slot-free slot-1100)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000))
                       (not (slot-free slot-1030)))
    :effect (and (meeting-scheduled slot-1100) (meeting-done))
  )

  (:action schedule-1130
    :precondition (and (slot slot-1130) (slot-free slot-1130)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000))
                       (not (slot-free slot-1030))
                       (not (slot-free slot-1100)))
    :effect (and (meeting-scheduled slot-1130) (meeting-done))
  )

  (:action schedule-1200
    :precondition (and (slot slot-1200) (slot-free slot-1200)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000))
                       (not (slot-free slot-1030))
                       (not (slot-free slot-1100))
                       (not (slot-free slot-1130)))
    :effect (and (meeting-scheduled slot-1200) (meeting-done))
  )

  (:action schedule-1230
    :precondition (and (slot slot-1230) (slot-free slot-1230)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000))
                       (not (slot-free slot-1030))
                       (not (slot-free slot-1100))
                       (not (slot-free slot-1130))
                       (not (slot-free slot-1200)))
    :effect (and (meeting-scheduled slot-1230) (meeting-done))
  )

  (:action schedule-1300
    :precondition (and (slot slot-1300) (slot-free slot-1300)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000))
                       (not (slot-free slot-1030))
                       (not (slot-free slot-1100))
                       (not (slot-free slot-1130))
                       (not (slot-free slot-1200))
                       (not (slot-free slot-1230)))
    :effect (and (meeting-scheduled slot-1300) (meeting-done))
  )

  (:action schedule-1330
    :precondition (and (slot slot-1330) (slot-free slot-1330)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000))
                       (not (slot-free slot-1030))
                       (not (slot-free slot-1100))
                       (not (slot-free slot-1130))
                       (not (slot-free slot-1200))
                       (not (slot-free slot-1230))
                       (not (slot-free slot-1300)))
    :effect (and (meeting-scheduled slot-1330) (meeting-done))
  )

  (:action schedule-1400
    :precondition (and (slot slot-1400) (slot-free slot-1400)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000))
                       (not (slot-free slot-1030))
                       (not (slot-free slot-1100))
                       (not (slot-free slot-1130))
                       (not (slot-free slot-1200))
                       (not (slot-free slot-1230))
                       (not (slot-free slot-1300))
                       (not (slot-free slot-1330)))
    :effect (and (meeting-scheduled slot-1400) (meeting-done))
  )

  (:action schedule-1430
    :precondition (and (slot slot-1430) (slot-free slot-1430)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000))
                       (not (slot-free slot-1030))
                       (not (slot-free slot-1100))
                       (not (slot-free slot-1130))
                       (not (slot-free slot-1200))
                       (not (slot-free slot-1230))
                       (not (slot-free slot-1300))
                       (not (slot-free slot-1330))
                       (not (slot-free slot-1400)))
    :effect (and (meeting-scheduled slot-1430) (meeting-done))
  )

  (:action schedule-1500
    :precondition (and (slot slot-1500) (slot-free slot-1500)
                       ;; ensure no earlier slot is free -> enforces earliest selection
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000))
                       (not (slot-free slot-1030))
                       (not (slot-free slot-1100))
                       (not (slot-free slot-1130))
                       (not (slot-free slot-1200))
                       (not (slot-free slot-1230))
                       (not (slot-free slot-1300))
                       (not (slot-free slot-1330))
                       (not (slot-free slot-1400))
                       (not (slot-free slot-1430)))
    :effect (and (meeting-scheduled slot-1500) (meeting-done))
  )

  (:action schedule-1530
    :precondition (and (slot slot-1530) (slot-free slot-1530)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000))
                       (not (slot-free slot-1030))
                       (not (slot-free slot-1100))
                       (not (slot-free slot-1130))
                       (not (slot-free slot-1200))
                       (not (slot-free slot-1230))
                       (not (slot-free slot-1300))
                       (not (slot-free slot-1330))
                       (not (slot-free slot-1400))
                       (not (slot-free slot-1430))
                       (not (slot-free slot-1500)))
    :effect (and (meeting-scheduled slot-1530) (meeting-done))
  )

  (:action schedule-1600
    :precondition (and (slot slot-1600) (slot-free slot-1600)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000))
                       (not (slot-free slot-1030))
                       (not (slot-free slot-1100))
                       (not (slot-free slot-1130))
                       (not (slot-free slot-1200))
                       (not (slot-free slot-1230))
                       (not (slot-free slot-1300))
                       (not (slot-free slot-1330))
                       (not (slot-free slot-1400))
                       (not (slot-free slot-1430))
                       (not (slot-free slot-1500))
                       (not (slot-free slot-1530)))
    :effect (and (meeting-scheduled slot-1600) (meeting-done))
  )

  (:action schedule-1630
    :precondition (and (slot slot-1630) (slot-free slot-1630)
                       (not (slot-free slot-0900))
                       (not (slot-free slot-0930))
                       (not (slot-free slot-1000))
                       (not (slot-free slot-1030))
                       (not (slot-free slot-1100))
                       (not (slot-free slot-1130))
                       (not (slot-free slot-1200))
                       (not (slot-free slot-1230))
                       (not (slot-free slot-1300))
                       (not (slot-free slot-1330))
                       (not (slot-free slot-1400))
                       (not (slot-free slot-1430))
                       (not (slot-free slot-1500))
                       (not (slot-free slot-1530))
                       (not (slot-free slot-1600)))
    :effect (and (meeting-scheduled slot-1630) (meeting-done))
  )
)