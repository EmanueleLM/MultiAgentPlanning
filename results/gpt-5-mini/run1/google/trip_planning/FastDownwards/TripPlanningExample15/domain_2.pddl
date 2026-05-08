(define (domain traveler-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (trp-next ?d1 - day ?d2 - day)            ; ordering of days
    (trp-at ?p - person ?c - city ?d - day)  ; person p is in city c on day d
    (trp-in-transit ?p - person ?d - day)    ; person is in transit on day d (travel day)
    (trp-assigned ?d - day)                  ; day d has been assigned (stay or travel)
    (trp-direct-flight ?c1 - city ?c2 - city) ; allowed direct flights
  )

  ;; stay in the same city from day ?d to its successor ?d2 (occupies full day ?d2)
  (:action trp-stay
    :parameters (?p - person ?c - city ?d - day ?d2 - day)
    :precondition (and
                    (trp-at ?p ?c ?d)
                    (trp-next ?d ?d2)
                    (not (trp-assigned ?d2))
                    (not (trp-in-transit ?p ?d2))
                  )
    :effect (and
              (trp-at ?p ?c ?d2)
              (trp-assigned ?d2)
            )
  )

  ;; fly from origin city ?cfrom on day ?d to destination city ?cto arriving on day ?d3.
  ;; The intermediate day ?d2 is the dedicated travel day (in-transit).
  (:action trp-fly
    :parameters (?p - person ?cfrom - city ?cto - city ?d - day ?d2 - day ?d3 - day)
    :precondition (and
                    (trp-at ?p ?cfrom ?d)
                    (trp-next ?d ?d2)
                    (trp-next ?d2 ?d3)
                    (trp-direct-flight ?cfrom ?cto)
                    (not (trp-assigned ?d2))
                    (not (trp-assigned ?d3))
                    (not (trp-in-transit ?p ?d))   ; not already in transit on origin day
                    (not (trp-in-transit ?p ?d3))  ; arrival day must not be an in-transit day already
                  )
    :effect (and
              (trp-in-transit ?p ?d2)
              (trp-assigned ?d2)
              (trp-at ?p ?cto ?d3)
              (trp-assigned ?d3)
            )
  )
)