(define (domain blocks_world)
  (:requirements :strips)
  ;; Types omitted for broad compatibility with Fast Downward (no typing used).
  ;; Predicates:
  ;;  - (on ?x ?y)      : block ?x is on top of object ?y (y may be a block or the table)
  ;;  - (clear ?x)      : no block is on top of ?x and ?x is not being held (applies to blocks)
  ;;  - (holding ?x)    : the hand is holding block ?x
  ;;  - (handempty)     : the hand is empty
  (:predicates
    (on ?x ?y)
    (clear ?x)
    (holding ?x)
    (handempty)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions provided by the original local_planner (namespaced "lp-")
  ;; These action schemata implement exactly the preconditions/effects
  ;; described in the input. They maintain single-hand and clearness invariants.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;; lp-pickup: pick up a block that is currently on a surface (e.g., table).
  ;;; Origin: local_planner (PickUp)
  (:action lp-pickup
    :parameters (?b ?s)
    :precondition (and
      (handempty)
      (on ?b ?s)        ; ?s is typically the table (a surface object)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (handempty))
      (not (on ?b ?s))
      (not (clear ?b))
    )
  )

  ;;; lp-unstack: remove a block ?b from on top of block ?below.
  ;;; Origin: local_planner (Unstack)
  (:action lp-unstack
    :parameters (?b ?below)
    :precondition (and
      (handempty)
      (on ?b ?below)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (clear ?below)
      (not (on ?b ?below))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;;; lp-putdown: put a held block onto a surface (e.g., the table).
  ;;; Origin: local_planner (PutDown)
  (:action lp-putdown
    :parameters (?b ?s)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;;; lp-stack: place a held block ?b onto block ?dest.
  ;;; Origin: local_planner (Stack)
  (:action lp-stack
    :parameters (?b ?dest)
    :precondition (and
      (holding ?b)
      (clear ?dest)
    )
    :effect (and
      (on ?b ?dest)
      (not (clear ?dest))
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

)