(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (meeting_done)
    (day_free ?d - day)
  )

  (:action choose_start_dublin
    :parameters ()
    :precondition (day_free day1)
    :effect (and
      (at dublin day1)
      (not (day_free day1))
    )
  )

  (:action choose_start_porto
    :parameters ()
    :precondition (day_free day1)
    :effect (and
      (at porto day1)
      (not (day_free day1))
    )
  )

  (:action choose_start_venice
    :parameters ()
    :precondition (day_free day1)
    :effect (and
      (at venice day1)
      (not (day_free day1))
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next_day ?d1 ?d2)
      (day_free ?d2)
    )
    :effect (and
      (at ?c ?d2)
      (not (day_free ?d2))
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (direct ?from ?to)
      (day_free ?d2)
      (not (at ?from ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (not (day_free ?d2))
    )
  )

  (:action record_meeting_day1
    :parameters ()
    :precondition (and
      (at venice day1)
      (not (meeting_done))
    )
    :effect (meeting_done)
  )

  (:action record_meeting_day2
    :parameters ()
    :precondition (and
      (at venice day2)
      (not (meeting_done))
    )
    :effect (meeting_done)
  )

  (:action record_meeting_day3
    :parameters ()
    :precondition (and
      (at venice day3)
      (not (meeting_done))
    )
    :effect (meeting_done)
  )

  (:action record_meeting_day4
    :parameters ()
    :precondition (and
      (at venice day4)
      (not (meeting_done))
    )
    :effect (meeting_done)
  )
)