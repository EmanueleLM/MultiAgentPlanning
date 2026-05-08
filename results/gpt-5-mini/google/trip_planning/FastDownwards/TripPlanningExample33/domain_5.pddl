(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day token)

  (:predicates
    (on ?d - day ?c - city)              ; day d is spent in city c (intensional; no actions provided)
    (succ ?d1 - day ?d2 - day)           ; d2 immediately follows d1
    (flight ?from - city ?to - city)     ; direct flight exists between cities
    (token_used ?t - token)              ; token t has been consumed (no actions in this domain)
    (token_city ?t - token ?c - city)    ; token t is associated with city c
    (meet_window ?d - day)               ; day d is inside allowed meeting window
    (met_friend)                         ; friend has been met (no actions in this domain)
  )
)