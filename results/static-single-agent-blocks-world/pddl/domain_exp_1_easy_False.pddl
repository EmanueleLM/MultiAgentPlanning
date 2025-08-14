(define (domain blocks)
  (:requirements :typing :strips)

  (:types block)

  ;; ------------------------------------------------------------------
  ;; Predicates
  ;; ------------------------------------------------------------------
  (:predicates
      (clear ?b - block)                 ; nothing on top of ?b
      (ontable ?b - block)               ; ?b is directly on the table
      (on ?b1 - block ?b2 - block)       ; ?b1 is directly on top of ?b2
  )

  ;; ------------------------------------------------------------------
  ;; Action: Pick‑up a block from the table when it is clear
  ;; ------------------------------------------------------------------
  (:action pickup
      :parameters (?b - block)
      :precondition (and (clear ?b)
                         (ontable ?b))
      :effect (and (not (clear ?b))
                   (not (ontable ?b)))
  )

  ;; ------------------------------------------------------------------
  ;; Action: Put‑down a block on the table
  ;; ------------------------------------------------------------------
  (:action putdown
      :parameters (?b - block)
      :precondition (clear ?b)                 ; we are already holding ?b
      :effect (and (clear ?b)
                   (ontable ?b))
  )

  ;; ------------------------------------------------------------------
  ;; Action: Stack a held block onto a clear block
  ;; ------------------------------------------------------------------
  (:action stack
      :parameters (?b1 - block ?b2 - block)
      :precondition (and (clear ?b1)
                         (clear ?b2))
      :effect (and (clear ?b1)
                   (clear ?b2)
                   (on ?b1 ?b2)
                   (not (ontable ?b1)))
  )

  ;; ------------------------------------------------------------------
  ;; Action: Unstack a held block that is on top of another block
  ;; ------------------------------------------------------------------
  (:action unstack
      :parameters (?b1 - block ?b2 - block)
      :precondition (and (clear ?b1)
                         (on ?b1 ?b2))
      :effect (and (clear ?b1)
                   (clear ?b2)
                   (not (on ?b1 ?b2))
                   (not (ontable ?b1)))
  )
)