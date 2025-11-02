(define (domain combined-europe-trip)
  (:requirements :strips :typing :negative-preconditions :equality :adl :conditional-effects :action-costs)
  (:types city day)

  (:predicates
    (at ?c - city)
    (at-day ?c - city ?d - day)

    (connected ?from - city ?to - city)
    (flight ?from - city ?to - city)

    (visited ?c - city)

    (relatives-visited)
    (visited-relatives)

    (next ?d1 - day ?d2 - day)
    (is-dublin ?c - city)
    (is-valencia ?c - city)
    (in-rel-window ?d - day)

    (oslo-count-0) (oslo-count-1) (oslo-count-2) (oslo-count-3)
    (valencia-count-0) (valencia-count-1) (valencia-count-2) (valencia-count-3) (valencia-count-4) (valencia-count-5)
    (dublin-count-0) (dublin-count-1) (dublin-count-2) (dublin-count-3)
  )

  (:action start-at
    :parameters (?c - city ?d - day)
    :precondition (and (not (at ?c)) (not (at-day ?c ?d)))
    :effect (and
      (at ?c)
      (at-day ?c ?d)
    )
    :cost 0
  )

  (:action record-visited
    :parameters (?c - city)
    :precondition (at ?c)
    :effect (visited ?c)
    :cost 0
  )

  (:action record-visited-day
    :parameters (?c - city ?d - day)
    :precondition (at-day ?c ?d)
    :effect (visited ?c)
    :cost 0
  )

  (:action a1-fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from) (at-day ?from ?d) (connected ?from ?to))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (at-day ?from ?d))
      (at-day ?to ?d)
      (visited ?to)
    )
    :cost 0
  )

  (:action a1-stay-in-oslo
    :parameters (?d - day ?d2 - day)
    :precondition (and (at oslo) (at-day oslo ?d) (next ?d ?d2))
    :effect (and
      (not (at-day oslo ?d))
      (at-day oslo ?d2)
      (visited oslo)
      (when (oslo-count-0) (and (not (oslo-count-0)) (oslo-count-1)))
      (when (oslo-count-1) (and (not (oslo-count-1)) (oslo-count-2)))
      (when (oslo-count-2) (and (not (oslo-count-2)) (oslo-count-3)))
      (when (oslo-count-3) (oslo-count-3))
    )
    :cost 1
  )

  (:action a1-stay-in-city
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c) (not (= ?c oslo)) (at-day ?c ?d) (next ?d ?d2))
    :effect (and
      (not (at-day ?c ?d))
      (at-day ?c ?d2)
      (visited ?c)
      (when (and (is-valencia ?c) (valencia-count-0)) (and (not (valencia-count-0)) (valencia-count-1)))
      (when (and (is-valencia ?c) (valencia-count-1)) (and (not (valencia-count-1)) (valencia-count-2)))
      (when (and (is-valencia ?c) (valencia-count-2)) (and (not (valencia-count-2)) (valencia-count-3)))
      (when (and (is-valencia ?c) (valencia-count-3)) (and (not (valencia-count-3)) (valencia-count-4)))
      (when (and (is-valencia ?c) (valencia-count-4)) (and (not (valencia-count-4)) (valencia-count-5)))
      (when (and (is-valencia ?c) (valencia-count-5)) (valencia-count-5))

      (when (and (is-dublin ?c) (dublin-count-0)) (and (not (dublin-count-0)) (dublin-count-1)))
      (when (and (is-dublin ?c) (dublin-count-1)) (and (not (dublin-count-1)) (dublin-count-2)))
      (when (and (is-dublin ?c) (dublin-count-2)) (and (not (dublin-count-2)) (dublin-count-3)))
      (when (and (is-dublin ?c) (dublin-count-3)) (dublin-count-3))
    )
    :cost 1
  )

  (:action a1-visit-relatives
    :parameters (?d - day)
    :precondition (and (at valencia) (at-day valencia ?d) (in-rel-window ?d))
    :effect (and
      (relatives-visited)
      (visited-relatives)
      (visited valencia)
    )
    :cost 0
  )

  (:action a2-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from) (at-day ?from ?d) (next ?d ?d2) (connected ?from ?to))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (at-day ?from ?d))
      (at-day ?to ?d2)
      (visited ?to)
    )
    :cost 1
  )

  (:action a2-stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c) (at-day ?c ?d) (next ?d ?d2))
    :effect (and
      (not (at-day ?c ?d))
      (at-day ?c ?d2)
      (visited ?c)
      (when (and (is-valencia ?c) (valencia-count-0)) (and (not (valencia-count-0)) (valencia-count-1)))
      (when (and (is-valencia ?c) (valencia-count-1)) (and (not (valencia-count-1)) (valencia-count-2)))
      (when (and (is-valencia ?c) (valencia-count-2)) (and (not (valencia-count-2)) (valencia-count-3)))
      (when (and (is-valencia ?c) (valencia-count-3)) (and (not (valencia-count-3)) (valencia-count-4)))
      (when (and (is-valencia ?c) (valencia-count-4)) (and (not (valencia-count-4)) (valencia-count-5)))
      (when (and (is-valencia ?c) (valencia-count-5)) (valencia-count-5))

      (when (and (is-dublin ?c) (dublin-count-0)) (and (not (dublin-count-0)) (dublin-count-1)))
      (when (and (is-dublin ?c) (dublin-count-1)) (and (not (dublin-count-1)) (dublin-count-2)))
      (when (and (is-dublin ?c) (dublin-count-2)) (and (not (dublin-count-2)) (dublin-count-3)))
      (when (and (is-dublin ?c) (dublin-count-3)) (dublin-count-3))
    )
    :cost 1
  )

  (:action a2-stay-valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and (at valencia) (at-day valencia ?d) (next ?d ?d2))
    :effect (and
      (not (at-day valencia ?d))
      (at-day valencia ?d2)
      (visited valencia)
      (when (valencia-count-0) (and (not (valencia-count-0)) (valencia-count-1)))
      (when (valencia-count-1) (and (not (valencia-count-1)) (valencia-count-2)))
      (when (valencia-count-2) (and (not (valencia-count-2)) (valencia-count-3)))
      (when (valencia-count-3) (and (not (valencia-count-3)) (valencia-count-4)))
      (when (valencia-count-4) (and (not (valencia-count-4)) (valencia-count-5)))
      (when (valencia-count-5) (valencia-count-5))
    )
    :cost 1
  )

  (:action a2-visit-relatives
    :parameters (?d - day)
    :precondition (and (at valencia) (at-day valencia ?d) (in-rel-window ?d))
    :effect (and
      (relatives-visited)
      (visited-relatives)
    )
    :cost 0
  )

  (:action a3-stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at-day ?c ?d) (next ?d ?d2) (at ?c))
    :effect (and
      (not (at-day ?c ?d))
      (at-day ?c ?d2)
      (when (and (is-dublin ?c) (dublin-count-0)) (and (not (dublin-count-0)) (dublin-count-1)))
      (when (and (is-dublin ?c) (dublin-count-1)) (and (not (dublin-count-1)) (dublin-count-2)))
      (when (and (is-dublin ?c) (dublin-count-2)) (and (not (dublin-count-2)) (dublin-count-3)))
      (when (and (is-dublin ?c) (dublin-count-3)) (dublin-count-3))
      (when (is-valencia ?c) (visited ?c))
      (when (and (is-valencia ?c) (in-rel-window ?d)) (visited-relatives))
      (visited ?c)
    )
    :cost 1
  )

  (:action a3-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at-day ?from ?d) (flight ?from ?to) (next ?d ?d2) (at ?from))
    :effect (and
      (not (at-day ?from ?d))
      (at-day ?to ?d2)
      (not (at ?from))
      (at ?to)
      (when (and (is-dublin ?from) (dublin-count-0)) (and (not (dublin-count-0)) (dublin-count-1)))
      (when (and (is-dublin ?from) (dublin-count-1)) (and (not (dublin-count-1)) (dublin-count-2)))
      (when (and (is-dublin ?from) (dublin-count-2)) (and (not (dublin-count-2)) (dublin-count-3)))
      (when (and (is-dublin ?from) (dublin-count-3)) (dublin-count-3))
      (when (is-valencia ?from) (visited ?from))
      (when (and (is-valencia ?from) (in-rel-window ?d)) (visited-relatives))
      (visited ?to)
    )
    :cost 1
  )
)