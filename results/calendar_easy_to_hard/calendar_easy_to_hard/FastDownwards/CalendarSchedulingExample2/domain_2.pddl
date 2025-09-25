(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types agent slot)
  (:constants roy kathryn amy - agent)

  (:predicates
    (available ?a - agent ?s - slot)
    (confirmed ?a - agent ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  (:action roy-confirm
    :parameters (?s - slot)
    :precondition (and (available roy ?s) (not (confirmed roy ?s)) (not (meeting-scheduled)))
    :effect (confirmed roy ?s)
  )

  (:action kathryn-confirm
    :parameters (?s - slot)
    :precondition (and (available kathryn ?s) (not (confirmed kathryn ?s)) (not (meeting-scheduled)))
    :effect (confirmed kathryn ?s)
  )

  (:action amy-confirm
    :parameters (?s - slot)
    :precondition (and (available amy ?s) (not (confirmed amy ?s)) (not (meeting-scheduled)))
    :effect (confirmed amy ?s)
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (confirmed roy ?s) (confirmed kathryn ?s) (confirmed amy ?s) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (meeting-at ?s))
  )
)