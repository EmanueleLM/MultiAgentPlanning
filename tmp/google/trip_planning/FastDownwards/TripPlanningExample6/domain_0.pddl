(define (domain integrated-trip-domain)
  (:requirements :strips :typing :fluents :adl)
  (:types city day)

  ;; Predicates (shared day-based location representation)
  (:predicates
    (at ?c - city ?d - day)            ; agent is in city ?c on day ?d (used by all agents' actions)
    (next ?d1 - day ?d2 - day)         ; day successor relation
    ;; Different action-visibility flight predicates retained to keep agent actions distinct
    (direct-flight ?from - city ?to - city)  ; used by agent1 actions
    (connected ?from - city ?to - city)      ; used by agent2 actions
    (flight ?from - city ?to - city)         ; used by agent3 actions
    ;; City markers and conference markers
    (is-dubrovnik ?c - city)
    (is-berlin ?c - city)
    (is-munich ?c - city)
    ;; Conference attendance markers
    (attended-day1)
    (attended-day4)
  )

  ;; Numeric fluents to count days spent in specific cities
  (:functions
    (dubrovnik-days)    ; number of days spent in Dubrovnik
    (munich-days)       ; number of days spent in Munich
  )

  ;; =========================
  ;; Agent 1 actions (adapted to day-based representation)
  ;; Keep names distinct: fly_a1, stay_a1, attend-day1_a1, attend-day4_a1
  ;; Agent1's fly uses direct-flight and moves within the same day (instantaneous).
  (:action fly_a1
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from ?d) (direct-flight ?from ?to))
    :effect (and
              (at ?to ?d)
            )
  )

  ;; Agent1 stay: advance from day ?d1 to ?d2 and count Dubrovnik days when applicable.
  (:action stay_a1
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (at ?c ?d2)
              (when (is-dubrovnik ?c)
                (increase (dubrovnik-days) 1))
            )
  )

  ;; Agent1 attend on day1 (Berlin conference). Uses conference marker as given.
  (:action attend-day1_a1
    :parameters (?c - city)
    :precondition (and (at ?c d1) (is-berlin ?c))
    :effect (attended-day1)
  )

  ;; Agent1 attend on day4
  (:action attend-day4_a1
    :parameters (?c - city)
    :precondition (and (at ?c d4) (is-berlin ?c))
    :effect (attended-day4)
  )

  ;; =========================
  ;; Agent 2 actions (keep distinct names: fly_a2, stay_a2, attend-day1_a2, attend-day4_a2)
  ;; Agent2 fly uses connected and travels from day ?d1 to successor day ?d2.
  (:action fly_a2
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (connected ?from ?to) (at ?from ?d1) (next ?d1 ?d2))
    :effect (and
              (at ?to ?d2)
            )
  )

  ;; Agent2 stay: remain in the same city across consecutive days (no numeric increments here).
  (:action stay_a2
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (at ?c ?d2)
  )

  ;; Agent2 attend conference actions (split for day1 and day4 to avoid ADL comparisons)
  (:action attend-day1_a2
    :parameters (?c - city)
    :precondition (and (at ?c d1) (is-berlin ?c))
    :effect (attended-day1)
  )

  (:action attend-day4_a2
    :parameters (?c - city)
    :precondition (and (at ?c d4) (is-berlin ?c))
    :effect (attended-day4)
  )

  ;; =========================
  ;; Agent 3 actions (keep distinct names: fly_a3, stay_a3)
  ;; Agent3 tracks munich-days and uses flight predicate.
  (:action fly_a3
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (flight ?from ?to) (at ?from ?d1) (next ?d1 ?d2))
    :effect (and
              (at ?to ?d2)
              ;; If the destination is Munich, increment the munich-days counter.
              (when (is-munich ?to)
                (increase (munich-days) 1))
            )
  )

  (:action stay_a3
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (at ?c ?d2)
              ;; If staying in Munich on the next day, increment the munich-days counter.
              (when (is-munich ?c)
                (increase (munich-days) 1))
            )
  )
)