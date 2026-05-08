(define (domain blocks-picker)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; on ?x ?y : block ?x is directly on object ?y (either another block or the table)
    (on ?x ?y)
    ;; holding ?x : the agent's hand is holding block ?x
    (holding ?x)
    ;; hand-empty : the agent's hand holds no block
    (hand-empty)
    ;; clear ?x : nothing is on top of block ?x AND ?x is not being held
    (clear ?x)
  )

  ;; PickUp a block from the table (picker namespace to keep agent actions distinct).
  ;; Preconditions (must hold at action start):
  ;;   - hand-empty
  ;;   - on ?b table
  ;;   - clear ?b
  ;; Effects (become true at action end, deterministic, atomic):
  ;;   - add holding ?b
  ;;   - delete hand-empty
  ;;   - delete on ?b table
  ;;   - delete clear ?b  (a held block is not clear by definition)
  (:action picker-pickup
    :parameters (?b)
    :precondition (and
      (hand-empty)
      (on ?b table)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (hand-empty))
      (not (on ?b table))
      (not (clear ?b))
    )
  )

  ;; PutDown a held block onto the table.
  ;; Preconditions:
  ;;   - holding ?b
  ;; Effects:
  ;;   - add hand-empty
  ;;   - add on ?b table
  ;;   - add clear ?b
  ;;   - delete holding ?b
  (:action picker-putdown
    :parameters (?b)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (hand-empty)
      (on ?b table)
      (clear ?b)
      (not (holding ?b))
    )
  )

  ;; Unstack block ?x from block ?y (pick the top block ?x off ?y).
  ;; Preconditions:
  ;;   - hand-empty
  ;;   - on ?x ?y
  ;;   - clear ?x
  ;;   - ?x != ?y
  ;; Effects:
  ;;   - add holding ?x
  ;;   - delete hand-empty
  ;;   - delete on ?x ?y
  ;;   - delete clear ?x  (held block is not clear)
  ;;   - add clear ?y      (support becomes clear after removal of its top block)
  (:action picker-unstack
    :parameters (?x ?y)
    :precondition (and
      (hand-empty)
      (on ?x ?y)
      (clear ?x)
      (not (= ?x ?y))
    )
    :effect (and
      (holding ?x)
      (not (hand-empty))
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
    )
  )

  ;; Stack held block ?a onto block ?b.
  ;; Preconditions:
  ;;   - holding ?a
  ;;   - clear ?b
  ;;   - ?a != ?b
  ;; Effects:
  ;;   - add on ?a ?b
  ;;   - add clear ?a
  ;;   - add hand-empty
  ;;   - delete holding ?a
  ;;   - delete clear ?b
  (:action picker-stack
    :parameters (?a ?b)
    :precondition (and
      (holding ?a)
      (clear ?b)
      (not (= ?a ?b))
    )
    :effect (and
      (on ?a ?b)
      (clear ?a)
      (hand-empty)
      (not (holding ?a))
      (not (clear ?b))
    )
  )
)