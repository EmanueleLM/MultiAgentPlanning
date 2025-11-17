(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day bslot)
  (:predicates
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (assigned ?d - day)
    (unassigned ?d - day)
    (at ?c - city ?d - day)
    (last ?c - city)
    (visited ?c - city)
    (flight ?from - city ?to - city)
    (show-day ?d - day)
    (start)
    (unclaimed-bslot ?s - bslot)
    (claimed-bslot ?s - bslot)
  )

  (:action assign_first_day_berlin
    :parameters (?d - day)
    :precondition (and
      (start)
      (current-day ?d)
      (unassigned ?d)
      (show-day ?d)
    )
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at berlin ?d)
      (visited berlin)
      (last berlin)
      (not (start))
    )
  )

  (:action assign_stay_berlin
    :parameters (?d - day)
    :precondition (and
      (not (start))
      (current-day ?d)
      (unassigned ?d)
      (last berlin)
      (show-day ?d)
    )
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at berlin ?d)
      (visited berlin)
    )
  )

  (:action assign_move_from_berlin
    :parameters (?to - city ?d - day)
    :precondition (and
      (not (start))
      (current-day ?d)
      (unassigned ?d)
      (last berlin)
      (flight berlin ?to)
    )
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at ?to ?d)
      (visited ?to)
      (not (last berlin))
      (last ?to)
    )
  )

  (:action assign_stay_frankfurt
    :parameters (?d - day)
    :precondition (and
      (not (start))
      (current-day ?d)
      (unassigned ?d)
      (last frankfurt)
    )
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at frankfurt ?d)
      (visited frankfurt)
    )
  )

  (:action assign_move_to_frankfurt
    :parameters (?from - city ?d - day)
    :precondition (and
      (not (start))
      (current-day ?d)
      (unassigned ?d)
      (last ?from)
      (flight ?from frankfurt)
    )
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at frankfurt ?d)
      (visited frankfurt)
      (not (last ?from))
      (last frankfurt)
    )
  )

  (:action assign_stay_bucharest
    :parameters (?s - bslot ?d - day)
    :precondition (and
      (not (start))
      (current-day ?d)
      (unassigned ?d)
      (last bucharest)
      (unclaimed-bslot ?s)
    )
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at bucharest ?d)
      (visited bucharest)
      (claimed-bslot ?s)
      (not (unclaimed-bslot ?s))
    )
  )

  (:action assign_move_to_bucharest
    :parameters (?from - city ?s - bslot ?d - day)
    :precondition (and
      (not (start))
      (current-day ?d)
      (unassigned ?d)
      (last ?from)
      (flight ?from bucharest)
      (unclaimed-bslot ?s)
    )
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at bucharest ?d)
      (visited bucharest)
      (not (last ?from))
      (last bucharest)
      (claimed-bslot ?s)
      (not (unclaimed-bslot ?s))
    )
  )

  (:action advance_day
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current-day ?d)
      (assigned ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
    )
  )
)