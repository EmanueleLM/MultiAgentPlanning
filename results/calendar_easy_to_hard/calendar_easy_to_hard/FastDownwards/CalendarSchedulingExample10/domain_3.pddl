(define (domain meeting-scheduling-multiagent)
  (:requirements :typing :action-costs :adl)
  (:types agent slot)

  (:predicates
    (agent ?a - agent)
    (slot ?s - slot)
    (available ?a - agent ?s - slot)
    (approved ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:action diana-approve
    :parameters (?s - slot)
    :precondition (and (available diana ?s))
    :effect (and (approved diana ?s))
    :cost 0
  )

  (:action ethan-approve
    :parameters (?s - slot)
    :precondition (and (available ethan ?s))
    :effect (and (approved ethan ?s))
    :cost 0
  )

  (:action janet-approve
    :parameters (?s - slot)
    :precondition (and (available janet ?s))
    :effect (and (approved janet ?s))
    :cost 0
  )

  (:action finalize-s1000
    :parameters ()
    :precondition (and (approved diana s1000) (approved ethan s1000) (approved janet s1000) (not (meeting-scheduled s1000)))
    :effect (and (meeting-scheduled s1000))
    :cost 1
  )

  (:action finalize-s1030
    :parameters ()
    :precondition (and (approved diana s1030) (approved ethan s1030) (approved janet s1030) (not (meeting-scheduled s1030)))
    :effect (and (meeting-scheduled s1030))
    :cost 2
  )

  (:action finalize-s1100
    :parameters ()
    :precondition (and (approved diana s1100) (approved ethan s1100) (approved janet s1100) (not (meeting-scheduled s1100)))
    :effect (and (meeting-scheduled s1100))
    :cost 3
  )
)