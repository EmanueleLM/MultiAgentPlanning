(define (domain combined-meet)
  (:requirements :strips :typing :negative-preconditions :equality :fluents :timed-initial-literals)
  (:types location)

  (:predicates
    ;; unified traveler position predicate (used by both agents' actions)
    (at ?l - location)

    ;; John's presence at a location (will be asserted as timed-initial-literals in the problem)
    (john-at ?l - location)

    ;; goal predicate: traveler has met John for the required 75 minutes
    (met)
  )

  (:functions
    (time)  ; global clock in minutes after midnight
  )

  ;; Actions belonging to "Traveler" agent (kept distinct by name)
  (:action traveler-travel
    :parameters (?from - location ?to - location)
    :precondition (and (at ?from) (not (at ?to)))
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (time) 23)   ; travel takes 23 minutes
    )
  )

  ;; Traveler's meeting action (explicitly distinct)
  (:action traveler-meet-with-john
    :parameters (?loc - location)
    :precondition (and
      (at ?loc)
      (john-at ?loc)
      (>= (time) 1050)               ; cannot start before 17:30
      (<= (+ (time) 75) 1260)        ; must finish by 21:00 (75-minute meeting)
    )
    :effect (and
      (met)
      (increase (time) 75)
    )
  )

  ;; Actions belonging to "Agent2" (kept distinct and explicit)
  (:action agent2-travel
    :parameters (?from - location ?to - location)
    :precondition (and (at ?from) (not (at ?to)))
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (time) 23)
    )
  )

  (:action agent2-wait-until-1027
    :parameters ()
    :precondition (<= (time) 1027)
    :effect (assign (time) 1027)
  )

  (:action agent2-meet
    :parameters (?loc - location)
    :precondition (and
      (at ?loc)
      (john-at ?loc)
      (>= (time) 1050)
      (<= (+ (time) 75) 1260)
    )
    :effect (and
      (met)
      (increase (time) 75)
    )
  )
)