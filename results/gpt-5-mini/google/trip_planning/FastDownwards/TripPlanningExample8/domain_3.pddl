(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (succ ?d1 - day ?d2 - day)                 ; successor relation for discrete days
    (unassigned ?d - day)                     ; day not yet assigned to a city
    (at ?c - city ?d - day)                   ; being in city c on day d
    (direct_flight ?from - city ?to - city)   ; allowed direct-flight connection (directional)
    (flight_taken ?from - city ?to - city ?d - day) ; flight arriving on day d from from->to
    (total_days_16)                           ; global fact to enforce horizon
  )

  ;; start the trip on day1 in a chosen city (assign day1 to that city)
  (:action start-day1
    :parameters (?c - city)
    :precondition (and (unassigned day1))
    :effect (and (not (unassigned day1)) (at ?c day1))
  )

  ;; stay in the same city for the successor day (assign successor day to same city)
  (:action stay-next-day
    :parameters (?c - city ?dprev - day ?d - day)
    :precondition (and (at ?c ?dprev) (succ ?dprev ?d) (unassigned ?d))
    :effect (and (not (unassigned ?d)) (at ?c ?d))
  )

  ;; take a direct flight from one city to another, arriving on the successor day
  (:action fly
    :parameters (?from - city ?to - city ?dprev - day ?d - day)
    :precondition (and (at ?from ?dprev) (succ ?dprev ?d) (unassigned ?d) (direct_flight ?from ?to))
    :effect (and
      (not (unassigned ?d))
      (at ?to ?d)
      (flight_taken ?from ?to ?d)
    )
  )
)