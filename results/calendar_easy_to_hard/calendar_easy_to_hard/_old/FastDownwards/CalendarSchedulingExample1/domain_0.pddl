(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (available ?a - agent ?s - slot)
    (preferred ?a - agent ?s - slot)
    (work-slot ?s - slot)
    (chosen ?a - agent ?s - slot)
    (scheduled ?s - slot)
    (attending ?a - agent ?s - slot)
  )

  ;; Raymond's choose action (kept distinct)
  (:action choose-raymond
    :parameters (?s - slot)
    :precondition (and (work-slot ?s) (available raymond ?s) (not (chosen raymond ?s)))
    :effect (chosen raymond ?s)
  )

  ;; Billy's choose action (kept distinct)
  (:action choose-billy
    :parameters (?s - slot)
    :precondition (and (work-slot ?s) (available billy ?s) (not (chosen billy ?s)))
    :effect (chosen billy ?s)
  )

  ;; Donald's choose action (kept distinct)
  (:action choose-donald
    :parameters (?s - slot)
    :precondition (and (work-slot ?s) (available donald ?s) (not (chosen donald ?s)))
    :effect (chosen donald ?s)
  )

  ;; Finalize meeting once all three have chosen the same slot
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (chosen raymond ?s) (chosen billy ?s) (chosen donald ?s) (not (scheduled ?s)))
    :effect (and (scheduled ?s)
                 (attending raymond ?s)
                 (attending billy ?s)
                 (attending donald ?s))
  )
)