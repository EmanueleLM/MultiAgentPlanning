(define (domain city-trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)           ; city assigned for a specific day
    (occupied ?d - day)              ; day has been assigned a city
    (next ?d1 - day ?d2 - day)       ; day successor relation (d1 -> d2)
    (can-transition ?from - city ?to - city)  ; allowed one-day transition (includes stays)
    (krk-day ?d - day)               ; days on which KRK assignments are permitted
  )

  ; Assign target city = DBV for successor day
  (:action assign-to-DBV
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (can-transition ?from DBV)
      (not (occupied ?d2))
    )
    :effect (and
      (at DBV ?d2)
      (occupied ?d2)
    )
  )

  ; Assign target city = FRA for successor day
  (:action assign-to-FRA
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (can-transition ?from FRA)
      (not (occupied ?d2))
    )
    :effect (and
      (at FRA ?d2)
      (occupied ?d2)
    )
  )

  ; Assign target city = KRK for successor day; only allowed on days explicitly marked krk-day
  (:action assign-to-KRK
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (can-transition ?from KRK)
      (krk-day ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (at KRK ?d2)
      (occupied ?d2)
    )
  )
)