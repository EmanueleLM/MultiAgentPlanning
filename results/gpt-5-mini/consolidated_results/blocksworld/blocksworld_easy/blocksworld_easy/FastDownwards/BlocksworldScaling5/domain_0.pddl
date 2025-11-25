(define (domain blocksworld-manipulator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block object)
  (:predicates
    (on ?b - block ?x - object)     ; b is immediately on x (x can be a block or the table)
    (on-table ?b - block)           ; shorthand/kept fact for being on the table
    (clear ?b - block)              ; no block on top of b AND b is not being held
    (holding ?b - block)            ; the single hand is holding b
    (hand-empty)                    ; the hand holds nothing
  )

  ;; pick-up: pick a clear block from the table into the hand
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (hand-empty) (clear ?b) (on ?b table))
    :effect (and
      (holding ?b)
      (not (hand-empty))
      (not (on ?b table))
      (not (on-table ?b))
      (not (clear ?b))
    )
  )

  ;; unstack: pick a clear block b from directly on block s into the hand
  (:action unstack
    :parameters (?b - block ?s - block)
    :precondition (and (hand-empty) (clear ?b) (on ?b ?s))
    :effect (and
      (holding ?b)
      (not (hand-empty))
      (not (on ?b ?s))
      (not (clear ?b))
      (clear ?s)
    )
  )

  ;; put-down: place a held block b onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
      (on ?b table)
      (on-table ?b)
      (clear ?b)
      (hand-empty)
      (not (holding ?b))
    )
  )

  ;; stack: place a held block b onto a clear support block s
  (:action stack
    :parameters (?b - block ?s - block)
    :precondition (and (holding ?b) (clear ?s) (not (= ?b ?s)))
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (hand-empty)
      (not (holding ?b))
      (not (clear ?s))
    )
  )
)