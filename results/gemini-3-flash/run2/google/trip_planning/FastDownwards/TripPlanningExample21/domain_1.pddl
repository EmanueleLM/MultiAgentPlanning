(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day step)
  (:predicates
    (at ?c - city ?d - day)
    (spent ?c - city ?d - day)
    (counted ?c - city ?d - day)
    (next ?d1 ?d2 - day)
    (succ ?s1 ?s2 - step)
    (can_fly ?c1 ?c2 - city)
    (count ?c - city ?s - step)
    (not_started)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and
      (not (not_started))
      (at ?c d1)
      (spent ?c d1)
    )
  )

  (:action fly
    :parameters (?cf - city ?ct - city ?d - day)
    :precondition (and
      (at ?cf ?d)
      (can_fly ?cf ?ct)
    )
    :effect (and
      (not (at ?cf ?d))
      (at ?ct ?d)
      (spent ?ct ?d)
    )
  )

  (:action advance_day
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?dn)
    )
    :effect (and
      (not (at ?c ?d))
      (at ?c ?dn)
      (spent ?c ?dn)
    )
  )

  (:action record_visit
    :parameters (?c - city ?d - day ?s1 - step ?s2 - step)
    :precondition (and
      (spent ?c ?d)
      (not (counted ?c ?d))
      (count ?c ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (count ?c ?s1))
      (count ?c ?s2)
      (counted ?c ?d)
    )
  )
)