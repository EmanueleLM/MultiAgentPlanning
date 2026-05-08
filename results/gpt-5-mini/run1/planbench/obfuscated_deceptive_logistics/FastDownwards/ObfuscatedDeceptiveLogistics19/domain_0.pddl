(define (domain ordering)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (next ?a - object ?b - object)
    (has-successor ?a - object)
    (has-predecessor ?a - object)
  )

  ;; Action to establish that one object is immediately next to another.
  ;; This action is only applicable when the predecessor has no successor
  ;; and the successor has no predecessor, preventing conflicting links.
  (:action set-next
    :parameters (?pred - object ?succ - object)
    :precondition (and
      (not (has-successor ?pred))
      (not (has-predecessor ?succ))
    )
    :effect (and
      (next ?pred ?succ)
      (has-successor ?pred)
      (has-predecessor ?succ)
    )
  )
)