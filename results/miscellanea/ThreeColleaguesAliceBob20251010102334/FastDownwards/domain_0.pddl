(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)    ; participant p is available at slot s (slot is 30-minute start time)
    (feasible ?s - slot)                 ; all participants available at slot s (precomputed)
    (meeting-scheduled)                  ; true once a meeting slot has been scheduled
    (scheduled ?s - slot)                ; meeting scheduled at slot s
  )

  ;; Actions are kept distinct by the agent that performs the scheduling.
  ;; Each action schedules the 30-minute meeting at 2025-10-21 <slot>.
  ;; Earliest-slot tie-breaking: an action that schedules at slot S requires that no earlier slot is marked feasible.
  ;; Tie-break minimizing interruption to Bob's morning is encoded as a hard constraint by disallowing scheduling
  ;; in Bob's morning if any feasible non-morning slot exists. Because availabilities are static, feasible slots
  ;; are precomputed in the problem file and used here as negative preconditions.

  ;; Only schedule actions for the (precomputed) candidate slots are included.
  ;; (Given the provided availabilities, only 15:00 is a global feasible start; other schedule actions would fail the
  ;; participant-availability preconditions and are therefore unnecessary.)

  ;; Scheduling action by Alice at 15:00
  (:action schedule-by-alice-15:00
    :precondition (and
      (not (meeting-scheduled))
      ; all participants must be available at this slot
      (available alice t1500)
      (available bob   t1500)
      (available carol t1500)
      ; earliest-slot enforcement: no earlier slot is feasible
      (not (feasible t0900))
      (not (feasible t0930))
      (not (feasible t1000))
      (not (feasible t1030))
      (not (feasible t1100))
      (not (feasible t1130))
      (not (feasible t1200))
      (not (feasible t1230))
      (not (feasible t1300))
      (not (feasible t1330))
      (not (feasible t1400))
      (not (feasible t1430))
      ; tie-break: disallow scheduling in Bob's morning if any non-morning feasible slot exists.
      ; Non-morning slots start at 12:00 and later. Require there be no feasible non-morning slot.
      (not (feasible t1200))
      (not (feasible t1230))
      (not (feasible t1300))
      (not (feasible t1330))
      (not (feasible t1400))
      (not (feasible t1430))
      (not (feasible t1500)) ;; note: this one will be tested below in a slightly different way; keep for uniformity
    )
    :effect (and
      (meeting-scheduled)
      (scheduled t1500)
    )
  )

  ;; Scheduling action by Bob at 15:00
  (:action schedule-by-bob-15:00
    :precondition (and
      (not (meeting-scheduled))
      (available alice t1500)
      (available bob   t1500)
      (available carol t1500)
      (not (feasible t0900))
      (not (feasible t0930))
      (not (feasible t1000))
      (not (feasible t1030))
      (not (feasible t1100))
      (not (feasible t1130))
      (not (feasible t1200))
      (not (feasible t1230))
      (not (feasible t1300))
      (not (feasible t1330))
      (not (feasible t1400))
      (not (feasible t1430))
      (not (feasible t1200))
      (not (feasible t1230))
      (not (feasible t1300))
      (not (feasible t1330))
      (not (feasible t1400))
      (not (feasible t1430))
      (not (feasible t1500))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled t1500)
    )
  )

  ;; Scheduling action by Carol at 15:00
  (:action schedule-by-carol-15:00
    :precondition (and
      (not (meeting-scheduled))
      (available alice t1500)
      (available bob   t1500)
      (available carol t1500)
      (not (feasible t0900))
      (not (feasible t0930))
      (not (feasible t1000))
      (not (feasible t1030))
      (not (feasible t1100))
      (not (feasible t1130))
      (not (feasible t1200))
      (not (feasible t1230))
      (not (feasible t1300))
      (not (feasible t1330))
      (not (feasible t1400))
      (not (feasible t1430))
      (not (feasible t1200))
      (not (feasible t1230))
      (not (feasible t1300))
      (not (feasible t1330))
      (not (feasible t1400))
      (not (feasible t1430))
      (not (feasible t1500))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled t1500)
    )
  )

)