(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city token)

  (:predicates
    (next ?d1 - day ?d2 - day)            ; successor relation for consecutive days
    (day-unassigned ?d - day)            ; true until a day is assigned
    (assigned ?d - day)                  ; true when a day has been assigned a city
    (at ?d - day ?c - city)              ; day d is assigned to city c
    (flight ?from - city ?to - city)     ; allowed direct move (includes stays as self-loop)
    (token-available ?t - token)         ; token available to consume for a city assignment
    (token-city ?t - token ?c - city)    ; token t is associated with city c
    (first-day ?d - day)                 ; identifies day1
    (window-day ?d - day)                ; days within the workshop window (day5..day10)
    (is-stuttgart ?c - city)             ; marks the Stuttgart city object
    (attended-workshop)                  ; becomes true once a Stuttgart day in the window is assigned
  )

  ; Assign the first day (no predecessor constraint). Can assign any city (including Stuttgart).
  (:action assign-first
    :parameters (?d - day ?t - token ?c - city)
    :precondition (and
                    (first-day ?d)
                    (day-unassigned ?d)
                    (token-available ?t)
                    (token-city ?t ?c)
                  )
    :effect (and
              (not (day-unassigned ?d))
              (assigned ?d)
              (at ?d ?c)
              (not (token-available ?t))
            )
  )

  ; Assign a non-Stuttgart city for a non-first day (stays or direct flight allowed via flight predicate).
  (:action assign-nonstuttgart
    :parameters (?prev - day ?d - day ?t - token ?c - city ?pc - city)
    :precondition (and
                    (next ?prev ?d)
                    (at ?prev ?pc)
                    (flight ?pc ?c)
                    (day-unassigned ?d)
                    (token-available ?t)
                    (token-city ?t ?c)
                    (not (is-stuttgart ?c))
                  )
    :effect (and
              (not (day-unassigned ?d))
              (assigned ?d)
              (at ?d ?c)
              (not (token-available ?t))
            )
  )

  ; Assign Stuttgart for a non-first day when that day is inside the workshop window.
  ; This action also sets attended-workshop.
  (:action assign-stuttgart-window
    :parameters (?prev - day ?d - day ?t - token ?c - city ?pc - city)
    :precondition (and
                    (next ?prev ?d)
                    (at ?prev ?pc)
                    (flight ?pc ?c)
                    (is-stuttgart ?c)
                    (window-day ?d)
                    (day-unassigned ?d)
                    (token-available ?t)
                    (token-city ?t ?c)
                  )
    :effect (and
              (not (day-unassigned ?d))
              (assigned ?d)
              (at ?d ?c)
              (not (token-available ?t))
              (attended-workshop)
            )
  )

  ; Assign Stuttgart for a non-first day when that day is NOT in the workshop window.
  (:action assign-stuttgart-nowindow
    :parameters (?prev - day ?d - day ?t - token ?c - city ?pc - city)
    :precondition (and
                    (next ?prev ?d)
                    (at ?prev ?pc)
                    (flight ?pc ?c)
                    (is-stuttgart ?c)
                    (not (window-day ?d))
                    (day-unassigned ?d)
                    (token-available ?t)
                    (token-city ?t ?c)
                  )
    :effect (and
              (not (day-unassigned ?d))
              (assigned ?d)
              (at ?d ?c)
              (not (token-available ?t))
            )
  )
)