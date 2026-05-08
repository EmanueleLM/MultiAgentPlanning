(define (domain meet_betty_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (connected ?from - location ?to - location)
    (person_at ?p - person ?l - location)
    (available_for_meeting_at ?p - person ?t - time)
    (met ?p - person)
  )

  (:action wait_until_1653
    :parameters (?l - location)
    :precondition (and
      (at ?l)
      (current_time t_0900)
    )
    :effect (and
      (not (current_time t_0900))
      (current_time t_1653)
    )
  )

  (:action travel_richmond_to_financial
    :parameters ()
    :precondition (and
      (at richmond_district)
      (current_time t_1653)
      (connected richmond_district financial_district)
    )
    :effect (and
      (not (at richmond_district))
      (at financial_district)
      (not (current_time t_1653))
      (current_time t_1715)
    )
  )

  (:action meet_betty_for_60
    :parameters ()
    :precondition (and
      (at financial_district)
      (person_at betty financial_district)
      (current_time t_1715)
      (available_for_meeting_at betty t_1715)
      (not (met betty))
    )
    :effect (and
      (met betty)
      (not (current_time t_1715))
      (current_time t_1815)
    )
  )
)