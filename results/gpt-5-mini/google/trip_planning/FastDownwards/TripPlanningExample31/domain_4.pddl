(define (domain trip_planning)
  (:requirements :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (assigned ?d - day ?c - city)          ; day d is assigned to city c
    (next ?d1 - day ?d2 - day)             ; chronological successor
    (first_day ?d - day)                   ; start of the itinerary
    (direct_flight ?c1 - city ?c2 - city)  ; direct flight exists between cities
    (in_workshop_window ?d - day)          ; day falls in the workshop window
    (workshop_satisfied)                   ; workshop attendance fulfilled
  )

  ;; assign the first day to a city (only if that day is not already assigned)
  (:action assign_first
    :parameters (?d - day ?c - city)
    :precondition (and
      (first_day ?d)
      (not (assigned ?d frankfurt))
      (not (assigned ?d reykjavik))
      (not (assigned ?d split))
    )
    :effect (and (assigned ?d ?c))
  )

  ;; stay in the same city from one day to the next
  (:action stay
    :parameters (?dprev - day ?dnext - day ?c - city)
    :precondition (and
      (assigned ?dprev ?c)
      (next ?dprev ?dnext)
      (not (assigned ?dnext frankfurt))
      (not (assigned ?dnext reykjavik))
      (not (assigned ?dnext split))
    )
    :effect (and (assigned ?dnext ?c))
  )

  ;; fly from one city to another between consecutive days (only allowed on direct routes)
  (:action fly
    :parameters (?dprev - day ?dnext - day ?from - city ?to - city)
    :precondition (and
      (assigned ?dprev ?from)
      (next ?dprev ?dnext)
      (direct_flight ?from ?to)
      (not (assigned ?dnext frankfurt))
      (not (assigned ?dnext reykjavik))
      (not (assigned ?dnext split))
    )
    :effect (and (assigned ?dnext ?to))
  )

  ;; mark that the workshop requirement has been satisfied by attending Reykjavik on a window day
  (:action mark_workshop
    :parameters (?d - day)
    :precondition (and
      (assigned ?d reykjavik)
      (in_workshop_window ?d)
      (not (workshop_satisfied))
    )
    :effect (workshop_satisfied)
  )
)