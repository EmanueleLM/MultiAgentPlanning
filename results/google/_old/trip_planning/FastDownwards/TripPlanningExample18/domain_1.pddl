(define (domain combined-travel)
  (:requirements :typing :negative-preconditions :equality :conditional-effects :action-costs)
  (:types city dayval count)

  (:predicates
    (in ?c - city)
    (at ?c - city)
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (is-bucharest ?c - city)
    (met-friends)
    (met)
    (started)

    ;; day encoding
    (day ?d - dayval)
    (succ ?d ?dnext - dayval)
    (is-start ?d - dayval)

    ;; allowed-day ranges precomputed in problem
    (allow-advance ?d - dayval)
    (allow-flight ?d - dayval)
    (allow-wait ?d - dayval)
    (meet-window ?d - dayval)

    ;; remaining stay counts: remain ?city ?count
    (remain ?c - city ?n - count)
  )

  (:functions
    (total-cost)
  )

  ;; Traveler actions
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

      ;; decrement remain if positive: cascade conditional effects for counts c1..c6 -> c0..c5
      (when (remain ?c c6) (and (not (remain ?c c6)) (remain ?c c5)))
      (when (remain ?c c5) (and (not (remain ?c c5)) (remain ?c c4)))
      (when (remain ?c c4) (and (not (remain ?c c4)) (remain ?c c3)))
      (when (remain ?c c3) (and (not (remain ?c c3)) (remain ?c c2)))
      (when (remain ?c c2) (and (not (remain ?c c2)) (remain ?c c1)))
      (when (remain ?c c1) (and (not (remain ?c c1)) (remain ?c c0)))
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

      (when (remain ?c c6) (and (not (remain ?c c6)) (remain ?c c5)))
      (when (remain ?c c5) (and (not (remain ?c c5)) (remain ?c c4)))
      (when (remain ?c c4) (and (not (remain ?c c4)) (remain ?c c3)))
      (when (remain ?c c3) (and (not (remain ?c c3)) (remain ?c c2)))
      (when (remain ?c c2) (and (not (remain ?c c2)) (remain ?c c1)))
      (when (remain ?c c1) (and (not (remain ?c c1)) (remain ?c c0)))
    )
  )

  ;; Flight-planner actions
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