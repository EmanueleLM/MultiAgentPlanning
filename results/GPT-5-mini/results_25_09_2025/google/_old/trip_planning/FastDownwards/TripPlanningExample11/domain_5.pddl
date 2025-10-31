(define (domain integrated_trip)
  (:requirements :strips :typing :negative-preconditions :equality :action-costs)
  (:types city day token)

  (:predicates
    (at ?c - city)
    (direct ?from ?to - city)
    (current-day ?d - day)
    (next ?d1 ?d2 - day)
    (attended9)
    (attended15)
    (for-city ?t - token ?c - city)
    (consumed ?t - token)
    (conference-day ?d - day ?c - city)
  )

  (:action agent1-stay
    :parameters (?t - token ?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current-day ?d)
      (next ?d ?d2)
      (for-city ?t ?c)
      (not (consumed ?t))
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (consumed ?t)
    )
    :cost 1
  )

  (:action agent1-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current-day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current-day ?d))
      (current-day ?d2)
    )
    :cost 1
  )

  (:action agent1-attend-day9
    :parameters (?d - day ?c - city)
    :precondition (and
      (at ?c)
      (current-day ?d)
      (conference-day ?d ?c)
      (not (attended9))
    )
    :effect (attended9)
    :cost 0
  )

  (:action agent1-attend-day15
    :parameters (?d - day ?c - city)
    :precondition (and
      (at ?c)
      (current-day ?d)
      (conference-day ?d ?c)
      (not (attended15))
    )
    :effect (attended15)
    :cost 0
  )

  ;; Agent2 actions (kept distinct)
  (:action agent2-stay
    :parameters (?t - token ?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current-day ?d)
      (next ?d ?d2)
      (for-city ?t ?c)
      (not (consumed ?t))
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (consumed ?t)
    )
    :cost 1
  )

  (:action agent2-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current-day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current-day ?d))
      (current-day ?d2)
    )
    :cost 1
  )

  (:action agent2-attend-day9
    :parameters (?d - day ?c - city)
    :precondition (and
      (at ?c)
      (current-day ?d)
      (conference-day ?d ?c)
      (not (attended9))
    )
    :effect (attended9)
    :cost 0
  )

  (:action agent2-attend-day15
    :parameters (?d - day ?c - city)
    :precondition (and
      (at ?c)
      (current-day ?d)
      (conference-day ?d ?c)
      (not (attended15))
    )
    :effect (attended15)
    :cost 0
  )
)