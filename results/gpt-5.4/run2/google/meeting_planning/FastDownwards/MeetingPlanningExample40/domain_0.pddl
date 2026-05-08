(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (deborah_available ?t - time)
    (met ?p - person)
    (meeting_start ?p - person ?l - location ?t - time)
    (meeting_end ?p - person ?t - time)
    (travel_slot ?from - location ?to - location ?t1 - time ?t2 - time)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (travel_slot ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_deborah_min_75
    :parameters (?l - location ?t_start - time ?t_end - time)
    :precondition (and
      (at ?l)
      (current_time ?t_start)
      (meeting_start deborah ?l ?t_start)
      (meeting_end deborah ?t_end)
      (deborah_available ?t_start)
      (deborah_available ?t_end)
      (not (met deborah))
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
      (met deborah)
    )
  )
)