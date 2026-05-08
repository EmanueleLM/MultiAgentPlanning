(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent person location timepoint
  )

  (:predicates
    (at ?a - agent ?l - location)
    (person_at ?p - person ?l - location)
    (current_time ?t - timepoint)
    (wait_step ?t1 - timepoint ?t2 - timepoint)
    (travel_step ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (meeting_step_75 ?p - person ?t1 - timepoint ?t2 - timepoint)
    (available_to_meet ?p - person ?t - timepoint)
    (meeting_start_ok_75 ?p - person ?t - timepoint)
    (met_minimum ?p - person)
  )

  (:action wait
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current_time ?t1)
      (wait_step ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?a ?from)
      (current_time ?t1)
      (travel_step ?from ?to ?t1 ?t2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_for_75_minutes
    :parameters (?a - agent ?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current_time ?t1)
      (at ?a ?l)
      (person_at ?p ?l)
      (available_to_meet ?p ?t1)
      (meeting_start_ok_75 ?p ?t1)
      (meeting_step_75 ?p ?t1 ?t2)
      (not (met_minimum ?p))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (met_minimum ?p)
    )
  )
)