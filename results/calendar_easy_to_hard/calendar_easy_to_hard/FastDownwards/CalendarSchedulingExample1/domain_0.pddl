(define (domain multi-agent-meeting)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types agent slot)

  (:predicates
    (available ?a - agent ?s - slot)
    (preferred ?a - agent ?s - slot)
    (attending ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:functions
    (score) ; numeric fluent to count satisfied preferences
  )

  ;; Raymond's attend actions (preferred and non-preferred)
  (:action attend-raymond-preferred
    :parameters (?s - slot)
    :precondition (and (available raymond ?s) (preferred raymond ?s) (not (attending raymond ?s)))
    :effect (and (attending raymond ?s) (increase (score) 1))
  )

  (:action attend-raymond
    :parameters (?s - slot)
    :precondition (and (available raymond ?s) (not (preferred raymond ?s)) (not (attending raymond ?s)))
    :effect (and (attending raymond ?s))
  )

  ;; Billy's attend actions (preferred and non-preferred)
  (:action attend-billy-preferred
    :parameters (?s - slot)
    :precondition (and (available billy ?s) (preferred billy ?s) (not (attending billy ?s)))
    :effect (and (attending billy ?s) (increase (score) 1))
  )

  (:action attend-billy
    :parameters (?s - slot)
    :precondition (and (available billy ?s) (not (preferred billy ?s)) (not (attending billy ?s)))
    :effect (and (attending billy ?s))
  )

  ;; Donald's attend actions (preferred and non-preferred)
  (:action attend-donald-preferred
    :parameters (?s - slot)
    :precondition (and (available donald ?s) (preferred donald ?s) (not (attending donald ?s)))
    :effect (and (attending donald ?s) (increase (score) 1))
  )

  (:action attend-donald
    :parameters (?s - slot)
    :precondition (and (available donald ?s) (not (preferred donald ?s)) (not (attending donald ?s)))
    :effect (and (attending donald ?s))
  )

  ;; Finalize the meeting once all three are attending the same slot
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (attending raymond ?s) (attending billy ?s) (attending donald ?s) (not (meeting-scheduled ?s)))
    :effect (meeting-scheduled ?s)
  )
)