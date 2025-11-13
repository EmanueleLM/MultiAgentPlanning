(define (domain meeting-planning-example28)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types location)
  (:predicates
    (at ?l - location)
    (edge ?from - location ?to - location)
    (joshua-loc ?l - location)
    (met-joshua)
  )
  (:functions
    (current-time)
    (travel-time ?from - location ?to - location)
    (total-cost)
  )

  (:action wait-1
    :precondition (and)
    :effect (and
      (increase (current-time) 1)
      (increase (total-cost) 1)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (edge ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (current-time) (travel-time ?from ?to))
      (increase (total-cost) (travel-time ?from ?to))
    )
  )

  (:action meet-joshua-75
    :parameters (?l - location)
    :precondition (and
      (joshua-loc ?l)
      (at ?l)
      (not (met-joshua))
      (>= (current-time) 1080)
      (<= (current-time) 1215)
    )
    :effect (and
      (met-joshua)
      (increase (current-time) 75)
    )
  )
)