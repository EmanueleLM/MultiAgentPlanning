(define (domain traveler-flights-domain)
  (:requirements :typing :fluents :negative-preconditions :equality)
  (:types city duration)

  ;; Predicates coming from both agents (kept distinct)
  (:predicates
    ;; Traveler agent predicates
    (at ?c - city)                    ; traveler currently at city
    (direct ?from - city ?to - city)  ; allowed direct flight connection (used by fly)
    (is-reykjavik ?c - city)         ; marks the Reykjavik city object
    (met-friend)                     ; whether friend meeting has occurred

    ;; Flights agent predicates
    (direct-flight ?from - city ?to - city)         ; known direct flight connectivity (given data)
    (connectivity-known ?from - city ?to - city)    ; recorded/provided connectivity info
    (direct-commuting-only)                         ; constraint asserted: commute only via direct flights
    (trip-duration ?d - duration)                   ; (kept as information from flights agent)
  )

  (:functions
    (day)                             ; current day counter (numeric)
    (days-left ?c - city)             ; remaining planned days to spend in each city
  )

  ;; --- Actions from the flights agent (kept distinct) ---

  ;; Announce / record a known direct flight between two cities.
  ;; This action can only be applied if the direct flight is known in the initial knowledge base.
  (:action announce-connection
    :parameters (?from - city ?to - city)
    :precondition (direct-flight ?from ?to)
    :effect (connectivity-known ?from ?to)
  )

  ;; Assert the commuting constraint "only direct flights are allowed".
  (:action assert-direct-commuting-constraint
    :parameters ()
    :precondition () 
    :effect (direct-commuting-only)
  )

  ;; Small bridging action to register connectivity-known as the 'direct' predicate
  ;; used by the traveler agent. This action is part of the integration/orchestration
  ;; (keeps agent actions distinct; named separately).
  (:action register-direct
    :parameters (?from - city ?to - city)
    :precondition (connectivity-known ?from ?to)
    :effect (direct ?from ?to)
  )

  ;; --- Actions from the traveler agent (kept distinct) ---

  ;; Fly action: instantaneous relocation using a direct flight.
  ;; Also requires the commuting constraint to have been asserted (direct-commuting-only).
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
                    (at ?from)
                    (direct ?from ?to)
                    (direct-commuting-only)
                   )
    :effect (and
              (not (at ?from))
              (at ?to)
             )
  )

  ;; Stay one day at a city: consumes one day from that city's planned stay,
  ;; and increments the global day by 1. Only allowed if city still needs days.
  (:action stay-one-day
    :parameters (?c - city)
    :precondition (and
                    (at ?c)
                    (> (days-left ?c) 0)
                    (< (day) 16)            ; do not exceed total trip duration
                   )
    :effect (and
              (decrease (days-left ?c) 1)
              (increase (day) 1)
             )
  )

  ;; Meet friend in Reykjavik between day 12 and 16 inclusive.
  (:action meet-friend-in-reykjavik
    :parameters (?c - city)
    :precondition (and
                    (at ?c)
                    (is-reykjavik ?c)
                    (not (met-friend))
                    (>= (day) 12)
                    (<= (day) 16)
                   )
    :effect (and (met-friend))
  )
)