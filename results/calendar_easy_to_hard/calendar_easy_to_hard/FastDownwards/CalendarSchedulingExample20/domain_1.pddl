(define (domain meeting-scheduling)
  (:requirements :strips :typing :adl :conditional-effects :action-costs)
  (:types slot)

  (:predicates
    (available-ralph ?s - slot)
    (available-peter ?s - slot)
    (available-daniel ?s - slot)
    (ralph-ok ?s - slot)
    (peter-ok ?s - slot)
    (daniel-ok ?s - slot)
    (after-preferred ?s - slot)
    (meeting-scheduled)
  )

  (:functions
    (total-cost)
  )

  (:action ralph-confirm
    :parameters (?s - slot)
    :precondition (available-ralph ?s)
    :effect (and
      (ralph-ok ?s)
    )
  )

  (:action peter-confirm
    :parameters (?s - slot)
    :precondition (available-peter ?s)
    :effect (and
      (peter-ok ?s)
    )
  )

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

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (ralph-ok ?s) (peter-ok ?s) (daniel-ok ?s))
    :effect (meeting-scheduled)
  )
)