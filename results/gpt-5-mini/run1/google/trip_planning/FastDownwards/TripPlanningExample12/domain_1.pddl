(define (domain trip_planning_example12)
  (:requirements :typing :negative-preconditions)
  (:types day city slot)
  (:predicates
    (assigned ?d - day)                         ; day has been assigned to a city
    (at ?c - city ?d - day)                     ; day is spent in city
    (city_slot ?c - city ?s - slot)             ; a remaining "slot" (capacity token) for city
    (direct_flight ?from - city ?to - city)     ; permitted direct flight leg
    (first_day ?d - day)                        ; marks the first day of the trip
    (next ?d1 - day ?d2 - day)                  ; ordering relation between consecutive days
    (meeting_happened)                          ; a meeting in Tallinn during the allowed window occurred
    (meeting_window ?d - day)                   ; days that lie in the Tallinn meeting window (9..15)
  )

  ; Assign the first day's city (consumes one slot of that city)
  (:action assign_first_day
    :parameters (?d - day ?c - city ?s - slot)
    :precondition (and
                    (first_day ?d)
                    (not (assigned ?d))
                    (city_slot ?c ?s)
                  )
    :effect (and
              (assigned ?d)
              (at ?c ?d)
              (not (city_slot ?c ?s))
            )
  )

  ; Assign a next day with staying in the same city (consumes one slot of that city)
  (:action assign_next_same
    :parameters (?prev - day ?d - day ?c - city ?s - slot)
    :precondition (and
                    (next ?prev ?d)
                    (assigned ?prev)
                    (at ?c ?prev)
                    (not (assigned ?d))
                    (city_slot ?c ?s)
                  )
    :effect (and
              (assigned ?d)
              (at ?c ?d)
              (not (city_slot ?c ?s))
            )
  )

  ; Assign a next day moving by a direct flight from ?from to ?to (consumes one slot of destination city)
  (:action assign_next_flight
    :parameters (?prev - day ?d - day ?from - city ?to - city ?s - slot)
    :precondition (and
                    (next ?prev ?d)
                    (assigned ?prev)
                    (at ?from ?prev)
                    (direct_flight ?from ?to)
                    (not (assigned ?d))
                    (city_slot ?to ?s)
                  )
    :effect (and
              (assigned ?d)
              (at ?to ?d)
              (not (city_slot ?to ?s))
            )
  )

  ; Record meeting in Tallinn: can only be done on a day that is in the meeting window and that is assigned to Tallinn
  (:action record_meeting_in_tallinn
    :parameters (?d - day)
    :precondition (and
                    (meeting_window ?d)
                    (at tallinn ?d)
                    (not (meeting_happened))
                  )
    :effect (meeting_happened)
  )
)