(define (domain trip9days)
  (:requirements :strips :typing :action-costs)
  (:types city day prslot vislot)
  (:predicates
    (at ?c - city)
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (city-on ?d - day ?c - city)

    (edge ?from - city ?to - city)

    (is-prague ?c - city)
    (is-vienna ?c - city)
    (is-porto ?c - city)

    (free-prague-slot ?p - prslot)
    (used-prague-slot ?p - prslot)
    (free-vienna-slot ?v - vislot)
    (used-vienna-slot ?v - vislot)
  )
  (:functions (total-cost))

  (:action stay-in-prague
    :parameters (?c - city ?d - day ?d2 - day ?p - prslot)
    :precondition (and
      (is-prague ?c)
      (at ?c)
      (current-day ?d)
      (next ?d ?d2)
      (free-prague-slot ?p)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (city-on ?d2 ?c)
      (used-prague-slot ?p)
      (not (free-prague-slot ?p))
      (at ?c)
    )
  )

  (:action stay-in-vienna
    :parameters (?c - city ?d - day ?d2 - day ?v - vislot)
    :precondition (and
      (is-vienna ?c)
      (at ?c)
      (current-day ?d)
      (next ?d ?d2)
      (free-vienna-slot ?v)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (city-on ?d2 ?c)
      (used-vienna-slot ?v)
      (not (free-vienna-slot ?v))
      (at ?c)
    )
  )

  (:action stay-in-porto
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (is-porto ?c)
      (at ?c)
      (current-day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (city-on ?d2 ?c)
      (at ?c)
    )
  )

  (:action fly-to-prague
    :parameters (?from - city ?to - city ?d - day ?d2 - day ?p - prslot)
    :precondition (and
      (is-prague ?to)
      (at ?from)
      (edge ?from ?to)
      (current-day ?d)
      (next ?d ?d2)
      (free-prague-slot ?p)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (city-on ?d2 ?to)
      (used-prague-slot ?p)
      (not (free-prague-slot ?p))
      (not (at ?from))
      (at ?to)
      (increase (total-cost) 1)
    )
  )

  (:action fly-to-vienna
    :parameters (?from - city ?to - city ?d - day ?d2 - day ?v - vislot)
    :precondition (and
      (is-vienna ?to)
      (at ?from)
      (edge ?from ?to)
      (current-day ?d)
      (next ?d ?d2)
      (free-vienna-slot ?v)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (city-on ?d2 ?to)
      (used-vienna-slot ?v)
      (not (free-vienna-slot ?v))
      (not (at ?from))
      (at ?to)
      (increase (total-cost) 1)
    )
  )

  (:action fly-to-porto
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (is-porto ?to)
      (at ?from)
      (edge ?from ?to)
      (current-day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (city-on ?d2 ?to)
      (not (at ?from))
      (at ?to)
      (increase (total-cost) 1)
    )
  )
)