(define (domain combined-travel)
  (:requirements :typing :negative-preconditions :equality :conditional-effects :action-costs)
  (:types city dayval)

  (:predicates
    (in ?c - city)
    (at ?c - city)
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (is-bucharest ?c - city)
    (met-friends)
    (met)
    (started)

    (day ?d - dayval)
    (succ ?d ?dnext - dayval)
    (is-start ?d - dayval)

    (allow-advance ?d - dayval)
    (allow-flight ?d - dayval)
    (allow-wait ?d - dayval)
    (meet-window ?d - dayval)
  )

  (:functions
    (total-cost)
    (remain ?c - city)
  )

  (:action traveler-start-in
    :parameters (?c - city ?d - dayval)
    :precondition (and (day ?d) (is-start ?d) (not (started)))
    :effect (and
      (in ?c)
      (at ?c)
      (visited ?c)
      (started)
    )
  )

  (:action traveler-fly
    :parameters (?from - city ?to - city)
    :precondition (and (in ?from) (direct ?from ?to))
    :effect (and
      (not (in ?from))
      (in ?to)
      (not (at ?from))
      (at ?to)
      (visited ?to)
    )
  )

  (:action traveler-advance-day
    :parameters (?c - city ?d - dayval ?dnext - dayval)
    :precondition (and (in ?c) (day ?d) (succ ?d ?dnext) (allow-advance ?d))
    :effect (and
      (not (day ?d))
      (day ?dnext)
      (increase (total-cost) 1)
      (when (> (remain ?c) 0) (increase (remain ?c) -1))
    )
  )

  (:action traveler-advance-day-meet
    :parameters (?c - city ?d - dayval ?dnext - dayval)
    :precondition (and (in ?c) (is-bucharest ?c) (day ?d) (succ ?d ?dnext) (meet-window ?d) (allow-advance ?d))
    :effect (and
      (not (day ?d))
      (day ?dnext)
      (met-friends)
      (increase (total-cost) 1)
      (when (> (remain ?c) 0) (increase (remain ?c) -1))
    )
  )

  (:action flight-fly
    :parameters (?from - city ?to - city ?d - dayval ?dnext - dayval)
    :precondition (and (at ?from) (direct ?from ?to) (day ?d) (succ ?d ?dnext) (allow-flight ?d))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (in ?from))
      (in ?to)
      (visited ?to)
      (not (day ?d))
      (day ?dnext)
      (increase (total-cost) 1)
    )
  )

  (:action flight-wait
    :parameters (?d - dayval ?dnext - dayval)
    :precondition (and (day ?d) (succ ?d ?dnext) (allow-wait ?d))
    :effect (and
      (not (day ?d))
      (day ?dnext)
      (increase (total-cost) 1)
    )
  )

  (:action flight-meet
    :parameters (?c - city ?d - dayval)
    :precondition (and (at ?c) (is-bucharest ?c) (not (met)) (day ?d) (meet-window ?d))
    :effect (met)
  )
)