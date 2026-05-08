(define (domain san_francisco_meet_carol)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (connected ?from - location ?to - location)
    (travel_arrives ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (next_time ?from - timepoint ?to - timepoint)
    (person_at ?p - person ?l - location)
    (available_at ?p - person ?t - timepoint)
    (meeting_started ?p - person)
    (met ?p - person)
    (started_at_2_00pm ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (connected ?from ?to)
      (travel_arrives ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action wait
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (current_time ?from)
      (next_time ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action start_meeting_at_2_00pm
    :parameters (?p - person ?l - location)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time t_2_00pm)
      (available_at ?p t_2_00pm)
      (not (meeting_started ?p))
      (not (met ?p))
    )
    :effect (and
      (meeting_started ?p)
      (started_at_2_00pm ?p)
    )
  )

  (:action finish_75_min_meeting
    :parameters (?p - person)
    :precondition (and
      (meeting_started ?p)
      (started_at_2_00pm ?p)
      (current_time t_2_00pm)
      (available_at ?p t_2_00pm)
      (available_at ?p t_3_15pm)
      (at sunset_district)
      (person_at ?p sunset_district)
      (not (met ?p))
    )
    :effect (and
      (not (current_time t_2_00pm))
      (current_time t_3_15pm)
      (met ?p)
    )
  )
)