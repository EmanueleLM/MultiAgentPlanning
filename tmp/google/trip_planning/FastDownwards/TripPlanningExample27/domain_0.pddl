(define (domain integrated_trip_direct_flights)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    ;; common time/location predicates
    (at ?c - city ?d - day)            ; agent is at city c at day d
    (next ?d1 - day ?d2 - day)         ; d2 is the day after d1
    (direct ?from - city ?to - city)  ; direct flight connection (static)

    ;; city identity markers (from agent1)
    (is-amsterdam ?c - city)
    (is-istanbul ?c - city)
    (is-santorini ?c - city)

    ;; flags/goals from agents
    (stayed-amsterdam)                 ; agent1's 7-day Amsterdam stay satisfied
    (visited-relatives-santorini)      ; agent1's record of visiting relatives in Santorini (day 12..14)
    (relatives-visited-any)            ; agent2's predicate for relatives visit (one of day12..14)

    ;; agent2's optional start choice
    (will-start ?c - city)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; AGENT 1 actions (prefix a1_) - modeled to be distinct from others
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Agent1: stay in Amsterdam exactly 7 days starting at a given day.
  ;; This action requires being at amsterdam on the starting day ?d1 and the
  ;; existence of the successive next relations up to ?d7.
  ;; The effect adds at(amsterdam) facts for days ?d2..?d7 and marks stayed-amsterdam.
  (:action a1_stay_amsterdam_7
    :parameters (?d1 ?d2 ?d3 ?d4 ?d5 ?d6 ?d7 - day)
    :precondition (and
      (at amsterdam ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?d4)
      (next ?d4 ?d5) (next ?d5 ?d6) (next ?d6 ?d7)
      (is-amsterdam amsterdam)
    )
    :effect (and
      (at amsterdam ?d2) (at amsterdam ?d3) (at amsterdam ?d4)
      (at amsterdam ?d5) (at amsterdam ?d6) (at amsterdam ?d7)
      (stayed-amsterdam)
    )
  )

  ;; Agent1: optional 3-day stay in Istanbul (keeps action available if used).
  (:action a1_stay_istanbul_3
    :parameters (?d1 ?d2 ?d3 - day)
    :precondition (and (at istanbul ?d1) (next ?d1 ?d2) (next ?d2 ?d3) (is-istanbul istanbul))
    :effect (and (at istanbul ?d2) (at istanbul ?d3))
  )

  ;; Agent1: generic direct flight consumes one day.
  (:action a1_fly
    :parameters (?from ?to - city ?d1 ?d2 - day)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )

  ;; Agent1: record visiting relatives in Santorini (three separate actions to
  ;; avoid disjunctions); each can only be applied on the specified day.
  (:action a1_visit_relatives_day12
    :parameters ()
    :precondition (and (at santorini day12) (is-santorini santorini))
    :effect (visited-relatives-santorini)
  )
  (:action a1_visit_relatives_day13
    :parameters ()
    :precondition (and (at santorini day13) (is-santorini santorini))
    :effect (visited-relatives-santorini)
  )
  (:action a1_visit_relatives_day14
    :parameters ()
    :precondition (and (at santorini day14) (is-santorini santorini))
    :effect (visited-relatives-santorini)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; AGENT 2 actions (prefix a2_)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Agent2: choose a start city (optional in integrated problem).
  (:action a2_start_in
    :parameters (?c - city)
    :precondition (will-start ?c)
    :effect (and (at ?c day1) (not (will-start ?c)))
  )

  ;; Agent2: fly one day (explicit day parameters).
  (:action a2_fly
    :parameters (?from ?to - city ?d1 ?d2 - day)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )

  ;; Agent2: stay one day in same city (advance to next day).
  (:action a2_stay
    :parameters (?c - city ?d1 ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )

  ;; Agent2: relatives-visit recorded on day12/13/14 while at Santorini.
  (:action a2_visit_relatives_day12
    :parameters ()
    :precondition (at santorini day12)
    :effect (relatives-visited-any)
  )
  (:action a2_visit_relatives_day13
    :parameters ()
    :precondition (at santorini day13)
    :effect (relatives-visited-any)
  )
  (:action a2_visit_relatives_day14
    :parameters ()
    :precondition (at santorini day14)
    :effect (relatives-visited-any)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; AGENT 3 actions (prefix a3_)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Agent3: stay one day (advance to next day). This variant does not require deleting
  ;; the previous day's at in order to preserve flexibility; however, to keep
  ;; a single "at" per day we will delete the prior-day fact (consistent with a2_stay).
  (:action a3_stay
    :parameters (?c - city ?d1 ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )

  ;; Agent3: fly consumes one day (explicit day parameters).
  (:action a3_fly
    :parameters (?from ?to - city ?d1 ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )
)