(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location slot)

  (:predicates
    (at ?p - person ?loc - location ?s - slot)
    (succ ?s1 - slot ?s2 - slot)
    (william_available ?loc - location ?s - slot)
    (met_william)
  )

  (:action wait
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

  (:action travel_nob_to_castro
    :parameters (?p - person ?s1 - slot ?s2 - slot ?s3 - slot)
    :precondition (and
      (at ?p nob_hill ?s1)
      (succ ?s1 ?s2)
      (succ ?s2 ?s3)
    )
    :effect (and
      (at ?p the_castro ?s3)
      (not (at ?p nob_hill ?s1))
    )
  )

  (:action travel_castro_to_nob
    :parameters (?p - person ?s1 - slot ?s2 - slot ?s3 - slot)
    :precondition (and
      (at ?p the_castro ?s1)
      (succ ?s1 ?s2)
      (succ ?s2 ?s3)
    )
    :effect (and
      (at ?p nob_hill ?s3)
      (not (at ?p the_castro ?s1))
    )
  )

  (:action meet_william
    :parameters (?p - person
                 ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot ?s5 - slot)
    :precondition (and
      (at ?p the_castro ?s1)
      (at ?p the_castro ?s2)
      (at ?p the_castro ?s3)
      (at ?p the_castro ?s4)
      (at ?p the_castro ?s5)

      (william_available the_castro ?s1)
      (william_available the_castro ?s2)
      (william_available the_castro ?s3)
      (william_available the_castro ?s4)
      (william_available the_castro ?s5)

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