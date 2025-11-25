(define (domain blocks-singlehand)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (clear ?b - block)            ; true iff nothing is on ?b
    (handempty)                   ; true iff the single hand is empty
    (holding ?b - block)          ; true iff the single hand holds block ?b
    (on ?x - block ?y - block)    ; true iff block ?x is directly on block ?y
    (ontable ?b - block)          ; true iff block ?b is directly on the table
    (distinct ?a - block ?b - block) ; explicit distinctness facts for block identity
  )

  ;; pick-up: take a clear block from the table into the single hand
  (:action pick-up
    :parameters (?x - block)
    :precondition (and
                    (ontable ?x)
                    (clear ?x)
                    (handempty)
                  )
    :effect (and
              (holding ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
            )
  )

  ;; put-down: place a held block onto the table
  (:action put-down
    :parameters (?x - block)
    :precondition (and
                    (holding ?x)
                  )
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))
            )
  )

  ;; unstack: remove a clear block ?x from on top of block ?y into the hand
  ;; enforces argument distinctness via the distinct predicate
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and
                    (on ?x ?y)
                    (clear ?x)
                    (handempty)
                    (distinct ?x ?y)
                  )
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
            )
  )

  ;; stack: place a held block ?x on top of a clear block ?y
  ;; enforces argument distinctness via the distinct predicate
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and
                    (holding ?x)
                    (clear ?y)
                    (distinct ?x ?y)
                  )
    :effect (and
              (on ?x ?y)
              (handempty)
              (clear ?x)
              (not (holding ?x))
              (not (clear ?y))
            )
  )
)