(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    ;; temporal structure
    (start ?d - day)
    (next ?d1 - day ?d2 - day)

    ;; assignment and visitation
    (assigned ?d - day)            ;; day has been assigned to some city
    (in ?c - city ?d - day)        ;; city c is the occupancy for day d
    (visited ?c - city)            ;; city c was visited at least once

    ;; travel markers (one per direct flight leg departure day)
    (travel-mb ?d - day)           ;; travelled Manchester->Bucharest departing day ?d (arrive next day)
    (travel-bl ?d - day)           ;; travelled Bucharest->Lyon departing day ?d (arrive next day)
  )

  ;; assign the first day to a city (must be used to begin the contiguous assignment chain)
  (:action assign-start
    :parameters (?d - day ?c - city)
    :precondition (and (start ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (in ?c ?d) (visited ?c))
  )

  ;; assign the next calendar day to a city, requires previous day already assigned
  (:action assign-next
    :parameters (?prev - day ?d - day ?c - city)
    :precondition (and (next ?prev ?d) (assigned ?prev) (not (assigned ?d)))
    :effect (and (assigned ?d) (in ?c ?d) (visited ?c))
  )

  ;; travel action Manchester -> Bucharest on day ?d (depart ?d, arrive ?d+1)
  ;; requires the occupancy pattern to exist (manchester on ?d and bucharest on ?d2) to validate the leg
  (:action travel-man-buch
    :parameters (?d - day ?d2 - day)
    :precondition (and (next ?d ?d2) (in manchester ?d) (in bucharest ?d2) (not (travel-mb ?d)))
    :effect (travel-mb ?d)
  )

  ;; travel action Bucharest -> Lyon on day ?d (depart ?d, arrive ?d+1)
  ;; requires the occupancy pattern to exist (bucharest on ?d and lyon on ?d2) to validate the leg
  (:action travel-buch-lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and (next ?d ?d2) (in bucharest ?d) (in lyon ?d2) (not (travel-bl ?d)))
    :effect (travel-bl ?d)
  )
)