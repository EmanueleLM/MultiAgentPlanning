(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent timeslot)

  (:predicates
    (free ?a - agent ?t - timeslot)
    (accepted ?a - agent ?t - timeslot)
    (meeting-scheduled ?t - timeslot)
  )

  ;; Raymond's accept action
  (:action raymond-accept
    :parameters (?t - timeslot)
    :precondition (free raymond ?t)
    :effect (accepted raymond ?t)
  )

  ;; Billy's accept action
  (:action billy-accept
    :parameters (?t - timeslot)
    :precondition (free billy ?t)
    :effect (accepted billy ?t)
  )

  ;; Donald's accept action
  (:action donald-accept
    :parameters (?t - timeslot)
    :precondition (free donald ?t)
    :effect (accepted donald ?t)
  )

  ;; Finalize meeting once all three have accepted the same timeslot
  (:action finalize-meeting
    :parameters (?t - timeslot)
    :precondition (and (accepted raymond ?t) (accepted billy ?t) (accepted donald ?t))
    :effect (meeting-scheduled ?t)
  )
)