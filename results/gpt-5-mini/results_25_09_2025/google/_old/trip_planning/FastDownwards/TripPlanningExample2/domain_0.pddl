(define (domain integrated-trip-domain)
  (:requirements :strips :typing :fluents :negative-preconditions :conditional-effects)
  (:types city day)

  (:predicates
    ;; Location-state (agent-level, used by original Reykjavik fly/stay actions)
    (at ?c - city)
    (is-reykjavik ?c - city)

    ;; Day assignments (Vienna/Venice/Reykjavik)
    (assigned ?d - day)
    (in-vienna ?d - day)
    (in-venice ?d - day)
    (in-reykjavik ?d - day)

    ;; Day ordering and travel/connectivity
    (consecutive ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)

    ;; Wedding bookkeeping
    (wedding-day ?d - day)
    (wedding-attended)
  )

  (:functions
    (v-days)                ;; number of days assigned to Vienna
    (reykjavik-days-left)   ;; remaining Reykjavik days to satisfy
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions originating from the Reykjavik agent model
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; (Original) Stay in Reykjavik action (keeps original semantics;
  ;; still available but integration uses day-specific assign actions below)
  (:action stay-in-reykjavik
    :parameters (?c - city)
    :precondition (and
      (at ?c)
      (is-reykjavik ?c)
      (> (reykjavik-days-left) 0)
    )
    :effect (and
      (decrease (reykjavik-days-left) 1)
    )
  )

  ;; (Original) Fly along a direct flight (requires the direct link between cities).
  ;; Kept for completeness (affects agent-level location 'at').
  (:action fly
    :parameters (?from ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Integration actions for Reykjavik day assignments
  ;; (tie Reykjavik-day requirement to day assignment and numeric counter)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Assign a single day to Reykjavik (consumes one Reykjavik-required day)
  (:action assign-reykjavik-day
    :parameters (?d - day ?c - city)
    :precondition (and
      (not (assigned ?d))
      (is-reykjavik ?c)
      (> (reykjavik-days-left) 0)
    )
    :effect (and
      (assigned ?d)
      (in-reykjavik ?d)
      (decrease (reykjavik-days-left) 1)
    )
  )

  ;; Assign two consecutive days both in Reykjavik (consumes two Reykjavik days)
  (:action assign-reykjavik-reykjavik
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (consecutive ?d1 ?d2)
      (not (assigned ?d1)) (not (assigned ?d2))
      (is-reykjavik ?c)
      (>= (reykjavik-days-left) 2)
    )
    :effect (and
      (assigned ?d1) (assigned ?d2)
      (in-reykjavik ?d1) (in-reykjavik ?d2)
      (decrease (reykjavik-days-left) 2)
    )
  )

  ;; Assign two consecutive days: Reykjavik then Vienna (requires direct Reykjavik->Vienna)
  (:action assign-reykjavik-vienna
    :parameters (?d1 - day ?d2 - day ?r - city)
    :precondition (and
      (consecutive ?d1 ?d2)
      (not (assigned ?d1)) (not (assigned ?d2))
      (is-reykjavik ?r)
      (direct ?r vienna)
      (> (reykjavik-days-left) 0)
    )
    :effect (and
      (assigned ?d1) (assigned ?d2)
      (in-reykjavik ?d1) (in-vienna ?d2)
      (decrease (reykjavik-days-left) 1)
      (increase (v-days) 1)
      ;; If the Vienna-day (?d2) happens to be a wedding-day (possible if ?d2 in window), allow wedding attended via existing Venice assignment actions; no direct effect here.
    )
  )

  ;; Assign two consecutive days: Vienna then Reykjavik (requires direct Vienna->Reykjavik)
  (:action assign-vienna-reykjavik
    :parameters (?d1 - day ?d2 - day ?r - city)
    :precondition (and
      (consecutive ?d1 ?d2)
      (not (assigned ?d1)) (not (assigned ?d2))
      (is-reykjavik ?r)
      (direct vienna ?r)
    )
    :effect (and
      (assigned ?d1) (assigned ?d2)
      (in-vienna ?d1) (in-reykjavik ?d2)
      (increase (v-days) 1)
      (decrease (reykjavik-days-left) 1)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions originating from the Vienna–Venice agent model
  ;; (kept distinct; adapted to use unified 'direct' predicate)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Assign a single day to Vienna
  (:action assign-vienna-day
    :parameters (?d - day)
    :precondition (not (assigned ?d))
    :effect (and
              (assigned ?d)
              (in-vienna ?d)
              (increase (v-days) 1)
            )
  )

  ;; Assign a single day to Venice
  (:action assign-venice-day
    :parameters (?d - day)
    :precondition (not (assigned ?d))
    :effect (and
              (assigned ?d)
              (in-venice ?d)
            )
  )

  ;; Assign two consecutive days both in Vienna
  (:action assign-vienna-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (consecutive ?d1 ?d2) (not (assigned ?d1)) (not (assigned ?d2)))
    :effect (and
              (assigned ?d1) (assigned ?d2)
              (in-vienna ?d1) (in-vienna ?d2)
              (increase (v-days) 2)
            )
  )

  ;; Assign two consecutive days: Vienna then Venice (requires direct Vienna->Venice)
  (:action assign-vienna-venice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (consecutive ?d1 ?d2) (not (assigned ?d1)) (not (assigned ?d2)) (direct vienna venice))
    :effect (and
              (assigned ?d1) (assigned ?d2)
              (in-vienna ?d1) (in-venice ?d2)
              (increase (v-days) 1)
              (when (wedding-day ?d2) (wedding-attended))
            )
  )

  ;; Assign two consecutive days: Venice then Vienna (requires direct Venice->Vienna)
  (:action assign-venice-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (consecutive ?d1 ?d2) (not (assigned ?d1)) (not (assigned ?d2)) (direct venice vienna))
    :effect (and
              (assigned ?d1) (assigned ?d2)
              (in-venice ?d1) (in-vienna ?d2)
              (increase (v-days) 1)
              (when (wedding-day ?d1) (wedding-attended))
            )
  )

  ;; Assign two consecutive days both in Venice
  (:action assign-venice-venice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (consecutive ?d1 ?d2) (not (assigned ?d1)) (not (assigned ?d2)))
    :effect (and
              (assigned ?d1) (assigned ?d2)
              (in-venice ?d1) (in-venice ?d2)
              (when (wedding-day ?d1) (wedding-attended))
              (when (wedding-day ?d2) (wedding-attended))
            )
  )

  ;; Explicit attend-wedding action: can be used if a Venice day has already been assigned
  (:action attend-wedding
    :parameters (?d - day)
    :precondition (and (in-venice ?d) (wedding-day ?d))
    :effect (wedding-attended)
  )
)