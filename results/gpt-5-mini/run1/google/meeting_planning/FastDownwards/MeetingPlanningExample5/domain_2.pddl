(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location slot)

  (:predicates
    (at ?p - person ?loc - location ?s - slot)
    (succ ?s1 - slot ?s2 - slot)
    (william_available ?loc - location ?s - slot)
    (met_william)
  )

  (:action stay
    :parameters (?p - person ?loc - location ?s1 - slot ?s2 - slot)
    :precondition (and
      (at ?p ?loc ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (at ?p ?loc ?s2)
      (not (at ?p ?loc ?s1))
    )
  )

  (:action move
    :parameters (?p - person ?from - location ?to - location ?s1 - slot ?s2 - slot ?s3 - slot)
    :precondition (and
      (at ?p ?from ?s1)
      (succ ?s1 ?s2)
      (succ ?s2 ?s3)
    )
    :effect (and
      (at ?p ?to ?s3)
      (not (at ?p ?from ?s1))
    )
  )

  (:action register_meeting_with_william
    :parameters (?p - person ?loc - location ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot ?s5 - slot)
    :precondition (and
      (at ?p ?loc ?s1)
      (at ?p ?loc ?s2)
      (at ?p ?loc ?s3)
      (at ?p ?loc ?s4)
      (at ?p ?loc ?s5)
      (william_available ?loc ?s1)
      (william_available ?loc ?s2)
      (william_available ?loc ?s3)
      (william_available ?loc ?s4)
      (william_available ?loc ?s5)
      (succ ?s1 ?s2)
      (succ ?s2 ?s3)
      (succ ?s3 ?s4)
      (succ ?s4 ?s5)
    )
    :effect (and
      (met_william)
    )
  )
)