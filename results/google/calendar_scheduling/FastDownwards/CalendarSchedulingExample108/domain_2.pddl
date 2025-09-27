(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (scheduled ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot ?lisa - person ?dorothy - person ?anthony - person ?ryan - person)
    :precondition (and
      (available ?lisa ?s)
      (available ?dorothy ?s)
      (available ?anthony ?s)
      (available ?ryan ?s)
    )
    :effect (and (scheduled ?s))
  )
)