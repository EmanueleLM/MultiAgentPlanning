(define (domain multiagent-meeting)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :action-costs :fluents)
  (:types person slot)
  (:constants brandon jerry bradley - person)
  (:predicates
    (free ?p - person ?s - slot)
    (confirmed ?p - person ?s - slot)
    (before-1430 ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )
  (:functions (total-cost))
  (:action confirm-by-brandon
    :parameters (?s - slot)
    :precondition (and (free brandon ?s) (not (confirmed brandon ?s)) (not (meeting-scheduled)))
    :effect (and
      (confirmed brandon ?s)
      (when (before-1430 ?s) (increase (total-cost) 1))
    )
  )
  (:action confirm-by-jerry
    :parameters (?s - slot)
    :precondition (and (free jerry ?s) (not (confirmed jerry ?s)) (not (meeting-scheduled)))
    :effect (and
      (confirmed jerry ?s)
    )
  )
  (:action confirm-by-bradley
    :parameters (?s - slot)
    :precondition (and (free bradley ?s) (not (confirmed bradley ?s)) (not (meeting-scheduled)))
    :effect (and
      (confirmed bradley ?s)
    )
  )
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (confirmed brandon ?s) (confirmed jerry ?s) (confirmed bradley ?s) (not (meeting-scheduled)))
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)