(define (domain trip-domain)
  (:requirements :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next ?d1 ?d2 - day)
    (first ?d - day)
    (assigned ?d - day)
    (at ?c - city ?d - day)
    (visited ?c - city)
    (direct ?c1 - city ?c2 - city)
    (unstarted)
    (met_friend)
    (meet_window ?d - day)
    (is_meet_city ?c - city)
  )

  (:action traveler_start
    :parameters (?c - city ?d - day)
    :precondition (and (unstarted) (first ?d) (not (assigned ?d)))
    :effect (and
             (not (unstarted))
             (at ?c ?d)
             (visited ?c)
             (assigned ?d)
            )
  )

  (:action traveler_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (not (assigned ?d2)))
    :effect (and
             (at ?c ?d2)
             (visited ?c)
             (assigned ?d2)
            )
  )

  (:action traveler_meet
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (meet_window ?d) (is_meet_city ?c))
    :effect (met_friend)
  )

  (:action flightoffice_fly
    :parameters (?src - city ?dst - city ?d1 - day ?d2 - day)
    :precondition (and (at ?src ?d1) (next ?d1 ?d2) (direct ?src ?dst) (not (assigned ?d2)))
    :effect (and
             (at ?dst ?d2)
             (visited ?dst)
             (assigned ?d2)
            )
  )
)