(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)

  (:predicates
    (on ?d - day ?c - city)                  ; day d is spent in city c
    (day_unassigned ?d - day)               ; day d still needs assignment
    (succ ?d1 - day ?d2 - day)               ; d2 immediately follows d1
    (flight ?from - city ?to - city)        ; direct flight exists
    (token_available ?t - token)            ; token t available to consume (represents one day of stay in a city)
    (token_city ?t - token ?c - city)       ; token t is tied to city c
    (token_used ?t - token)                 ; token t has been consumed (a day assigned)
    (meet_window ?d - day)                  ; day d is inside the allowed meeting window
    (met_friend)                            ; friend met (goal)
  )

  ; assign the very first day to a city by consuming a token
  (:action assign_first_day
    :parameters (?d - day ?c - city ?t - token)
    :precondition (and
      (day_unassigned ?d)
      (token_available ?t)
      (token_city ?t ?c)
    )
    :effect (and
      (on ?d ?c)
      (token_used ?t)
      (not (day_unassigned ?d))
      (not (token_available ?t))
    )
  )

  ; assign a next day to the same city as the previous day (no flight needed)
  (:action assign_next_day_same
    :parameters (?dprev - day ?d - day ?c - city ?t - token)
    :precondition (and
      (on ?dprev ?c)
      (succ ?dprev ?d)
      (day_unassigned ?d)
      (token_available ?t)
      (token_city ?t ?c)
    )
    :effect (and
      (on ?d ?c)
      (token_used ?t)
      (not (day_unassigned ?d))
      (not (token_available ?t))
    )
  )

  ; assign a next day to a different city reachable by a direct flight from the previous day's city
  (:action assign_next_day_fly
    :parameters (?dprev - day ?d - day ?cfrom - city ?cto - city ?t - token)
    :precondition (and
      (on ?dprev ?cfrom)
      (succ ?dprev ?d)
      (flight ?cfrom ?cto)
      (day_unassigned ?d)
      (token_available ?t)
      (token_city ?t ?cto)
    )
    :effect (and
      (on ?d ?cto)
      (token_used ?t)
      (not (day_unassigned ?d))
      (not (token_available ?t))
    )
  )

  ; meet the friend on any allowed day in the meeting window while being in krakow
  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (on ?d krakow)
      (meet_window ?d)
      (not (met_friend))
    )
    :effect (and
      (met_friend)
    )
  )
)