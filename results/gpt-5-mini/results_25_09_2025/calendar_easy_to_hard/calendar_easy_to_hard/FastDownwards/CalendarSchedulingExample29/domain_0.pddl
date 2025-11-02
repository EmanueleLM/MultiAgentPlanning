(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (available ?a - agent ?s - slot)
    (approved ?a - agent ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  ;; Actions are kept distinct per agent as requested.
  (:action madison-approve
    :parameters (?s - slot)
    :precondition (available madison ?s)
    :effect (approved madison ?s)
  )

  (:action diana-approve
    :parameters (?s - slot)
    :precondition (available diana ?s)
    :effect (approved diana ?s)
  )

  (:action shirley-approve
    :parameters (?s - slot)
    :precondition (available shirley ?s)
    :effect (approved shirley ?s)
  )

  ;; Finalize the meeting once all three agents have approved the same slot.
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (approved madison ?s) (approved diana ?s) (approved shirley ?s))
    :effect (and (scheduled ?s) (meeting-scheduled))
  )
)