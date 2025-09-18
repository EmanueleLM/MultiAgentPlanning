(define (domain integrated-trip-domain)
  (:requirements :strips :typing :adl :action-costs)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)

    ;; Distinct flight vocabularies to keep agent actions separate
    (direct-flight ?from - city ?to - city)
    (connected ?from - city ?to - city)
    (flight ?from - city ?to - city)

    ;; City markers
    (is-dubrovnik ?c - city)
    (is-berlin ?c - city)
    (is-munich ?c - city)

    ;; Conference attendance markers
    (attended-day1)
    (attended-day4)
  )

  ;; =========================
  ;; Agent 1 actions (names kept distinct)
  (:action fly_a1
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from ?d) (direct-flight ?from ?to))
    :effect (and
              (not (at ?from ?d))
              (at ?to ?d))
    :cost 1
  )

  (:action stay_a1
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (at ?c ?d2)
    :cost 1
  )

  (:action attend-day1_a1
    :parameters (?c - city)
    :precondition (and (at ?c d1) (is-berlin ?c))
    :effect (attended-day1)
    :cost 1
  )

  (:action attend-day4_a1
    :parameters (?c - city)
    :precondition (and (at ?c d4) (is-berlin ?c))
    :effect (attended-day4)
    :cost 1
  )

  ;; =========================
  ;; Agent 2 actions (names kept distinct)
  (:action fly_a2
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (connected ?from ?to) (at ?from ?d1) (next ?d1 ?d2))
    :effect (at ?to ?d2)
    :cost 1
  )

  (:action stay_a2
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (at ?c ?d2)
    :cost 1
  )

  (:action attend-day1_a2
    :parameters (?c - city)
    :precondition (and (at ?c d1) (is-berlin ?c))
    :effect (attended-day1)
    :cost 1
  )

  (:action attend-day4_a2
    :parameters (?c - city)
    :precondition (and (at ?c d4) (is-berlin ?c))
    :effect (attended-day4)
    :cost 1
  )

  ;; =========================
  ;; Agent 3 actions (names kept distinct)
  (:action fly_a3
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (flight ?from ?to) (at ?from ?d1) (next ?d1 ?d2))
    :effect (at ?to ?d2)
    :cost 1
  )

  (:action stay_a3
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (at ?c ?d2)
    :cost 1
  )
)