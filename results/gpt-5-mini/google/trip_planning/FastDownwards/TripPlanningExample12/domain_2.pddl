(define (domain trip_planning_example12)
  (:requirements :typing :negative-preconditions)
  (:types day city slot)
  (:predicates
    (assigned ?d - day)                         ; day has been assigned to a city
    (at ?c - city ?d - day)                     ; day is spent in city
    (city_slot ?c - city ?s - slot)             ; a remaining slot token for city
    (direct_flight ?from - city ?to - city)     ; permitted direct flight leg
    (first_day ?d - day)                        ; marks the first day of the trip
    (next ?d1 - day ?d2 - day)                  ; ordering relation between consecutive days
    (meeting_happened)                          ; meeting in tallinn recorded
    (meeting_window ?d - day)                   ; days inside the tallinn meeting window (d9..d15)
  )

  ;; assign the first day to a city (consumes one city slot)
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

  ;; assign a next day staying in the same city (consumes one city slot)
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

  ;; assign a next day after flying by a permitted direct flight (consumes one city slot at destination)
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

  ;; record that the meeting in tallinn happened on a meeting-window day assigned to tallinn
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