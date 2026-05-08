(define (domain traveler-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (trp-next ?d1 - day ?d2 - day)             ; successor relation on days
    (trp-at ?p - person ?c - city ?d - day)   ; person p is in city c on day d (a full-day stay)
    (trp-in-transit ?p - person ?d - day)     ; person p is in transit on day d (a travel day)
    (trp-assigned ?d - day)                   ; day d has been assigned (stay or travel)
    (trp-direct-flight ?c1 - city ?c2 - city) ; allowed direct flight from c1 to c2
  )

  ;; stay in the same city for the next calendar day
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

  ;; fly from ?from on day ?d; day ?dtrav is the travel (in-transit) day; arrive in ?to on day ?darr
  (:action trp-fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?dtrav - day ?darr - day)
    :precondition (and
                    (trp-at ?p ?from ?d)
                    (trp-next ?d ?dtrav)
                    (trp-next ?dtrav ?darr)
                    (trp-direct-flight ?from ?to)
                    (not (trp-assigned ?dtrav))
                    (not (trp-assigned ?darr))
                    (not (trp-in-transit ?p ?d))    ; cannot be already in transit on departure day
                    (not (trp-in-transit ?p ?darr)) ; arrival day must not already be a transit day
                  )
    :effect (and
              (trp-in-transit ?p ?dtrav)
              (trp-assigned ?dtrav)
              (trp-at ?p ?to ?darr)
              (trp-assigned ?darr)
            )
  )
)