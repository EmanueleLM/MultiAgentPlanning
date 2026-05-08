(define (domain meeting_planning)
  (:requirements :strips :typing)
  ;; Types: traveler and person are subtypes of agent; location and time are separate types.
  (:types traveler person - agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)            ; agent ?a is at location ?l at time ?t
    (travel_link ?from - location ?to - location ?tfrom - time ?tto - time) ; explicit allowed travel leg between two timepoints
    (next ?tfrom - time ?tto - time)                  ; ordered timepoints (immediate successor in model)
    (met-with-mary)                                   ; goal predicate: traveler met Mary for required span
  )

  ;; Wait: propagate presence of the traveler from one timepoint to the next at the same location.
  (:action wait
    :parameters (?tr - traveler ?loc - location ?tfrom - time ?tto - time)
    :precondition (and
      (at ?tr ?loc ?tfrom)
      (next ?tfrom ?tto)
    )
    :effect (and
      (not (at ?tr ?loc ?tfrom))
      (at ?tr ?loc ?tto)
    )
  )

  ;; Travel: follow an explicitly declared travel_link. This prevents inventing routes.
  (:action travel
    :parameters (?tr - traveler ?from - location ?to - location ?tfrom - time ?tto - time)
    :precondition (and
      (at ?tr ?from ?tfrom)
      (travel_link ?from ?to ?tfrom ?tto)
    )
    :effect (and
      (not (at ?tr ?from ?tfrom))
      (at ?tr ?to ?tto)
    )
  )

  ;; Meet Mary: instance-specific action that enforces presence at Marina at both the 20:00 and 22:00 timepoints.
  ;; This encodes the 120-minute minimum meeting span with Mary (Mary's availability is exactly 20:00-22:00).
  (:action meet_mary
    :parameters (?tr - traveler ?m - person)
    :precondition (and
      ;; both parties must be at marina at the start and end time of the required span
      (at ?tr marina t20)
      (at ?m marina t20)
      (at ?tr marina t22)
      (at ?m marina t22)
    )
    :effect (and
      (met-with-mary)
    )
  )
)