(define (domain combined-meeting)
  (:requirements :strips :typing :negative-preconditions :adl)
  (:types person halfslot)
  (:predicates
    (next ?s ?n - halfslot)
    (free ?p - person ?s - halfslot)
    (occupied ?s - halfslot)
    (meeting_michelle ?s - halfslot)
    (meeting_steven ?s - halfslot)
    (meeting_jerry ?s - halfslot)
    (meeting ?s ?n - halfslot)
  )

  (:action schedule_michelle
    :parameters (?s ?n - halfslot)
    :precondition (and (next ?s ?n) (free michelle ?s) (free michelle ?n))
    :effect (and (meeting_michelle ?s))
  )

  (:action schedule_steven
    :parameters (?s ?n - halfslot)
    :precondition (and (next ?s ?n) (free steven ?s) (free steven ?n))
    :effect (and (meeting_steven ?s))
  )

  (:action schedule_jerry
    :parameters (?s ?n - halfslot)
    :precondition (and (next ?s ?n) (free jerry ?s) (free jerry ?n))
    :effect (and (meeting_jerry ?s))
  )

  (:action confirm_meeting
    :parameters (?s ?n - halfslot)
    :precondition (and
      (next ?s ?n)
      (meeting_michelle ?s)
      (meeting_steven ?s)
      (meeting_jerry ?s)
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
  )
)