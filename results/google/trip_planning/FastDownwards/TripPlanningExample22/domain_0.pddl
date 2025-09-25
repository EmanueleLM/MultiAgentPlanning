(define (domain multiagent-trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)            ; traveler is at city ?c on day ?d
    (visited ?c - city)               ; traveler has visited city ?c at some point
    (flight ?c1 - city ?c2 - city)    ; direct flight exists from ?c1 to ?c2
    (next ?d1 - day ?d2 - day)        ; temporal order: ?d2 is the day after ?d1
    (occupied ?d - day)               ; traveler's location for day ?d has been assigned
  )

  ;; Actions of the traveler agent: remain in the same city from day to the next day.
  ;; Named with 'traveler-' prefix to keep agent actions distinct.
  (:action traveler-stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
                    (at ?c ?d)
                    (next ?d ?d2)
                    (not (occupied ?d2))
                  )
    :effect (and
              (at ?c ?d2)
              (occupied ?d2)
              (visited ?c)
            )
  )

  ;; Actions provided by the flight_network agent: perform a direct flight between cities
  ;; and place the traveler at the destination on the next day.
  ;; Named with 'flight_network-' prefix to keep agent actions distinct.
  (:action flight_network-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
                    (at ?from ?d)
                    (flight ?from ?to)
                    (next ?d ?d2)
                    (not (occupied ?d2))
                  )
    :effect (and
              (at ?to ?d2)
              (occupied ?d2)
              (visited ?to)
            )
  )

)