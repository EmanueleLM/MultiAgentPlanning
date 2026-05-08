(define (domain san_francisco_meet_stephanie)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (travel_arrival ?from - location ?to - location ?depart - time ?arrive - time)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (person_at ?p - person ?l - location)
    (available_from ?p - person ?t - time)
    (available_until ?p - person ?t - time)
    (meeting_active ?p - person)
    (met_minimum ?p - person)
    (meeting_completion ?p - person ?start - time ?finish - time)
  )

  (:action move
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (current_time ?depart)
      (travel_arrival ?from ?to ?depart ?arrive)
      (not (meeting_active ?someone))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (meeting_active ?someone))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting
    :parameters (?p - person ?l - location ?t - time)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?t)
      (available_from ?p ?t)
      (not (meeting_active ?p))
      (not (met_minimum ?p))
    )
    :effect (and
      (meeting_active ?p)
    )
  )

  (:action continue_meeting_to_minimum
    :parameters (?p - person ?t_start - time ?t_finish - time ?l - location ?t_limit - time)
    :precondition (and
      (meeting_active ?p)
      (current_time ?t_start)
      (at ?l)
      (person_at ?p ?l)
      (meeting_completion ?p ?t_start ?t_finish)
      (available_until ?p ?t_limit)
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_finish)
      (not (meeting_active ?p))
      (met_minimum ?p)
    )
  )
)