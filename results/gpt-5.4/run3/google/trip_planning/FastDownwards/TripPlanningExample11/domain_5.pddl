(define (domain tripplanningexample11)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d - day ?dnext - day)
    (current_day ?d - day)
    (at ?c - city)
    (stay_requirement ?c - city ?d - day)
    (conference_day ?d - day)
    (day_used ?d - day)
    (satisfied_stay ?c - city ?d - day)
    (satisfied_conference ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?dnext)
      (not (day_used ?d))
    )
    :effect (and
      (day_used ?d)
      (not (current_day ?d))
      (current_day ?dnext)
      (satisfied_stay ?c ?d)
    )
  )

  (:action stay_conference
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?dnext)
      (conference_day ?d)
      (not (day_used ?d))
    )
    :effect (and
      (day_used ?d)
      (not (current_day ?d))
      (current_day ?dnext)
      (satisfied_stay ?c ?d)
      (satisfied_conference ?d)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (current_day ?d)
      (next ?d ?dnext)
      (direct ?from ?to)
      (not (day_used ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (day_used ?d)
      (not (current_day ?d))
      (current_day ?dnext)
      (satisfied_stay ?to ?d)
    )
  )

  (:action fly_conference
    :parameters (?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (current_day ?d)
      (next ?d ?dnext)
      (direct ?from ?to)
      (conference_day ?d)
      (not (day_used ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (day_used ?d)
      (not (current_day ?d))
      (current_day ?dnext)
      (satisfied_stay ?to ?d)
      (satisfied_conference ?d)
    )
  )

  (:action stay_last_day
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (not (day_used ?d))
      (not (conference_day ?d))
    )
    :effect (and
      (day_used ?d)
      (satisfied_stay ?c ?d)
    )
  )

  (:action stay_last_day_conference
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (conference_day ?d)
      (not (day_used ?d))
    )
    :effect (and
      (day_used ?d)
      (satisfied_stay ?c ?d)
      (satisfied_conference ?d)
    )
  )
)