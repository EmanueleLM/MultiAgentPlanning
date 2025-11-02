(define (domain integrated-travel)
  (:requirements :strips :typing :fluents :numeric-fluents :negative-preconditions :equality)
  (:types person city day)

  (:predicates
    ;; unified person-location predicate used by all agents' actions
    (at-person ?p - person ?c - city)

    ;; direct flight relation (public information)
    (direct ?from - city ?to - city)

    ;; day bookkeeping used by Agent 2
    (unassigned ?d - day)
    (day-at ?d - day ?c - city)

    ;; visited markers kept separate per original agents (keeps actions distinct)
    (visited1 ?c - city)  ; set by Agent 1 stay action
    (visited2 ?c - city)  ; set by Agent 2 assign-day action
    (visited3 ?c - city)  ; set by Agent 3 stay action
  )

  (:functions
    ;; numeric bookkeeping unified so all agent actions update the same counts
    (total-days)            ; total days planned/consumed so far
    (days-left)             ; remaining days to allocate
    (days ?c - city)        ; days spent in each city (unified per-city function)
  )

  ;; -----------------------
  ;; Agent 1 actions (from split-travel)
  ;; kept distinct by prefix "agent1-"
  ;; -----------------------
  (:action agent1_start-in
    :parameters (?c - city)
    :precondition (and (= (total-days) 0) (at-person planner ?c))
    :effect (and
              ;; this action is primarily to reflect Agent 1's "choose a start" step;
              ;; it does not conflict with the unified at-person predicate (it expects it).
              (at-person planner ?c)
            )
  )

  (:action agent1_fly
    :parameters (?from - city ?to - city)
    :precondition (and (at-person planner ?from) (direct ?from ?to))
    :effect (and
              (not (at-person planner ?from))
              (at-person planner ?to)
            )
  )

  (:action agent1_stay
    :parameters (?c - city)
    :precondition (and (at-person planner ?c) (< (total-days) 15))
    :effect (and
              (increase (total-days) 1)
              (decrease (days-left) 1)
              (increase (days ?c) 1)
              (visited1 ?c)
            )
  )

  ;; -----------------------
  ;; Agent 2 actions (from travel-plan)
  ;; kept distinct by prefix "agent2-"
  ;; -----------------------
  (:action agent2_fly
    :parameters (?p - person ?from - city ?to - city)
    :precondition (and (at-person ?p ?from) (direct ?from ?to))
    :effect (and
              (not (at-person ?p ?from))
              (at-person ?p ?to)
            )
  )

  (:action agent2_assign-day
    :parameters (?p - person ?d - day ?c - city)
    :precondition (and (at-person ?p ?c) (unassigned ?d))
    :effect (and
              (not (unassigned ?d))
              (day-at ?d ?c)
              ;; link day-assignments to numeric bookkeeping so the global counts remain consistent
              (increase (total-days) 1)
              (decrease (days-left) 1)
              (increase (days ?c) 1)
              (visited2 ?c)
            )
  )

  ;; -----------------------
  ;; Agent 3 actions (from travel)
  ;; kept distinct by prefix "agent3-"
  ;; -----------------------
  (:action agent3_fly
    :parameters (?from - city ?to - city)
    :precondition (and (at-person planner ?from) (direct ?from ?to))
    :effect (and
              (not (at-person planner ?from))
              (at-person planner ?to)
            )
  )

  (:action agent3_stay-one-day
    :parameters (?c - city)
    :precondition (and (at-person planner ?c) (>= (days-left) 1))
    :effect (and
              (decrease (days-left) 1)
              (increase (total-days) 1)
              (increase (days ?c) 1)
              (visited3 ?c)
            )
  )
)