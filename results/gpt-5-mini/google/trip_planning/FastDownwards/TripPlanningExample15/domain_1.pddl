(define (domain traveler-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    ;; ordering of days
    (trp-next ?d1 - day ?d2 - day)

    ;; occupancy: person is in city c on day d
    (trp-at ?p - person ?c - city ?d - day)

    ;; travel day marker: person is in transit (flight) on day d
    (trp-in-transit ?p - person ?d - day)

    ;; marks that a day has been assigned (either a stay or a travel day)
    (trp-assigned ?d - day)

    ;; allowed direct flights between cities (bidirectional facts must be provided in the problem init if applicable)
    (trp-direct-flight ?c1 - city ?c2 - city)
  )

  ;; stay in the same city for the next day (consumes one calendar day).
  (:action trp-stay
    :parameters (?p - person ?c - city ?d - day ?d2 - day)
    :precondition (and
                    (trp-at ?p ?c ?d)
                    (trp-next ?d ?d2)
                    (not (trp-assigned ?d2))
                  )
    :effect (and
              (trp-at ?p ?c ?d2)
              (trp-assigned ?d2)
            )
  )

  ;; fly from one city to another.
  ;; Flight consumes one travel day (the intermediate day ?d2 is the travel day).
  ;; Preconditions: person is in origin city on day ?d, the immediate successor ?d2 is the travel day,
  ;; and the successor of the travel day ?d3 is the arrival day; both travel and arrival days must be unassigned.
  (:action trp-fly
    :parameters (?p - person ?cfrom - city ?cto - city ?d - day ?d2 - day ?d3 - day)
    :precondition (and
                    (trp-at ?p ?cfrom ?d)
                    (trp-next ?d ?d2)
                    (trp-next ?d2 ?d3)
                    (trp-direct-flight ?cfrom ?cto)
                    (not (trp-assigned ?d2))
                    (not (trp-assigned ?d3))
                  )
    :effect (and
              ;; mark the travel day
              (trp-in-transit ?p ?d2)
              (trp-assigned ?d2)

              ;; arrive and occupy the destination on the arrival day
              (trp-at ?p ?cto ?d3)
              (trp-assigned ?d3)
            )
  )
)