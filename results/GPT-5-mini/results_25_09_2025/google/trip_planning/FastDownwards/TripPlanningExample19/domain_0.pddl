(define (domain trip-orchestration)
  (:requirements :strips :typing :fluents :negative-preconditions)
  (:types agent city)

  (:predicates
    (traveler-agent ?a - agent)
    (flights-agent ?a - agent)
    (at ?a - agent ?c - city)
    (direct ?c1 - city ?c2 - city)
    (flight-available ?c1 - city ?c2 - city)
    (met-friends)
  )

  (:functions
    (current-day)        ; integer count of days passed
    (remaining-days)     ; integer remaining days to spend (trip length)
    (need-brussels)      ; remaining required days in Brussels
    (need-valencia)      ; remaining required days in Valencia
    (need-nice)          ; remaining required days in Nice
  )

  ;; flights_info agent action: publish/enable a direct flight so traveler may use it
  (:action flights_info-provide
    :parameters (?fa - agent ?from - city ?to - city)
    :precondition (and (flights-agent ?fa) (direct ?from ?to))
    :effect (and (flight-available ?from ?to) (flight-available ?to ?from))
  )

  ;; traveler agent action: fly using an available direct flight
  (:action traveler-fly
    :parameters (?ta - agent ?from - city ?to - city)
    :precondition (and (traveler-agent ?ta) (at ?ta ?from) (flight-available ?from ?to))
    :effect (and (not (at ?ta ?from)) (at ?ta ?to))
  )

  ;; traveler stays in Brussels for one day: reduces need and remaining days, increments current day
  (:action traveler-stay-brussels
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (>= (need-brussels) 1) (>= (remaining-days) 1))
    :effect (and
      (assign (need-brussels) (- (need-brussels) 1))
      (assign (remaining-days) (- (remaining-days) 1))
      (assign (current-day) (+ (current-day) 1))
    )
  )

  ;; traveler stays in Valencia for one day
  (:action traveler-stay-valencia
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (>= (need-valencia) 1) (>= (remaining-days) 1))
    :effect (and
      (assign (need-valencia) (- (need-valencia) 1))
      (assign (remaining-days) (- (remaining-days) 1))
      (assign (current-day) (+ (current-day) 1))
    )
  )

  ;; traveler stays in Nice for one day
  (:action traveler-stay-nice
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (>= (need-nice) 1) (>= (remaining-days) 1))
    :effect (and
      (assign (need-nice) (- (need-nice) 1))
      (assign (remaining-days) (- (remaining-days) 1))
      (assign (current-day) (+ (current-day) 1))
    )
  )

  ;; traveler meets friends in Nice between day 1 and day 6 (inclusive)
  (:action traveler-meet-friends
    :parameters (?ta - agent)
    :precondition (and
      (traveler-agent ?ta)
      (at ?ta nice)
      (>= (current-day) 1)
      (<= (current-day) 6)
      (not (met-friends))
    )
    :effect (met-friends)
  )
)