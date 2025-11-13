(define (domain travel-lyon-frankfurt-krakow)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ;; day assignment: day d is assigned to city c
    (assigned ?d - day ?c - city)
    ;; timeline cursor: which day is current
    (current ?d - day)
    ;; successor relation over days
    (next ?d1 - day ?d2 - day)
    ;; indicates a day has not yet been assigned to any city
    (unassigned ?d - day)
    ;; city has been visited (at least one full day assigned)
    (visited ?c - city)
    ;; direct flight edge (bidirectional edges declared in problem init)
    (edge ?c1 - city ?c2 - city)
    ;; marker that at least one full day was spent in a city
    (spent_in ?c - city)
    ;; attendance marker for a specific day (used for Krakow-show days)
    (attend ?d - day)
  )

  ;; stay in same city and advance the timeline to the next day
  (:action stay
    :parameters (?d - day ?c - city ?d2 - day)
    :precondition (and
      (current ?d)
      (assigned ?d ?c)
      (next ?d ?d2)
      (unassigned ?d2)
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      (assigned ?d2 ?c)
      (not (unassigned ?d2))
      (visited ?c)
      (spent_in ?c)
    )
  )

  ;; fly using a direct flight edge and advance to the next day
  (:action fly
    :parameters (?d - day ?from - city ?to - city ?d2 - day)
    :precondition (and
      (current ?d)
      (assigned ?d ?from)
      (edge ?from ?to)
      (next ?d ?d2)
      (unassigned ?d2)
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      (assigned ?d2 ?to)
      (not (unassigned ?d2))
      (visited ?to)
      (spent_in ?to)
    )
  )

  ;; mark attendance for a day once that day is assigned (used to require attendance on specific days)
  (:action mark_attend
    :parameters (?d - day ?c - city)
    :precondition (and
      (assigned ?d ?c)
      (not (attend ?d))
    )
    :effect (attend ?d)
  )
)