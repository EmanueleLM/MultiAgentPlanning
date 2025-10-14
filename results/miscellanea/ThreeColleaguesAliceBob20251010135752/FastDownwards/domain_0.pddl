(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :fluents :action-costs)
  (:types person slot)

  (:predicates
    ;; availability: (available ?person ?slot)
    (available ?p - person ?s - slot)
    ;; a meeting scheduled at a particular slot
    (meeting-scheduled ?s - slot)
    ;; boolean guard to ensure only one meeting is scheduled
    (meeting-set)
  )

  ;; numeric functions
  (:functions
    (total-cost)                    ;; accumulated objective to minimize
    (slot-index ?s - slot)          ;; integer index for slot: 0 = 09:00-09:30, 1 = 09:30-10:00, ...
    (bob-interruption ?s - slot)    ;; numeric "interruption cost" for Bob for each slot (lower better)
  )

  ;; single scheduling action: schedule meeting at a particular slot
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-set))           ;; ensure we schedule at most one meeting
      (available alice ?s)
      (available bob ?s)
      (available carol ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (meeting-set)
      ;; increase total-cost so minimizing it selects earliest slot first (big weight on slot-index)
      ;; and uses bob-interruption as a tie-breaker (smaller is better).
      ;; Note: numeric expression uses (* (slot-index ?s) 100) + (bob-interruption ?s)
      (increase (total-cost) (+ (* (slot-index ?s) 100) (bob-interruption ?s)))
    )
  )
)