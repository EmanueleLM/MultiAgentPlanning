(define (domain multi-city-trip)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types city)

  (:predicates
    (at ?c - city)
    (relatives-visited)
  )

  (:functions
    (day)                   ; integer day counter, starts at 1, ends at 13 after 12 days
    (days-porto)            ; total counted Porto days
    (days-barcelona)        ; total counted Barcelona days
    (days-florence)         ; total counted Florence days
  )

  ;; Stay actions: spend the current day in the same city and advance to next day.
  ;; Each stay increments the day's counter and the corresponding city's day-count.
  (:action stay-porto
    :precondition (and (at porto) (< (day) 13))
    :effect (and
      (increase (day) 1)
      (increase (days-porto) 1)
      ;; (at porto) persists
    )
  )

  (:action stay-barcelona
    :precondition (and (at barcelona) (< (day) 13))
    :effect (and
      (increase (day) 1)
      (increase (days-barcelona) 1)
    )
  )

  (:action stay-florence
    :precondition (and (at florence) (< (day) 13))
    :effect (and
      (increase (day) 1)
      (increase (days-florence) 1)
    )
  )

  ;; Flight actions: use a direct flight; flying consumes a day and you arrive the next day.
  ;; Only direct flights available are encoded as actions below.
  (:action fly-porto-to-barcelona
    :precondition (and (at porto) (< (day) 13))
    :effect (and
      (not (at porto))
      (at barcelona)
      (increase (day) 1)
      (increase (days-barcelona) 1)
    )
  )

  (:action fly-barcelona-to-porto
    :precondition (and (at barcelona) (< (day) 13))
    :effect (and
      (not (at barcelona))
      (at porto)
      (increase (day) 1)
      (increase (days-porto) 1)
    )
  )

  (:action fly-barcelona-to-florence
    :precondition (and (at barcelona) (< (day) 13))
    :effect (and
      (not (at barcelona))
      (at florence)
      (increase (day) 1)
      (increase (days-florence) 1)
    )
  )

  (:action fly-florence-to-barcelona
    :precondition (and (at florence) (< (day) 13))
    :effect (and
      (not (at florence))
      (at barcelona)
      (increase (day) 1)
      (increase (days-barcelona) 1)
    )
  )

  ;; Visit relatives action: must be done while in Porto on an overall trip day 1..3 (inclusive).
  ;; This action does not consume a day so it can be done during an eligible day.
  (:action visit-relatives-in-porto
    :precondition (and (at porto) (<= (day) 3) (not (relatives-visited)))
    :effect (and (relatives-visited))
  )

)