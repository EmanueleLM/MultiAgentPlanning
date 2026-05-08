(define (domain trip_planning_example46)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (visited ?d - day ?c - city)

    (need_visit_seville_5)
    (need_visit_seville_4)
    (need_visit_seville_3)
    (need_visit_seville_2)
    (need_visit_seville_1)
    (need_visit_seville_0)

    (need_visit_manchester_5)
    (need_visit_manchester_4)
    (need_visit_manchester_3)
    (need_visit_manchester_2)
    (need_visit_manchester_1)
    (need_visit_manchester_0)

    (need_visit_stockholm_3)
    (need_visit_stockholm_2)
    (need_visit_stockholm_1)
    (need_visit_stockholm_0)

    (finished)
  )

  (:action stay_generic
    :parameters (?d - day ?dn - day ?c - city)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at ?c)
    )
    :effect (and
      (visited ?d ?c)
      (not (current ?d))
      (current ?dn)
    )
  )

  (:action stay_last
    :parameters (?d - day ?c - city)
    :precondition (and
      (current ?d)
      (at ?c)
    )
    :effect (and
      (visited ?d ?c)
      (not (current ?d))
      (finished)
    )
  )

  (:action fly_generic
    :parameters (?d - day ?dn - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at ?from)
      (direct ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (visited ?d ?from)
      (not (current ?d))
      (current ?dn)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action consume_visit_seville
    :parameters (?d - day)
    :precondition (and
      (visited ?d seville)
      (need_visit_seville_5)
    )
    :effect (and
      (not (need_visit_seville_5))
      (need_visit_seville_4))
  )

  (:action consume_visit_seville_4
    :parameters (?d - day)
    :precondition (and
      (visited ?d seville)
      (need_visit_seville_4)
    )
    :effect (and
      (not (need_visit_seville_4))
      (need_visit_seville_3))
  )

  (:action consume_visit_seville_3
    :parameters (?d - day)
    :precondition (and
      (visited ?d seville)
      (need_visit_seville_3)
    )
    :effect (and
      (not (need_visit_seville_3))
      (need_visit_seville_2))
  )

  (:action consume_visit_seville_2
    :parameters (?d - day)
    :precondition (and
      (visited ?d seville)
      (need_visit_seville_2)
    )
    :effect (and
      (not (need_visit_seville_2))
      (need_visit_seville_1))
  )

  (:action consume_visit_seville_1
    :parameters (?d - day)
    :precondition (and
      (visited ?d seville)
      (need_visit_seville_1)
    )
    :effect (and
      (not (need_visit_seville_1))
      (need_visit_seville_0))
  )

  (:action consume_visit_manchester
    :parameters (?d - day)
    :precondition (and
      (visited ?d manchester)
      (need_visit_manchester_5)
    )
    :effect (and
      (not (need_visit_manchester_5))
      (need_visit_manchester_4))
  )

  (:action consume_visit_manchester_4
    :parameters (?d - day)
    :precondition (and
      (visited ?d manchester)
      (need_visit_manchester_4)
    )
    :effect (and
      (not (need_visit_manchester_4))
      (need_visit_manchester_3))
  )

  (:action consume_visit_manchester_3
    :parameters (?d - day)
    :precondition (and
      (visited ?d manchester)
      (need_visit_manchester_3)
    )
    :effect (and
      (not (need_visit_manchester_3))
      (need_visit_manchester_2))
  )

  (:action consume_visit_manchester_2
    :parameters (?d - day)
    :precondition (and
      (visited ?d manchester)
      (need_visit_manchester_2)
    )
    :effect (and
      (not (need_visit_manchester_2))
      (need_visit_manchester_1))
  )

  (:action consume_visit_manchester_1
    :parameters (?d - day)
    :precondition (and
      (visited ?d manchester)
      (need_visit_manchester_1)
    )
    :effect (and
      (not (need_visit_manchester_1))
      (need_visit_manchester_0))
  )

  (:action consume_visit_stockholm
    :parameters (?d - day)
    :precondition (and
      (visited ?d stockholm)
      (need_visit_stockholm_3)
    )
    :effect (and
      (not (need_visit_stockholm_3))
      (need_visit_stockholm_2))
  )

  (:action consume_visit_stockholm_2
    :parameters (?d - day)
    :precondition (and
      (visited ?d stockholm)
      (need_visit_stockholm_2)
    )
    :effect (and
      (not (need_visit_stockholm_2))
      (need_visit_stockholm_1))
  )

  (:action consume_visit_stockholm_1
    :parameters (?d - day)
    :precondition (and
      (visited ?d stockholm)
      (need_visit_stockholm_1)
    )
    :effect (and
      (not (need_visit_stockholm_1))
      (need_visit_stockholm_0))
  )
)