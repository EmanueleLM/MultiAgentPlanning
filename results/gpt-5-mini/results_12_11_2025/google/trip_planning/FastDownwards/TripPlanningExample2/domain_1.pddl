(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city token)
  (:predicates
    (at ?d - day ?c - city)                        ; day ?d is assigned to city ?c
    (day-next ?d - day ?d2 - day)                 ; ?d2 is the next day after ?d
    (connected ?c1 - city ?c2 - city)             ; allowed to move between ?c1 and ?c2 in one step (includes staying)
    (assigned ?d - day)                           ; day ?d has been assigned already
    (token ?t - token ?c - city)                  ; token ?t is an available day-token for city ?c
    (used ?t - token)                             ; token ?t has been consumed (day allocated for its city)
    (window-day ?d - day)                         ; day ?d is in the wedding window (days 8..11)
    (is-venice ?c - city)                         ; city is Venice
    (wedding-satisfied)                           ; at least one window-day was assigned to Venice
  )

  ; Generic assignment action for non-Venice target cities
  (:action assign-next-nonvenice
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city ?t - token)
    :precondition (and
      (day-next ?d1 ?d2)
      (at ?d1 ?c1)
      (connected ?c1 ?c2)
      (not (is-venice ?c2))        ; this action is NOT for Venice
      (token ?t ?c2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c2)
      (assigned ?d2)
      (used ?t)
      (not (token ?t ?c2))
    )
  )

  ; Assignment action for Venice when the target day is in the wedding window.
  ; This action both assigns Venice and marks the wedding requirement satisfied.
  (:action assign-next-venice-window
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city ?t - token)
    :precondition (and
      (day-next ?d1 ?d2)
      (at ?d1 ?c1)
      (connected ?c1 ?c2)
      (is-venice ?c2)            ; target must be Venice
      (window-day ?d2)           ; target day is in window (8..11)
      (token ?t ?c2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c2)
      (assigned ?d2)
      (used ?t)
      (not (token ?t ?c2))
      (wedding-satisfied)
    )
  )

  ; Assignment action for Venice when the target day is NOT in the wedding window.
  (:action assign-next-venice-nonwindow
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city ?t - token)
    :precondition (and
      (day-next ?d1 ?d2)
      (at ?d1 ?c1)
      (connected ?c1 ?c2)
      (is-venice ?c2)                 ; target is Venice
      (not (window-day ?d2))          ; target day is outside the wedding window
      (token ?t ?c2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c2)
      (assigned ?d2)
      (used ?t)
      (not (token ?t ?c2))
    )
  )
)