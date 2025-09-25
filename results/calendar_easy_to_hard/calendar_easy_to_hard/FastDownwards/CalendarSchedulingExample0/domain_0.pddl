(define (domain meeting-scheduling-multiagent)
  (:requirements :typing :strips :quantified-preconditions)
  (:types agent halfslot start - halfslot)

  (:predicates
    (next ?s - start ?h - halfslot)        ; mapping from a start halfslot to the next halfslot (meeting occupies both)
    (free ?a - agent ?h - halfslot)        ; agent a is free during halfslot h
    (confirmed ?a - agent ?s - start)      ; agent a has confirmed availability for meeting starting at s (s and its next halfslot)
    (meeting-scheduled ?s - start)         ; meeting scheduled starting at s (length = 60 minutes)
  )

  ; Each agent has its own distinct confirm action
  (:action michelle_confirm
    :parameters (?s - start ?h2 - halfslot)
    :precondition (and (next ?s ?h2)
                       (free michelle ?s)
                       (free michelle ?h2))
    :effect (confirmed michelle ?s)
  )

  (:action steven_confirm
    :parameters (?s - start ?h2 - halfslot)
    :precondition (and (next ?s ?h2)
                       (free steven ?s)
                       (free steven ?h2))
    :effect (confirmed steven ?s)
  )

  (:action jerry_confirm
    :parameters (?s - start ?h2 - halfslot)
    :precondition (and (next ?s ?h2)
                       (free jerry ?s)
                       (free jerry ?h2))
    :effect (confirmed jerry ?s)
  )

  ; A single scheduling action that requires all three confirmations for the same start
  (:action schedule_meeting
    :parameters (?s - start)
    :precondition (and (confirmed michelle ?s)
                       (confirmed steven ?s)
                       (confirmed jerry ?s))
    :effect (meeting-scheduled ?s)
  )
)