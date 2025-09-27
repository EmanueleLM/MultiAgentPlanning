(define (domain meet-visitors-classical)
  (:requirements :typing :negative-preconditions :numeric-fluents :action-costs)
  (:types person location)
  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person)
    (accounted ?p - person)
  )
  (:functions
    (time)
    (total-cost)
    (carol-start)
    (carol-end)
  )

  (:action visitor-travel-nobhill-to-sunset
    :parameters (?v - person)
    :precondition (and (at ?v nob_hill))
    :effect (and (not (at ?v nob_hill)) (at ?v sunset_district) (increase (time) 25))
  )

  (:action visitor-travel-sunset-to-nobhill
    :parameters (?v - person)
    :precondition (and (at ?v sunset_district))
    :effect (and (not (at ?v sunset_district)) (at ?v nob_hill) (increase (time) 27))
  )

  (:action visitor-meet-carol
    :parameters (?v - person ?c - person)
    :precondition (and
      (at ?v sunset_district)
      (at ?c sunset_district)
      (not (met ?c))
      (>= (time) (carol-start))
      (<= (+ (time) 75) (carol-end))
    )
    :effect (and
      (met ?c)
      (accounted ?c)
      (increase (time) 75)
      (increase (total-cost) -1)
    )
  )

  (:action visitor-skip-carol
    :parameters (?c - person)
    :precondition (and (not (accounted ?c)))
    :effect (and (accounted ?c) (increase (total-cost) 1))
  )
)