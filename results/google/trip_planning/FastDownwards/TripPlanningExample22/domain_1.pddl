(define (domain trip-planning-example22)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    day city token frtoken butoken
  )
  (:predicates
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (in ?d - day ?c - city)
    (current ?d - day)
    (last-city ?c - city)
    (assigned ?d - day)
    (is-berlin ?c - city)
    (is-frankfurt ?c - city)
    (is-bucharest ?c - city)
    (avail-fr ?t - frtoken)
    (avail-bu ?t - butoken)
    (used-fr ?t - frtoken)
    (used-bu ?t - butoken)
  )

  ; Assign current day to stay in the same city when it is Berlin (no token needed)
  (:action assign-stay-berlin
    :parameters (?d - day ?c - city)
    :precondition (and
      (current ?d)
      (not (assigned ?d))
      (last-city ?c)
      (is-berlin ?c)
    )
    :effect (and
      (in ?d ?c)
      (assigned ?d)
    )
  )

  ; Assign current day to stay in Frankfurt (consumes a Frankfurt token)
  (:action assign-stay-frankfurt
    :parameters (?d - day ?c - city ?t - frtoken)
    :precondition (and
      (current ?d)
      (not (assigned ?d))
      (last-city ?c)
      (is-frankfurt ?c)
      (avail-fr ?t)
    )
    :effect (and
      (in ?d ?c)
      (assigned ?d)
      (not (avail-fr ?t))
      (used-fr ?t)
    )
  )

  ; Assign current day to stay in Bucharest (consumes a Bucharest token)
  (:action assign-stay-bucharest
    :parameters (?d - day ?c - city ?t - butoken)
    :precondition (and
      (current ?d)
      (not (assigned ?d))
      (last-city ?c)
      (is-bucharest ?c)
      (avail-bu ?t)
    )
    :effect (and
      (in ?d ?c)
      (assigned ?d)
      (not (avail-bu ?t))
      (used-bu ?t)
    )
  )

  ; Assign current day by flying to Berlin (requires direct flight; no token)
  (:action assign-fly-to-berlin
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (not (assigned ?d))
      (last-city ?from)
      (is-berlin ?to)
      (direct ?from ?to)
    )
    :effect (and
      (in ?d ?to)
      (assigned ?d)
      (not (last-city ?from))
      (last-city ?to)
    )
  )

  ; Assign current day by flying to Frankfurt (requires direct flight; consumes a Frankfurt token)
  (:action assign-fly-to-frankfurt
    :parameters (?d - day ?from - city ?to - city ?t - frtoken)
    :precondition (and
      (current ?d)
      (not (assigned ?d))
      (last-city ?from)
      (is-frankfurt ?to)
      (direct ?from ?to)
      (avail-fr ?t)
    )
    :effect (and
      (in ?d ?to)
      (assigned ?d)
      (not (last-city ?from))
      (last-city ?to)
      (not (avail-fr ?t))
      (used-fr ?t)
    )
  )

  ; Assign current day by flying to Bucharest (requires direct flight; consumes a Bucharest token)
  (:action assign-fly-to-bucharest
    :parameters (?d - day ?from - city ?to - city ?t - butoken)
    :precondition (and
      (current ?d)
      (not (assigned ?d))
      (last-city ?from)
      (is-bucharest ?to)
      (direct ?from ?to)
      (avail-bu ?t)
    )
    :effect (and
      (in ?d ?to)
      (assigned ?d)
      (not (last-city ?from))
      (last-city ?to)
      (not (avail-bu ?t))
      (used-bu ?t)
    )
  )

  ; Advance to the next day after assigning the current one
  (:action advance
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current ?d)
      (assigned ?d)
      (next ?d ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
    )
  )
)