(define (domain meeting-scheduling-multiagent)
  (:requirements :typing :strips)
  (:types agent slot)
  (:constants margaret donna helen - agent)
  (:predicates
    (available ?a - agent ?s - slot)
    (approved ?a - agent ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action margaret-approve
    :parameters (?s - slot)
    :precondition (available margaret ?s)
    :effect (approved margaret ?s)
  )

  (:action donna-approve
    :parameters (?s - slot)
    :precondition (available donna ?s)
    :effect (approved donna ?s)
  )

  (:action helen-approve
    :parameters (?s - slot)
    :precondition (available helen ?s)
    :effect (approved helen ?s)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (approved margaret ?s)
      (approved donna ?s)
      (approved helen ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )
)