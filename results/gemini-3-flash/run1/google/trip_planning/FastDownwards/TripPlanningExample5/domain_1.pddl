(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at ?c - city ?d - day)
    (count ?c - city ?n - count)
    (flight ?c1 - city ?c2 - city)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (conf_d12_attended)
    (conf_d16_attended)
  )

  ;; Stay in the current city for one more day, incrementing its stay count.
  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?c_from - count ?c_to - count)
    :precondition (and
      (at ?c ?d_from)
      (next_day ?d_from ?d_to)
      (count ?c ?c_from)
      (next_count ?c_from ?c_to)
    )
    :effect (and
      (not (at ?c ?d_from))
      (at ?c ?d_to)
      (not (count ?c ?c_from))
      (count ?c ?c_to)
    )
  )

  ;; Travel from one city to another. The travel day counts as a stay day for both cities.
  (:action travel
    :parameters (?from - city ?to - city ?d_from - day ?d_to - day ?cf_from - count ?cf_to - count ?ct_from - count ?ct_to - count)
    :precondition (and
      (at ?from ?d_from)
      (flight ?from ?to)
      (next_day ?d_from ?d_to)
      (count ?from ?cf_from)
      (next_count ?cf_from ?cf_to)
      (count ?to ?ct_from)
      (next_count ?ct_from ?ct_to)
    )
    :effect (and
      (not (at ?from ?d_from))
      (at ?to ?d_to)
      (not (count ?from ?cf_from))
      (count ?from ?cf_to)
      (not (count ?to ?ct_from))
      (count ?to ?ct_to)
    )
  )

  ;; Check-in for the conference on Day 12 in Dubrovnik.
  (:action attend_conference_d12
    :parameters ()
    :precondition (at dubrovnik d12)
    :effect (conf_d12_attended)
  )

  ;; Check-in for the conference on Day 16 in Dubrovnik.
  (:action attend_conference_d16
    :parameters ()
    :precondition (at dubrovnik d16)
    :effect (conf_d16_attended)
  )
)