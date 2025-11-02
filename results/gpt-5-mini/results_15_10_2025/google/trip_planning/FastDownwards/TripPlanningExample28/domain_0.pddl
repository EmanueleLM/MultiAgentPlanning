(define (domain trip-planning)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day)

  (:predicates
    (at ?c - city)               ; traveler is currently at city
    (day-free ?d - day)         ; day is unallocated
    (assigned ?d - day ?c - city) ; day is assigned to a city (spent in that city)
    (flight ?from - city ?to - city) ; direct flight existence (directional)
  )

  ;; Travel actions that correspond to the explicitly reported direct flights.
  ;; Actions are kept distinct when they correspond to different agent reports.
  (:action fly-venice_agent-venice-to-zurich
    :precondition (and (at venice) (flight venice zurich))
    :effect (and (not (at venice)) (at zurich))
  )

  (:action fly-venice_agent-zurich-to-venice
    :precondition (and (at zurich) (flight zurich venice))
    :effect (and (not (at zurich)) (at venice))
  )

  ;; Zurich -> Florence reported by the florence_agent (directional).
  (:action fly-florence_agent-zurich-to-florence
    :precondition (and (at zurich) (flight zurich florence))
    :effect (and (not (at zurich)) (at florence))
  )

  ;; Generic day-assignment action: allocate a free day to the current city.
  ;; Must be physically at the city to spend that day there.
  (:action assign-day
    :parameters (?d - day ?c - city)
    :precondition (and (day-free ?d) (at ?c))
    :effect (and (not (day-free ?d)) (assigned ?d ?c))
  )
)