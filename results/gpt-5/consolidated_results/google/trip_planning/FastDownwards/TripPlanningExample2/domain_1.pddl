(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)

  (:predicates
    (at ?d - day ?c - city)            ; day d is assigned to city c
    (filled ?d - day)                  ; day d has been assigned
    (next ?d - day ?d2 - day)          ; d immediately precedes d2
    (connected ?c1 - city ?c2 - city)  ; direct flight between c1 and c2
    (window ?d - day)                  ; day is within wedding window (8..11)
    (city-venice ?c - city)            ; marks Venice
    (token-city ?t - token ?c - city)  ; token t belongs to city c
    (available ?t - token)             ; token not yet used
    (used ?t - token)                  ; token consumed (counting constraint)
    (wedding-ok)                       ; true iff Venice assigned on at least one window day
  )

  ; Stay in a non-Venice city
  (:action stay-other
    :parameters (?d - day ?d2 - day ?c - city ?t - token)
    :precondition (and
      (next ?d ?d2)
      (filled ?d)
      (not (filled ?d2))
      (at ?d ?c)
      (not (city-venice ?c))
      (token-city ?t ?c)
      (available ?t)
    )
    :effect (and
      (at ?d2 ?c)
      (filled ?d2)
      (used ?t)
      (not (available ?t))
    )
  )

  ; Stay in Venice on a window day (satisfies wedding)
  (:action stay-venice-window
    :parameters (?d - day ?d2 - day ?t - token)
    :precondition (and
      (next ?d ?d2)
      (filled ?d)
      (not (filled ?d2))
      (at ?d Venice)
      (window ?d2)
      (token-city ?t Venice)
      (available ?t)
    )
    :effect (and
      (at ?d2 Venice)
      (filled ?d2)
      (used ?t)
      (not (available ?t))
      (wedding-ok)
    )
  )

  ; Stay in Venice on a non-window day
  (:action stay-venice-nonwindow
    :parameters (?d - day ?d2 - day ?t - token)
    :precondition (and
      (next ?d ?d2)
      (filled ?d)
      (not (filled ?d2))
      (at ?d Venice)
      (not (window ?d2))
      (token-city ?t Venice)
      (available ?t)
    )
    :effect (and
      (at ?d2 Venice)
      (filled ?d2)
      (used ?t)
      (not (available ?t))
    )
  )

  ; Move along a direct flight into a non-Venice city
  (:action move-other
    :parameters (?d - day ?d2 - day ?from - city ?to - city ?t - token)
    :precondition (and
      (next ?d ?d2)
      (filled ?d)
      (not (filled ?d2))
      (at ?d ?from)
      (connected ?from ?to)
      (not (city-venice ?to))
      (token-city ?t ?to)
      (available ?t)
    )
    :effect (and
      (at ?d2 ?to)
      (filled ?d2)
      (used ?t)
      (not (available ?t))
    )
  )

  ; Move along a direct flight into Venice on a window day (satisfies wedding)
  (:action move-venice-window
    :parameters (?d - day ?d2 - day ?from - city ?t - token)
    :precondition (and
      (next ?d ?d2)
      (filled ?d)
      (not (filled ?d2))
      (at ?d ?from)
      (connected ?from Venice)
      (window ?d2)
      (token-city ?t Venice)
      (available ?t)
    )
    :effect (and
      (at ?d2 Venice)
      (filled ?d2)
      (used ?t)
      (not (available ?t))
      (wedding-ok)
    )
  )

  ; Move along a direct flight into Venice on a non-window day
  (:action move-venice-nonwindow
    :parameters (?d - day ?d2 - day ?from - city ?t - token)
    :precondition (and
      (next ?d ?d2)
      (filled ?d)
      (not (filled ?d2))
      (at ?d ?from)
      (connected ?from Venice)
      (not (window ?d2))
      (token-city ?t Venice)
      (available ?t)
    )
    :effect (and
      (at ?d2 Venice)
      (filled ?d2)
      (used ?t)
      (not (available ?t))
    )
  )
)