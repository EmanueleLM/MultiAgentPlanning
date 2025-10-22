(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (block ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (on ?b - block ?s - block)     ; ?b is on top of block ?s
    (ontable ?b - block)           ; ?b is directly on the table
    (top ?b - block)               ; ?b is top of its stack (nothing on it)
  )

  ;; Vowel agent actions (may move only vowel blocks)
  (:action vowel-move-from-block-to-block
    :parameters (?b - block ?s - block ?dest - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?s)
      (top ?b)
      (top ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (on ?b ?s))
      (on ?b ?dest)
      ;; destination is no longer top
      (not (top ?dest))
      ;; source support becomes top (since its former top ?b moved)
      (top ?s)
      ;; moved block is top (no block on it after move)
      (top ?b)
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?b - block ?s - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?s)
      (top ?b)
    )
    :effect (and
      (not (on ?b ?s))
      (ontable ?b)
      ;; source support becomes top
      (top ?s)
      ;; moved block is top on the table
      (top ?b)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?dest - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (top ?b)
      (top ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      ;; destination loses top
      (not (top ?dest))
      ;; moved block is top
      (top ?b)
    )
  )

  ;; Consonant agent actions (may move only consonant blocks)
  (:action consonant-move-from-block-to-block
    :parameters (?b - block ?s - block ?dest - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?s)
      (top ?b)
      (top ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (on ?b ?s))
      (on ?b ?dest)
      (not (top ?dest))
      (top ?s)
      (top ?b)
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?b - block ?s - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?s)
      (top ?b)
    )
    :effect (and
      (not (on ?b ?s))
      (ontable ?b)
      (top ?s)
      (top ?b)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?b - block ?dest - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (top ?b)
      (top ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (not (top ?dest))
      (top ?b)
    )
  )

)