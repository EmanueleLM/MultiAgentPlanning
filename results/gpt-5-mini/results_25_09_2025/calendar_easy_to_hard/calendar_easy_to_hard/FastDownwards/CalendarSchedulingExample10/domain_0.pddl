(define (domain meeting-scheduling-multiagent)
  (:requirements :typing)
  (:types agent slot)

  (:predicates
    (agent ?a - agent)
    (slot ?s - slot)
    (available ?a - agent ?s - slot)
    (approved ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  ;; Diana's approval action (distinct per-agent action)
  (:action diana-approve
    :parameters (?s - slot)
    :precondition (and
      (available diana ?s)
    )
    :effect (and
      (approved diana ?s)
    )
  )

  ;; Ethan's approval action (distinct per-agent action)
  (:action ethan-approve
    :parameters (?s - slot)
    :precondition (and
      (available ethan ?s)
    )
    :effect (and
      (approved ethan ?s)
    )
  )

  ;; Janet's approval action (distinct per-agent action)
  (:action janet-approve
    :parameters (?s - slot)
    :precondition (and
      (available janet ?s)
    )
    :effect (and
      (approved janet ?s)
    )
  )

  ;; Finalize meeting once all agents have approved the same slot
  (:action finalize
    :parameters (?s - slot)
    :precondition (and
      (approved diana ?s)
      (approved ethan ?s)
      (approved janet ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
    )
  )
)