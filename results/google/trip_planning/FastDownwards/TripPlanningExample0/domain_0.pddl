(define (domain trip)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)        ; agent is at city ?c at the start of day ?d
    (next ?d1 - day ?d2 - day)    ; consecutive days relation: ?d2 is the day after ?d1
    (conn ?c1 - city ?c2 - city)  ; there is a direct flight connection between ?c1 and ?c2
  )

  ; Stay in the same city from one day to the next
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and
      (not (at ?c ?d))
      (at ?c ?d2)
    )
  )

  ; Fly from one city to another on the same day (arrive the next day).
  ; Allowed only when there is a direct connection (conn).
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (next ?d ?d2) (conn ?from ?to))
    :effect (and
      (not (at ?from ?d))
      (at ?to ?d2)
    )
  )
)