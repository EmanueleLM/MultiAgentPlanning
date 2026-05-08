(define (domain sf_meet_kenneth)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time stage)

  (:predicates
    (at ?l - location)
    (now ?t - time)
    (connected ?from - location ?to - location)
    (next_time ?t1 - time ?t2 - time)
    (travel_11 ?t1 - time ?t2 - time)
    (available ?p - person ?t - time)
    (person_at ?p - person ?l - location)
    (meeting_stage ?s - stage)
    (stage_next ?s1 - stage ?s2 - stage)
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time ?l - location ?s - stage)
    :precondition (and
      (now ?t1)
      (next_time ?t1 ?t2)
      (at ?l)
      (meeting_stage ?s)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time ?s - stage)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (now ?t1)
      (travel_11 ?t1 ?t2)
      (meeting_stage ?s)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action continue_meeting
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time ?s1 - stage ?s2 - stage)
    :precondition (and
      (now ?t1)
      (next_time ?t1 ?t2)
      (at ?l)
      (person_at ?p ?l)
      (available ?p ?t1)
      (meeting_stage ?s1)
      (stage_next ?s1 ?s2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (not (meeting_stage ?s1))
      (meeting_stage ?s2)
    )
  )
)