(define (domain multiagent-meeting)
  (:requirements :strips :typing :negative-preconditions :fluents :conditional-effects)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (confirmed ?p - person ?s - slot)
    (before-1430 ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )
  (:functions (total-cost))
  
  ;; Brandon's confirmation action: prefers to avoid slots before 14:30.
  ;; If Brandon confirms a slot before 14:30, this increases total-cost by 1 (a preference violation).
  (:action confirm-by-brandon
    :parameters (?s - slot)
    :precondition (and (free brandon ?s) (not (confirmed brandon ?s)) (not (meeting-scheduled)))
    :effect (and
      (confirmed brandon ?s)
      (when (before-1430 ?s) (increase (total-cost) 1))
    )
  )

  ;; Jerry has no preference; confirming simply records availability.
  (:action confirm-by-jerry
    :parameters (?s - slot)
    :precondition (and (free jerry ?s) (not (confirmed jerry ?s)) (not (meeting-scheduled)))
    :effect (and
      (confirmed jerry ?s)
    )
  )

  ;; Bradley confirmation action.
  (:action confirm-by-bradley
    :parameters (?s - slot)
    :precondition (and (free bradley ?s) (not (confirmed bradley ?s)) (not (meeting-scheduled)))
    :effect (and
      (confirmed bradley ?s)
    )
  )

  ;; Finalize meeting once all three have confirmed the same slot.
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (confirmed brandon ?s) (confirmed jerry ?s) (confirmed bradley ?s) (not (meeting-scheduled)))
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)