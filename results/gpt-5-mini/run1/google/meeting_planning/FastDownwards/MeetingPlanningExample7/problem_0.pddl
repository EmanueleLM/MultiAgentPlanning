(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    john alice bob - person
    office cafe1 cafe2 park - location
    s1 s2 s3 s4 s5 s6 s7 s8 - slot
  )

  (:init
    ;; slot ordering
    (slot-next s1 s2)
    (slot-next s2 s3)
    (slot-next s3 s4)
    (slot-next s4 s5)
    (slot-next s5 s6)
    (slot-next s6 s7)
    (slot-next s7 s8)

    ;; John's initial location at slot 1 (must start at Office per auditor report)
    (at john office s1)

    ;; Friends' candidate schedules (availability and presences at their meeting locations)
    ;; Alice candidate schedule: available contiguous 3-4 (must be available for 2-slot meeting); present at cafe1
    (available alice s3)
    (available alice s4)
    (at alice cafe1 s3)
    (at alice cafe1 s4)
    ;; Also list the broader candidate slot s5 as available but Alice requires meeting exactly 2 slots contiguous 3-4.
    (available alice s5)
    (at alice cafe1 s5)

    ;; Bob candidate schedule: available at slot 4 (1-slot meeting) and also slot5-6 but meeting requirement is 1 slot (we allow any available).
    (available bob s4)
    (available bob s5)
    (available bob s6)
    (at bob cafe2 s4)
    (at bob cafe2 s5)
    (at bob cafe2 s6)

    ;; John's availability window (hard constraint): John is available only during s2..s7 (cannot meet or travel outside these slots)
    (john-available s2)
    (john-available s3)
    (john-available s4)
    (john-available s5)
    (john-available s6)
    (john-available s7)

    ;; Travel durations (connectivity and durations)
    ;; Office <-> Cafe1: 1-slot travel
    (duration1 office cafe1)
    (duration1 cafe1 office)
    ;; Office <-> Cafe2: 2-slot travel
    (duration2 office cafe2)
    (duration2 cafe2 office)
    ;; Cafe1 <-> Park: 1-slot travel (extra connection if useful)
    (duration1 cafe1 park)
    (duration1 park cafe1)
    ;; Cafe2 <-> Park: 1-slot travel
    (duration1 cafe2 park)
    (duration1 park cafe2)
  )

  (:goal (and
    ;; Enforce that John meets both friends (maximize friends met encoded as hard requirement)
    (met alice)
    (met bob)
    ;; Auditor requires John to end the schedule back at Office at final slot s8
    (at john office s8)
  ))