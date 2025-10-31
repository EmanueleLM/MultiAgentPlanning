(define (domain meeting-scheduling)
  (:requirements :strips :typing :adl :action-costs)
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

  (:action ralph-confirm
    :parameters (?s - slot)
    :precondition (available-ralph ?s)
    :effect (and (ralph-ok ?s))
    :cost 0
  )

  (:action peter-confirm
    :parameters (?s - slot)
    :precondition (available-peter ?s)
    :effect (and (peter-ok ?s))
    :cost 0
  )

  (:action daniel-confirm-preferred
    :parameters (?s - slot)
    :precondition (and (available-daniel ?s) (not (after-preferred ?s)))
    :effect (and (daniel-ok ?s))
    :cost 0
  )

  (:action daniel-confirm-after
    :parameters (?s - slot)
    :precondition (and (available-daniel ?s) (after-preferred ?s))
    :effect (and (daniel-ok ?s))
    :cost 1
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (ralph-ok ?s) (peter-ok ?s) (daniel-ok ?s) (not (meeting-scheduled)))
    :effect (meeting-scheduled)
    :cost 0
  )
)