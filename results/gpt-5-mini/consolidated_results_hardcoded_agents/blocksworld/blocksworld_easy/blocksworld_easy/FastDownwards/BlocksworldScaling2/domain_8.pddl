(define (domain block-stacking-collab)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?c - block)
    (ontable ?b - block)
    (clear ?b - block)           ; no block on top AND not held
    (holding ?b - block)         ; hand is holding this block
    (handempty)                  ; true when nothing is held
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Picker: pick up a block from the table (single-step stage advance)
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

      (not (current ?s1)) (current ?s2)
    )
  )

  ;; Picker: unstack a block from on top of another block (single-step stage advance)
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
      (not (clear ?b))
      (clear ?c)

      (not (current ?s1)) (current ?s2)
    )
  )

  ;; Stacker: put down the held block onto the table (single-step stage advance)
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

      (not (current ?s1)) (current ?s2)
    )
  )

  ;; Stacker: stack the held block onto a clear target block (single-step stage advance)
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

      (not (current ?s1)) (current ?s2)
    )
  )
)