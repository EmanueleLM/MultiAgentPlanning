(define (domain city-schedule-13)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day ftoken atoken rtoken)
  (:constants
    florence amsterdam riga - city
  )
  (:predicates
    (next ?d - day ?dn - day)
    (assigned ?d - day ?c - city)
    (decided ?d - day)
    (at-first ?d - day)
    (last-day ?d - day)
    (direct ?from - city ?to - city)
    (workshop-day ?d - day)
    (visited ?c - city)
    (avail-f ?t - ftoken)
    (avail-a ?t - atoken)
    (avail-r ?t - rtoken)
    (used-f ?t - ftoken)
    (used-a ?t - atoken)
    (used-r ?t - rtoken)
  )

  ;; Assign the very first day to Florence (inside workshop window)
  (:action assign-first-florence
    :parameters (?d - day ?tf - ftoken)
    :precondition (and
      (at-first ?d)
      (not (decided ?d))
      (avail-f ?tf)
    )
    :effect (and
      (decided ?d)
      (assigned ?d florence)
      (visited florence)
      (used-f ?tf)
      (not (avail-f ?tf))
    )
  )

  ;; Stay actions (no city change)
  (:action assign-next-stay-florence
    :parameters (?d - day ?dn - day ?tf - ftoken)
    :precondition (and
      (next ?d ?dn)
      (decided ?d)
      (assigned ?d florence)
      (not (decided ?dn))
      (avail-f ?tf)
    )
    :effect (and
      (decided ?dn)
      (assigned ?dn florence)
      (visited florence)
      (used-f ?tf)
      (not (avail-f ?tf))
    )
  )

  (:action assign-next-stay-amsterdam
    :parameters (?d - day ?dn - day ?ta - atoken)
    :precondition (and
      (next ?d ?dn)
      (decided ?d)
      (assigned ?d amsterdam)
      (not (decided ?dn))
      (avail-a ?ta)
    )
    :effect (and
      (decided ?dn)
      (assigned ?dn amsterdam)
      (visited amsterdam)
      (used-a ?ta)
      (not (avail-a ?ta))
    )
  )

  (:action assign-next-stay-riga
    :parameters (?d - day ?dn - day ?tr - rtoken)
    :precondition (and
      (next ?d ?dn)
      (decided ?d)
      (assigned ?d riga)
      (not (decided ?dn))
      (avail-r ?tr)
    )
    :effect (and
      (decided ?dn)
      (assigned ?dn riga)
      (visited riga)
      (used-r ?tr)
      (not (avail-r ?tr))
    )
  )

  ;; Fly actions (city changes must follow direct edges). Workshop days cannot be targets of flights.
  (:action assign-next-fly-to-florence
    :parameters (?d - day ?dn - day ?from - city ?tf - ftoken)
    :precondition (and
      (next ?d ?dn)
      (decided ?d)
      (assigned ?d ?from)
      (not (decided ?dn))
      (not (workshop-day ?dn))
      (direct ?from florence)
      (avail-f ?tf)
    )
    :effect (and
      (decided ?dn)
      (assigned ?dn florence)
      (visited florence)
      (used-f ?tf)
      (not (avail-f ?tf))
    )
  )

  (:action assign-next-fly-to-amsterdam
    :parameters (?d - day ?dn - day ?from - city ?ta - atoken)
    :precondition (and
      (next ?d ?dn)
      (decided ?d)
      (assigned ?d ?from)
      (not (decided ?dn))
      (not (workshop-day ?dn))
      (direct ?from amsterdam)
      (avail-a ?ta)
    )
    :effect (and
      (decided ?dn)
      (assigned ?dn amsterdam)
      (visited amsterdam)
      (used-a ?ta)
      (not (avail-a ?ta))
    )
  )

  (:action assign-next-fly-to-riga
    :parameters (?d - day ?dn - day ?from - city ?tr - rtoken)
    :precondition (and
      (next ?d ?dn)
      (decided ?d)
      (assigned ?d ?from)
      (not (decided ?dn))
      (not (workshop-day ?dn))
      (direct ?from riga)
      (avail-r ?tr)
    )
    :effect (and
      (decided ?dn)
      (assigned ?dn riga)
      (visited riga)
      (used-r ?tr)
      (not (avail-r ?tr))
    )
  )
)