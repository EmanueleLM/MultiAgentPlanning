(define (domain blocks-world)
  (:requirements :typing :equality)

  (:types block)

  ;; ------------------------------------------------------------------
  ;; Predicates
  ;; ------------------------------------------------------------------
  (:predicates
    (ontable ?x - block)         ; block x is on the table
    (clear   ?x - block)         ; block x has no block on top of it
    (handempty)                  ; the agent's hand is empty
    (hand    ?x - block)         ; block x is in the hand
    (on      ?x - block ?y - block)   ; block x rests directly on block y
  )

  ;; ------------------------------------------------------------------
  ;; Actions
  ;; ------------------------------------------------------------------
  (:action pickup
    :parameters (?x - block)
    :precondition (and (clear ?x) (ontable ?x) (handempty))
    :effect (and
              (not (clear ?x))
              (not (ontable ?x))
              (hand ?x)
              (not (handempty)))
  )

  (:action putdown
    :parameters (?x - block)
    :precondition (hand ?x)
    :effect (and
              (handempty)
              (ontable ?x)
              (clear ?x)
              (not (hand ?x)))
  )

  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (hand ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (handempty)
              (clear ?x)
              (not (hand ?x))
              (not (clear ?y)))
  )

  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
              (hand ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty)))
  )
)