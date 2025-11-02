(define (domain blocksworld-vowel-consonant)
  (:requirements :typing :negative-preconditions)
  (:types block tablepos)

  (:predicates
    (on ?b - block ?s - (either block tablepos))    ; block b is directly on block or tablepos s
    (clear ?b - block)                              ; block has nothing on top
    (empty ?t - tablepos)                           ; table position empty
    (vowel ?b - block)                              ; block is a vowel-labelled block (agent permission)
    (consonant ?b - block)                          ; block is a consonant-labelled block (agent permission)
  )

  ;; Consonant moves: block -> block
  (:action move-consonant-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Consonant moves: block -> tablepos
  (:action move-consonant-from-block-to-table
    :parameters (?b - block ?from - block ?t - tablepos)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (empty ?t)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?t)
      (clear ?from)
      (not (empty ?t))
    )
  )

  ;; Consonant moves: tablepos -> block
  (:action move-consonant-from-table-to-block
    :parameters (?b - block ?t - tablepos ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?t)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?t))
      (on ?b ?to)
      (not (clear ?to))
      (empty ?t)
    )
  )

  ;; Vowel moves: block -> block
  (:action move-vowel-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Vowel moves: block -> tablepos
  (:action move-vowel-from-block-to-table
    :parameters (?b - block ?from - block ?t - tablepos)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (empty ?t)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?t)
      (clear ?from)
      (not (empty ?t))
    )
  )

  ;; Vowel moves: tablepos -> block
  (:action move-vowel-from-table-to-block
    :parameters (?b - block ?t - tablepos ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?t)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?t))
      (on ?b ?to)
      (not (clear ?to))
      (empty ?t)
    )
  )
)