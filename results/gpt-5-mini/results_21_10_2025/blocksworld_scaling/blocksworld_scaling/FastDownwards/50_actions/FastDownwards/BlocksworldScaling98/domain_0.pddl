(define (domain two-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?below - block)    ; ?b is directly on top of ?below
    (ontable ?b - block)              ; ?b is on the table
    (clear ?b - block)                ; no block on top of ?b
    (vowel ?b - block)                ; block is a vowel (vowel agent may move)
    (consonant ?b - block)            ; block is a consonant (consonant agent may move)
  )

  ;; Vowel agent actions (may move only vowel blocks)
  (:action vowel-move-from-block-to-block
    :parameters (?b - block ?under - block ?dest - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?under)
      (clear ?dest)
    )
    :effect (and
      (not (on ?b ?under))
      (on ?b ?dest)
      (clear ?under)
      (not (clear ?dest))
      (clear ?b)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?dest - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?dest)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (not (clear ?dest))
      (clear ?b)
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?b - block ?under - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?under)
    )
    :effect (and
      (not (on ?b ?under))
      (ontable ?b)
      (clear ?under)
      (clear ?b)
    )
  )

  ;; Consonant agent actions (may move only consonant blocks)
  (:action consonant-move-from-block-to-block
    :parameters (?b - block ?under - block ?dest - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?under)
      (clear ?dest)
    )
    :effect (and
      (not (on ?b ?under))
      (on ?b ?dest)
      (clear ?under)
      (not (clear ?dest))
      (clear ?b)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?b - block ?dest - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?dest)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (not (clear ?dest))
      (clear ?b)
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?b - block ?under - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?under)
    )
    :effect (and
      (not (on ?b ?under))
      (ontable ?b)
      (clear ?under)
      (clear ?b)
    )
  )
)