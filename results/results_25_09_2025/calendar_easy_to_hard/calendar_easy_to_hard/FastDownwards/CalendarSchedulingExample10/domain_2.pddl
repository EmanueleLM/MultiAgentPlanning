(define (domain meeting-scheduling-multiagent)
  (:requirements :typing :fluents :action-costs)
  (:types agent slot)

  (:predicates
    (agent ?a - agent)
    (slot ?s - slot)
    (available ?a - agent ?s - slot)
    (approved ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:functions (total-cost))

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

  (:action finalize-s1000
    :parameters ()
    :precondition (and (approved diana s1000) (approved ethan s1000) (approved janet s1000))
    :effect (and (meeting-scheduled s1000) (increase (total-cost) 1))
  )

  (:action finalize-s1030
    :parameters ()
    :precondition (and (approved diana s1030) (approved ethan s1030) (approved janet s1030))
    :effect (and (meeting-scheduled s1030) (increase (total-cost) 2))
  )

  (:action finalize-s1100
    :parameters ()
    :precondition (and (approved diana s1100) (approved ethan s1100) (approved janet s1100))
    :effect (and (meeting-scheduled s1100) (increase (total-cost) 3))
  )
)