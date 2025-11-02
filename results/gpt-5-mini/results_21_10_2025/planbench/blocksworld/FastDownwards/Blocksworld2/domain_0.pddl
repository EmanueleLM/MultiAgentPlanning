(define (domain blocksworld-integrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (On ?x - block ?y - block)        ; block X is directly on block Y
    (OnTable ?x - block)              ; block X is directly on the table
    (Clear ?x - block)                ; block X has no block on top and is not being held
    (Holding ?a - agent ?x - block)   ; agent A is holding block X
    (HandEmpty ?a - agent)            ; agent A's hand is empty
  )

  ;; Pick up a block from the table
  (:action pick-up
    :parameters (?a - agent ?x - block)
    :precondition (and (OnTable ?x) (Clear ?x) (HandEmpty ?a))
    :effect (and
              (Holding ?a ?x)
              (not (OnTable ?x))
              (not (HandEmpty ?a))
              (not (Clear ?x))
            )
  )

  ;; Unstack a block X from on top of block Y
  (:action unstack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (On ?x ?y) (Clear ?x) (HandEmpty ?a))
    :effect (and
              (Holding ?a ?x)
              (not (On ?x ?y))
              (not (HandEmpty ?a))
              (Clear ?y)
              (not (Clear ?x))
            )
  )

  ;; Put a held block down on the table
  (:action put-down
    :parameters (?a - agent ?x - block)
    :precondition (and (Holding ?a ?x))
    :effect (and
              (OnTable ?x)
              (Clear ?x)
              (HandEmpty ?a)
              (not (Holding ?a ?x))
            )
  )

  ;; Stack a held block X on top of block Y
  (:action stack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (Holding ?a ?x) (Clear ?y))
    :effect (and
              (On ?x ?y)
              (not (Clear ?y))
              (Clear ?x)
              (HandEmpty ?a)
              (not (Holding ?a ?x))
            )
  )
)