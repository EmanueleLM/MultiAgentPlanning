(define (domain integrated-euro-itinerary)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :fluents :equality)
  (:types city agent)

  (:predicates
    ;; agent-less location used by agent1 and agent3 style actions
    (at ?c - city)

    ;; agent-specific location used by agent2 style actions
    (at_agent ?a - agent ?c - city)

    (visited ?c - city)
    (direct ?from - city ?to - city)           ;; used by agent1 & agent2 actions
    (direct-flight ?from - city ?to - city)   ;; used by agent3 actions
    (is-venice ?c - city)
  )

  (:functions
    (days-remaining)           ;; global budget (primary canonical fluents)
    (days-left)                ;; agent3's naming (kept synchronized with days-remaining)
    (total-days-used)         ;; agent1's naming (kept synchronized)
    (venice-days)             ;; agent1's count for Venice (kept synchronized with days-in)
    (visited-count)           ;; increments when a city is first visited
    (days-in ?c - city)       ;; per-city day counters (canonical)
    (cities-left)             ;; agent3 used
  )

  ;; ---------------------------
  ;; Actions from agent 1 (venice-travel), renamed to keep them distinct
  ;; ---------------------------
  (:action fly_agent1
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and
              (not (at ?from))
              (at ?to)
            )
  )

  (:action stay_in_venice_agent1
    :parameters (?c - city)
    :precondition (and (at ?c) (is-venice ?c) (>= (days-remaining) 1))
    :effect (and
              ;; mark visited only if not already
              (when (not (visited ?c))
                    (and
                      (visited ?c)
                      (increase (visited-count) 1)
                    )
              )
              ;; update all day-tracking fluents to keep names synchronized
              (decrease (days-remaining) 1)
              (decrease (days-left) 1)
              (increase (total-days-used) 1)
              (increase (venice-days) 1)
              (increase (days-in ?c) 1)
            )
  )

  (:action stay_other_agent1
    :parameters (?c - city)
    :precondition (and (at ?c) (not (is-venice ?c)) (>= (days-remaining) 1))
    :effect (and
              (when (not (visited ?c))
                    (and
                      (visited ?c)
                      (increase (visited-count) 1)
                    )
              )
              (decrease (days-remaining) 1)
              (decrease (days-left) 1)
              (increase (total-days-used) 1)
              (increase (days-in ?c) 1)
            )
  )

  ;; ---------------------------
  ;; Actions from agent 2 (visit), renamed to keep them distinct
  ;; agent parameter retained
  ;; ---------------------------
  (:action fly_agent2
    :parameters (?a - agent ?from - city ?to - city)
    :precondition (and (at_agent ?a ?from) (direct ?from ?to))
    :effect (and
              (not (at_agent ?a ?from))
              (at_agent ?a ?to)
            )
  )

  (:action spend_day_agent2
    :parameters (?a - agent ?c - city)
    :precondition (and (at_agent ?a ?c) (>= (days-remaining) 1))
    :effect (and
              (decrease (days-remaining) 1)
              (decrease (days-left) 1)
              (increase (days-in ?c) 1)
              ;; first-day-in-city bookkeeping
              (when (not (visited ?c))
                    (and
                      (visited ?c)
                      (increase (visited-count) 1)
                    )
              )
            )
  )

  ;; ---------------------------
  ;; Actions from agent 3 (euro-trip), renamed to keep them distinct
  ;; ---------------------------
  (:action fly_agent3
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct-flight ?from ?to))
    :effect (and
              (not (at ?from))
              (at ?to)
            )
  )

  (:action stay_agent3
    :parameters (?c - city)
    :precondition (and (at ?c) (not (visited ?c)) (>= (days-left) 2))
    :effect (and
             ;; mark visited and increment visited-count
             (visited ?c)
             (increase (visited-count) 1)

             ;; consume two days according to agent3 semantics,
             ;; and keep global days-remaining/total-days-used synchronized
             (decrease (days-left) 2)
             (decrease (days-remaining) 2)
             (increase (total-days-used) 2)

             ;; per-city increment by 2 days
             (increase (days-in ?c) 2)

             ;; agent3's city counter
             (decrease (cities-left) 1)
            )
  )
)