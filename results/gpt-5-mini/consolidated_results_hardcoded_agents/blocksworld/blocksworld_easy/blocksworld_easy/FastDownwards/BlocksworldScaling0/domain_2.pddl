(define (domain orchestrator-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?s - block)       ; ?b is on top of ?s
    (ontable ?b - block)             ; ?b is on the table
    (clear ?b - block)               ; nothing on top of ?b and ?b is not being held
    (holding ?b - block)             ; the (single) hand is holding ?b
    (handempty)                      ; the (single) hand is empty

    ;; explicit discrete stage progression predicates
    (now ?t - stage)                 ; current stage/timepoint
    (next ?t1 - stage ?t2 - stage)   ; successor relation between stages
  )

  ;; pick-up from table: consumes a stage and advances to its successor
  (:action pick-up
    :parameters (?b - block ?from - stage ?to - stage)
    :precondition (and
      (handempty)
      (ontable ?b)
      (clear ?b)
      (now ?from)
      (next ?from ?to)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))   ; being held => not clear
      (not (handempty))
      (not (now ?from))
      (now ?to)
    )
  )

  ;; unstack a top block from another block: consumes a stage and advances to its successor
  (:action unstack
    :parameters (?b - block ?s - block ?from - stage ?to - stage)
    :precondition (and
      (handempty)
      (on ?b ?s)
      (clear ?b)
      (now ?from)
      (next ?from ?to)
    )
    :effect (and
      (holding ?b)
      (clear ?s)         ; support becomes clear after removal
      (not (on ?b ?s))
      (not (clear ?b))   ; being held => not clear
      (not (handempty))
      (not (now ?from))
      (now ?to)
    )
  )

  ;; put down a held block onto the table: consumes a stage and advances to its successor
  (:action put-down
    :parameters (?b - block ?from - stage ?to - stage)
    :precondition (and
      (holding ?b)
      (now ?from)
      (next ?from ?to)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (now ?from))
      (now ?to)
    )
  )

  ;; stack a held block onto another block: consumes a stage and advances to its successor
  (:action stack
    :parameters (?b - block ?tgt - block ?from - stage ?to - stage)
    :precondition (and
      (holding ?b)
      (clear ?tgt)
      (now ?from)
      (next ?from ?to)
    )
    :effect (and
      (on ?b ?tgt)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (clear ?tgt))   ; target is no longer clear once something is stacked on it
      (not (now ?from))
      (now ?to)
    )
  )
)