(define (domain meeting-scheduling)
  (:predicates
    (slot ?s)
    (free ?a ?s)
    (approved ?a ?s)
    (scheduled ?s)
  )

  ;; Adam approves a slot if he is free at that slot
  (:action adam-approve
    :parameters (?s)
    :precondition (free adam ?s)
    :effect (approved adam ?s)
  )

  ;; Jerry approves a slot if he is free at that slot
  (:action jerry-approve
    :parameters (?s)
    :precondition (free jerry ?s)
    :effect (approved jerry ?s)
  )

  ;; Matthew approves a slot if he is free at that slot
  (:action matthew-approve
    :parameters (?s)
    :precondition (free matthew ?s)
    :effect (approved matthew ?s)
  )

  ;; Commit the meeting when all agents have approved the same slot
  (:action commit
    :parameters (?s)
    :precondition (and (approved adam ?s) (approved jerry ?s) (approved matthew ?s))
    :effect (scheduled ?s)
  )
)