(define (domain travel-domain)
  (:requirements :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (succ ?d ?d2 - day)                 ; temporal ordering between consecutive days
    (flight ?from ?to - city)           ; direct flight connectivity
    (at ?p - person ?c - city ?d - day) ; person p is at city c on day d
    (has_loc ?p - person ?d - day)      ; person p has an assigned location on day d
    (allowed_workshop_day ?d - day)     ; day is within the workshop window
    (workshop_done ?p - person)         ; attendee has completed attending the workshop
    (workshop_city ?c - city)           ; city where the workshop is held
    (visited ?p - person ?c - city)     ; person has visited city at least once
  )

  ;; Travel consumes a day: being at ?from on day ?d and moving to ?to on the next day ?d2.
  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
                    (at ?p ?from ?d)
                    (succ ?d ?d2)
                    (flight ?from ?to)
                    (not (has_loc ?p ?d2))
                  )
    :effect (and
              (at ?p ?to ?d2)
              (has_loc ?p ?d2)
              (visited ?p ?to)
            )
  )

  ;; Stay in the same city consumes the next day (remain in place).
  (:action stay
    :parameters (?p - person ?c - city ?d - day ?d2 - day)
    :precondition (and
                    (at ?p ?c ?d)
                    (succ ?d ?d2)
                    (not (has_loc ?p ?d2))
                  )
    :effect (and
              (at ?p ?c ?d2)
              (has_loc ?p ?d2)
              (visited ?p ?c)
            )
  )

  ;; Attend the workshop once while located in the workshop city on an allowed day.
  (:action attend_workshop
    :parameters (?p - person ?c - city ?d - day)
    :precondition (and
                    (at ?p ?c ?d)
                    (workshop_city ?c)
                    (allowed_workshop_day ?d)
                    (not (workshop_done ?p))
                  )
    :effect (and
              (workshop_done ?p)
            )
  )
)