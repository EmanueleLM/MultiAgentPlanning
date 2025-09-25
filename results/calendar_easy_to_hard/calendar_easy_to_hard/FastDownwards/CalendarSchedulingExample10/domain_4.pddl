(define (domain meeting-scheduling-multiagent)
  (:requirements :typing :adl)
  (:types agent slot)

  (:predicates
    (available ?a - agent ?s - slot)
    (approved ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:action diana-approve
    :parameters (?s - slot)
    :precondition (and (available diana ?s))
    :effect (and (approved diana ?s))
  )

  (:action ethan-approve
    :parameters (?s - slot)
    :precondition (and (available ethan ?s))
    :effect (and (approved ethan ?s))
  )

  (:action janet-approve
    :parameters (?s - slot)
    :precondition (and (available janet ?s))
    :effect (and (approved janet ?s))
  )

  (:action finalize
    :parameters (?s - slot)
    :precondition (and (approved diana ?s) (approved ethan ?s) (approved janet ?s) (not (meeting-scheduled ?s)))
    :effect (and (meeting-scheduled ?s))
  )
)