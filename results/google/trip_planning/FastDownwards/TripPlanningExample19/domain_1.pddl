(define (domain trip-planning-example19)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (flight ?from - city ?to - city)
    (succ ?d1 - day ?d2 - day)
    (visited ?c - city)
    (allowed_meeting ?d - day)
    (meeting_done)
    (is_nice ?c - city)
    (total_days_9)
    (pref_brussels_2)
    (pref_valencia_3)
    (pref_nice_6)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (succ ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2) (visited ?c))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (succ ?d1 ?d2) (flight ?from ?to))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2) (visited ?to))
  )

  (:action meet
    :parameters (?c - city ?d - day)
    :precondition (and (not (meeting_done)) (allowed_meeting ?d) (at ?c ?d) (is_nice ?c))
    :effect (and (meeting_done))
  )
)