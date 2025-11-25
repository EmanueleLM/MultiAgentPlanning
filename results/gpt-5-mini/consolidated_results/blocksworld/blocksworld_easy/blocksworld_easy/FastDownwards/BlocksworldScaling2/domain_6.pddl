(define (domain block-stacking-collab)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?c - block)
    (ontable ?b - block)
    (clear ?b - block)           ; no block on top AND not currently held
    (holding ?b - block)         ; true for the single block currently held
    (handempty)                  ; true when nothing is held
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Picker: handles picking up from table and unstacking from another block
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

  (:action picker-unstack
    :parameters (?b - block ?c - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (handempty)
      (on ?b ?c)
      (clear ?b)
      (not (= ?b ?c))
    )
    :effect (and
      (not (on ?b ?c))
      (holding ?b)
      (not (handempty))
      (clear ?c)
      (not (clear ?b))
      (not (current ?s1)) (current ?s2)
    )
  )

  ;; Stacker: handles putting down onto table and stacking onto another block
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

  (:action stacker-stack
    :parameters (?b - block ?c - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (holding ?b)
      (clear ?c)
      (not (= ?b ?c))
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