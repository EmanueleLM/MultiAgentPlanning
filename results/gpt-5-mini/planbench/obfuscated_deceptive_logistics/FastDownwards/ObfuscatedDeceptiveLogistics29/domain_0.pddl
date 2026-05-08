(define (domain sequence-linking)
  (:requirements :typing :strips :negative-preconditions)
  (:types agent obj)

  (:predicates
    (next ?from - obj ?to - obj)
    ;; Each object may have at most one successor (prevents a single object from being linked to multiple different successors).
    (has-successor ?o - obj)
  )

  ;; Actions kept distinct by agent-prefix in their names.
  ;; All three agent actions create a next relation between two objects.
  ;; Precondition enforces that the "from" object does not already have a successor,
  ;; so a single source cannot point to multiple different targets.
  ;; We do NOT prevent multiple predecessors for a target object (multiple different sources may point to the same target),
  ;; because the problem goal requires object_11 -> object_10 and object_13 -> object_10 simultaneously.

  (:action player_link
    :parameters (?from - obj ?to - obj)
    :precondition (and
                    (not (has-successor ?from))
                  )
    :effect (and
              (next ?from ?to)
              (has-successor ?from)
            )
  )

  (:action analyst_link
    :parameters (?from - obj ?to - obj)
    :precondition (and
                    (not (has-successor ?from))
                  )
    :effect (and
              (next ?from ?to)
              (has-successor ?from)
            )
  )

  (:action auditor_link
    :parameters (?from - obj ?to - obj)
    :precondition (and
                    (not (has-successor ?from))
                  )
    :effect (and
              (next ?from ?to)
              (has-successor ?from)
            )
  )
)