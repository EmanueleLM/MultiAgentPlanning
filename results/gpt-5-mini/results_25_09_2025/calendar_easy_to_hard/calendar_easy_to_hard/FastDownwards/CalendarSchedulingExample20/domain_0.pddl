(define (domain meeting-scheduling)
  (:requirements :strips :typing :adl :fluents)
  (:types slot)

  (:predicates
    (available-ralph ?s - slot)
    (available-peter ?s - slot)
    (available-daniel ?s - slot)
    (ralph-ok ?s - slot)
    (peter-ok ?s - slot)
    (daniel-ok ?s - slot)
    (after-preferred ?s - slot)  ; slots Daniel prefers to avoid (start >= 14:00)
    (meeting-scheduled)
  )

  (:functions
    (total-cost)
  )

  ;; Ralph's confirmation action (agent-specific)
  (:action ralph-confirm
    :parameters (?s - slot)
    :precondition (available-ralph ?s)
    :effect (and
      (ralph-ok ?s)
    )
  )

  ;; Peter's confirmation action (agent-specific)
  (:action peter-confirm
    :parameters (?s - slot)
    :precondition (available-peter ?s)
    :effect (and
      (peter-ok ?s)
    )
  )

  ;; Daniel's confirmation action (agent-specific)
  ;; If the chosen slot is after Daniel's preferred cutoff, add a small penalty to total-cost.
  (:action daniel-confirm
    :parameters (?s - slot)
    :precondition (available-daniel ?s)
    :effect (and
      (daniel-ok ?s)
      (when (after-preferred ?s)
        (increase (total-cost) 1)
      )
    )
  )

  ;; Finalize meeting: requires all three participants to have accepted the same slot.
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (ralph-ok ?s) (peter-ok ?s) (daniel-ok ?s))
    :effect (meeting-scheduled)
  )

  ;; Minimize the total cost (to respect Daniel's preference when possible)
  (:metric minimize (total-cost))
)