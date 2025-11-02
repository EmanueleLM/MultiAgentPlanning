(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel_agent consonant_agent)

  (:predicates
    (on ?b - block ?s - block)     ; block ?b is directly on block ?s
    (ontable ?b - block)           ; block ?b is directly on the table
    (clear ?b - block)             ; nothing is on top of block ?b
    (is-vowel ?b - block)          ; static: block is vowel (A,E,I)
    (is-consonant ?b - block)      ; static: block is consonant
  )

  ;; Vowel agent actions (can manipulate only vowel-labelled blocks)

  (:action vowel-move-block-to-block
    :parameters (?ag - vowel_agent ?b - block ?from - block ?to - block)
    :precondition (and
      (is-vowel ?b)
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

  (:action vowel-move-table-to-block
    :parameters (?ag - vowel_agent ?b - block ?to - block)
    :precondition (and
      (is-vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?ag - vowel_agent ?b - block ?from - block)
    :precondition (and
      (is-vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ;; Consonant agent actions (can manipulate only consonant-labelled blocks)

  (:action consonant-move-block-to-block
    :parameters (?ag - consonant_agent ?b - block ?from - block ?to - block)
    :precondition (and
      (is-consonant ?b)
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

  (:action consonant-move-table-to-block
    :parameters (?ag - consonant_agent ?b - block ?to - block)
    :precondition (and
      (is-consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?ag - consonant_agent ?b - block ?from - block)
    :precondition (and
      (is-consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)