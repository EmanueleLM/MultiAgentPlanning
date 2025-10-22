(define (domain blocksworld-vowel-consonant)
  (:requirements :strips :typing :negative-preconditions)
  (:types support block tablepos
          vowel consonant - block)
  (:predicates
    (on ?b - block ?s - support)    ; block b is directly on support s (block or tablepos)
    (clear ?b - block)              ; block has nothing on top
    (empty ?t - tablepos)           ; table position empty
  )

  ;; Consonant moves: block -> block
  (:action move-consonant-from-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and
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
    :parameters (?b - consonant ?from - block ?t - tablepos)
    :precondition (and
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
    :parameters (?b - consonant ?t - tablepos ?to - block)
    :precondition (and
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
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and
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
    :parameters (?b - vowel ?from - block ?t - tablepos)
    :precondition (and
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
    :parameters (?b - vowel ?t - tablepos ?to - block)
    :precondition (and
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