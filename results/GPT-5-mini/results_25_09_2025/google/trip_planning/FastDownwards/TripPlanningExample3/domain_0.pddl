(define (domain trip-domain)
  (:requirements :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next ?d1 ?d2 - day)            ; d2 is the day after d1
    (first ?d - day)                ; marks the first day
    (assigned ?d - day)             ; a city already assigned for this day
    (at ?c - city ?d - day)         ; traveler is at city c on day d
    (visited ?c - city)             ; traveler has visited city c at least once
    (direct ?c1 - city ?c2 - city)  ; a direct flight exists from c1 to c2
    (unstarted)                     ; true until traveler chooses a start city/day1
    (met_friend)                    ; traveler has met friend
    (meet_window ?d - day)          ; meeting allowed on this day (day 5 or 6)
    (is_meet_city ?c - city)        ; which city is used for meeting (Bucharest)
  )

  ;; Traveler actions (prefix traveler_)
  (:action traveler_start
    :parameters (?c - city ?d - day)
    :precondition (and (unstarted) (first ?d) (not (assigned ?d)))
    :effect (and
             (not (unstarted))
             (at ?c ?d)
             (visited ?c)
             (assigned ?d)
            )
  )

  (:action traveler_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (not (assigned ?d2)))
    :effect (and
             (at ?c ?d2)
             (visited ?c)
             (assigned ?d2)
            )
  )

  (:action traveler_meet
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (meet_window ?d) (is_meet_city ?c))
    :effect (met_friend)
  )

  ;; Flight office actions (prefix flightoffice_)
  ;; A single parametric flight action requiring a direct connection.
  (:action flightoffice_fly
    :parameters (?src - city ?dst - city ?d1 - day ?d2 - day)
    :precondition (and (at ?src ?d1) (next ?d1 ?d2) (direct ?src ?dst) (not (assigned ?d2)))
    :effect (and
             (at ?dst ?d2)
             (visited ?dst)
             (assigned ?d2)
            )
  )
)