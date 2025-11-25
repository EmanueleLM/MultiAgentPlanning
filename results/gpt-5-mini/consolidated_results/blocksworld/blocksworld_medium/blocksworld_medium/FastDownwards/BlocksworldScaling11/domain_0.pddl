(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block hand)

  (:predicates
    (ontable ?b - block)                 ; block is directly on the table
    (on ?b - block ?c - block)          ; block b is directly on block c
    (clear ?b - block)                  ; nothing on top of block b
    (holding ?h - hand ?b - block)      ; hand h is holding block b
    (handempty ?h - hand)               ; hand h is empty
  )

  ;; Pick up a clear block from the table with the single hand
  (:action pickup-from-table
    :parameters (?h - hand ?x - block)
    :precondition (and
                    (ontable ?x)
                    (clear ?x)
                    (handempty ?h)
                  )
    :effect (and
              (holding ?h ?x)
              (not (ontable ?x))
              (not (handempty ?h))
            )
  )

  ;; Put a held block down onto the table
  (:action put-down-on-table
    :parameters (?h - hand ?x - block)
    :precondition (and
                    (holding ?h ?x)
                  )
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty ?h)
              (not (holding ?h ?x))
            )
  )

  ;; Unstack a clear block from another block using the single hand
  (:action unstack-from-block
    :parameters (?h - hand ?x - block ?y - block)
    :precondition (and
                    (on ?x ?y)
                    (clear ?x)
                    (handempty ?h)
                  )
    :effect (and
              (holding ?h ?x)
              (not (on ?x ?y))
              (clear ?y)            ; removing x frees y
              (not (handempty ?h))
            )
  )

  ;; Stack a held block onto a clear block
  (:action stack-onto-block
    :parameters (?h - hand ?x - block ?y - block)
    :precondition (and
                    (holding ?h ?x)
                    (clear ?y)
                  )
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (clear ?y))      ; y is no longer clear once x is placed on it
              (handempty ?h)
              (not (holding ?h ?x))
            )
  )
)