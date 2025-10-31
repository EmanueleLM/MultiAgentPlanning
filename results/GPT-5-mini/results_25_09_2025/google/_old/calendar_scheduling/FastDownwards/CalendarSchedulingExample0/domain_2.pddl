(define (domain combined-meeting)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types person halfslot)
  (:predicates
    (next ?s ?n - halfslot)
    (free ?p - person ?s - halfslot)
    (occupied ?s - halfslot)
    (meeting-michelle ?s - halfslot)
    (meeting-steven ?s - halfslot)
    (meeting-jerry ?s - halfslot)
    (meeting ?s ?n - halfslot)
  )

  (:action schedule-michelle
    :parameters (?s ?n - halfslot)
    :precondition (and (next ?s ?n) (free michelle ?s) (free michelle ?n))
    :effect (and (meeting-michelle ?s))
    :cost 0
  )

  (:action schedule-steven
    :parameters (?s ?n - halfslot)
    :precondition (and (next ?s ?n) (free steven ?s) (free steven ?n))
    :effect (and (meeting-steven ?s))
    :cost 0
  )

  (:action schedule-jerry
    :parameters (?s ?n - halfslot)
    :precondition (and (next ?s ?n) (free jerry ?s) (free jerry ?n))
    :effect (and (meeting-jerry ?s))
    :cost 0
  )

  (:action confirm-meeting
    :parameters (?s ?n - halfslot)
    :precondition (and
      (next ?s ?n)
      (meeting-michelle ?s)
      (meeting-steven ?s)
      (meeting-jerry ?s)
      (not (occupied ?s))
      (not (occupied ?n))
    )
    :effect (and
      (meeting ?s ?n)
      (occupied ?s)
      (occupied ?n)
      (not (free michelle ?s))
      (not (free michelle ?n))
      (not (free steven ?s))
      (not (free steven ?n))
      (not (free jerry ?s))
      (not (free jerry ?n))
    )
    :cost 1
  )
)