(define (domain block-stacking-collab)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?c - block)
    (ontable ?b - block)
    (clear ?b - block)           ; true iff no block on top AND block is not being held
    (holding ?b - block)         ; the single block currently held (if any)
    (handempty)                  ; true when nothing is held
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Picker: pick up a block from the table
  (:action picker-pickup
    :parameters (?b - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (handempty)
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?b)
      (not (handempty))
      (not (clear ?b))

      ;; advance discrete stage
      (not (current ?s1)) (current ?s2)
    )
  )

  ;; Picker: unstack a block from another block (the block must actually be on the support)
  (:action picker-unstack
    :parameters (?b - block ?c - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (handempty)
      (on ?b ?c)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?c))
      (holding ?b)
      (not (handempty))
      (clear ?c)
      (not (clear ?b))

      ;; advance discrete stage
      (not (current ?s1)) (current ?s2)
    )
  )

  ;; Stacker: put down the held block onto the table
  (:action stacker-putdown
    :parameters (?b - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)

      ;; advance discrete stage
      (not (current ?s1)) (current ?s2)
    )
  )

  ;; Stacker: stack the held block onto a clear target block
  (:action stacker-stack
    :parameters (?b - block ?c - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (not (ontable ?b))
      (clear ?b)
      (not (clear ?c))
      (not (holding ?b))
      (handempty)

      ;; advance discrete stage
      (not (current ?s1)) (current ?s2)
    )
  )
)