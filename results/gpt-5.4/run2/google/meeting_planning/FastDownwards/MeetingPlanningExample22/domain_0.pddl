(define (domain san_francisco_andrew_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time meet_stage
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)

    (travel_22 ?from - location ?to - location ?depart - time ?arrive - time)
    (travel_24 ?from - location ?to - location ?depart - time ?arrive - time)
    (wait_step ?from - time ?to - time)

    (person_at ?p - person ?l - location)
    (available ?p - person ?t - time)

    (meeting_stage ?s - meet_stage)
    (next_stage ?s1 - meet_stage ?s2 - meet_stage)
  )

  (:action wait_before_or_after_meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition
      (and
        (current_time ?t1)
        (wait_step ?t1 ?t2)
        (or_not_used_dummy)
      )
    :effect
      (and
        (not (current_time ?t1))
        (current_time ?t2)
      )
  )

  (:action travel_presidio_to_union_square
    :parameters (?depart - time ?arrive - time)
    :precondition
      (and
        (at presido)
        (current_time ?depart)
        (travel_22 presido union_square ?depart ?arrive)
        (meeting_stage m0)
      )
    :effect
      (and
        (not (at presido))
        (at union_square)
        (not (current_time ?depart))
        (current_time ?arrive)
      )
  )

  (:action travel_union_square_to_presidio
    :parameters (?depart - time ?arrive - time)
    :precondition
      (and
        (at union_square)
        (current_time ?depart)
        (travel_24 union_square presido ?depart ?arrive)
        (meeting_stage m0)
      )
    :effect
      (and
        (not (at union_square))
        (at presido)
        (not (current_time ?depart))
        (current_time ?arrive)
      )
  )

  (:action meet_andrew_for_15
    :parameters (?t1 - time ?t2 - time ?s1 - meet_stage ?s2 - meet_stage)
    :precondition
      (and
        (at union_square)
        (person_at andrew union_square)
        (current_time ?t1)
        (wait_step ?t1 ?t2)
        (available andrew ?t1)
        (meeting_stage ?s1)
        (next_stage ?s1 ?s2)
      )
    :effect
      (and
        (not (current_time ?t1))
        (current_time ?t2)
        (not (meeting_stage ?s1))
        (meeting_stage ?s2)
      )
  )
)