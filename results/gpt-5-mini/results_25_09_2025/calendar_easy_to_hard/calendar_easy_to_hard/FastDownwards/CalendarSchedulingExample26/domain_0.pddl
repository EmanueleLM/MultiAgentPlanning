(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)
    (reserved-katherine ?s1 - slot ?s2 - slot)
    (reserved-nicole ?s1 - slot ?s2 - slot)
    (reserved-kevin ?s1 - slot ?s2 - slot)
    (succ ?s1 - slot ?s2 - slot)
    (meeting-scheduled ?s1 - slot ?s2 - slot)
  )

  ;; Katherine makes a reservation for two consecutive slots
  (:action reserve-katherine
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and (succ ?s1 ?s2) (free katherine ?s1) (free katherine ?s2))
    :effect (and
      (reserved-katherine ?s1 ?s2)
      (not (free katherine ?s1))
      (not (free katherine ?s2))
    )
  )

  ;; Nicole makes a reservation for two consecutive slots
  (:action reserve-nicole
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and (succ ?s1 ?s2) (free nicole ?s1) (free nicole ?s2))
    :effect (and
      (reserved-nicole ?s1 ?s2)
      (not (free nicole ?s1))
      (not (free nicole ?s2))
    )
  )

  ;; Kevin makes a reservation for two consecutive slots
  (:action reserve-kevin
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and (succ ?s1 ?s2) (free kevin ?s1) (free kevin ?s2))
    :effect (and
      (reserved-kevin ?s1 ?s2)
      (not (free kevin ?s1))
      (not (free kevin ?s2))
    )
  )

  ;; Confirm meeting once all participants reserved the same consecutive pair
  (:action confirm-meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and (reserved-katherine ?s1 ?s2)
                       (reserved-nicole ?s1 ?s2)
                       (reserved-kevin ?s1 ?s2)
                       (not (meeting-scheduled ?s1 ?s2)))
    :effect (and (meeting-scheduled ?s1 ?s2))
  )
)