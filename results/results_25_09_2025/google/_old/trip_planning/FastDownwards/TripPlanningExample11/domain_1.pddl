(define (domain integrated_trip)
  (:requirements :strips :typing :negative-preconditions :equality :action-costs)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from ?to - city)
    (started)
    (current-day ?d - day)
    (next ?d1 ?d2 - day)     ; successor relation precomputed in problem
    (visited ?c - city)
    (conf9-done)
    (conf15-done)
    (attended9)
    (attended15)
  )

  ;; ---------------------------
  ;; Agent1 actions (names kept distinct)
  ;; ---------------------------

  ;; Begin itinerary: can be used once (not started). Consumes one day (advances day).
  (:action agent1-begin
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (not (started)) (current-day ?d) (next ?d ?d2))
    :effect (and
      (started)
      (at ?c)
      (visited ?c)
      (not (current-day ?d))
      (current-day ?d2)
    )
    :cost 1
  )

  ;; Stay one day in the current city (advances day and marks city visited)
  (:action agent1-stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c) (current-day ?d) (next ?d ?d2))
    :effect (and
      (visited ?c)
      (not (current-day ?d))
      (current-day ?d2)
    )
    :cost 1
  )

  ;; Take a direct flight (advances day)
  (:action agent1-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from) (direct ?from ?to) (current-day ?d) (next ?d ?d2))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current-day ?d))
      (current-day ?d2)
    )
    :cost 1
  )

  ;; Attend conference actions for exact days (do not advance day)
  (:action agent1-attend-day9
    :parameters ()
    :precondition (and (at valencia) (current-day day9) (not (conf9-done)))
    :effect (and
      (conf9-done)
      (attended9)
    )
    :cost 1
  )

  (:action agent1-attend-day15
    :parameters ()
    :precondition (and (at valencia) (current-day day15) (not (conf15-done)))
    :effect (and
      (conf15-done)
      (attended15)
    )
    :cost 1
  )

  ;; ---------------------------
  ;; Agent2 actions (names kept distinct)
  ;; ---------------------------

  (:action agent2-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from) (direct ?from ?to) (current-day ?d) (next ?d ?d2))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current-day ?d))
      (current-day ?d2)
    )
    :cost 1
  )

  (:action agent2-stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c) (current-day ?d) (next ?d ?d2))
    :effect (and
      (visited ?c)
      (not (current-day ?d))
      (current-day ?d2)
    )
    :cost 1
  )

  (:action agent2-attend-conference-day9
    :parameters ()
    :precondition (and (at valencia) (current-day day9) (not (attended9)))
    :effect (and
      (attended9)
      (conf9-done)
    )
    :cost 1
  )

  (:action agent2-attend-conference-day15
    :parameters ()
    :precondition (and (at valencia) (current-day day15) (not (attended15)))
    :effect (and
      (attended15)
      (conf15-done)
    )
    :cost 1
  )

)