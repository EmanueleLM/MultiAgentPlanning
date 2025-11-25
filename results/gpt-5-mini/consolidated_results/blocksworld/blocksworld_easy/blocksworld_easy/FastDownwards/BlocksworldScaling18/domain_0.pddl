(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)     ; ?x is on top of ?y
    (ontable ?x - block)           ; ?x is on the table
    (clear ?x - block)             ; nothing on top of ?x
    (holding ?x - block)           ; the agent is holding ?x
    (handempty)                    ; the agent's hand is empty
  )

  ;; Pick up a block from the table and hold it.
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Put down a held block onto the table.
  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Unstack a block from on top of another block (take ?b off ?c) and hold it.
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?c)            ; removing ?b exposes ?c, so ?c becomes clear
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Stack a held block onto another clear block.
  ;; Stacking removes the clear property from the target block.
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and (holding ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (clear ?c))   ; target is no longer clear after stacking
      (not (holding ?b))
    )
  )
)