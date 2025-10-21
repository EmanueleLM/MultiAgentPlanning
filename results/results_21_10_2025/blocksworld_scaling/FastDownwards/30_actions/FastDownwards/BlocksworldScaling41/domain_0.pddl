(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (ontable ?x - block)
    (on ?x - block ?y - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;==== Vowel agent actions (may only move vowel-labeled blocks) ====

  (:action vowel-move-from-block-to-block
    :parameters (?x - block ?z - block ?y - block)
    :precondition (and (vowel ?x) (on ?x ?z) (clear ?x) (clear ?y))
    :effect (and
      (not (on ?x ?z))
      (on ?x ?y)
      (clear ?z)
      (not (clear ?y))
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (ontable ?x) (clear ?x) (clear ?y))
    :effect (and
      (not (ontable ?x))
      (on ?x ?y)
      (not (clear ?y))
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?x - block ?z - block)
    :precondition (and (vowel ?x) (on ?x ?z) (clear ?x))
    :effect (and
      (not (on ?x ?z))
      (ontable ?x)
      (clear ?z)
    )
  )

  ;==== Consonant agent actions (may only move consonant-labeled blocks) ====

  (:action consonant-move-from-block-to-block
    :parameters (?x - block ?z - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?z) (clear ?x) (clear ?y))
    :effect (and
      (not (on ?x ?z))
      (on ?x ?y)
      (clear ?z)
      (not (clear ?y))
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?x) (clear ?y))
    :effect (and
      (not (ontable ?x))
      (on ?x ?y)
      (not (clear ?y))
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?x - block ?z - block)
    :precondition (and (consonant ?x) (on ?x ?z) (clear ?x))
    :effect (and
      (not (on ?x ?z))
      (ontable ?x)
      (clear ?z)
    )
  )

)