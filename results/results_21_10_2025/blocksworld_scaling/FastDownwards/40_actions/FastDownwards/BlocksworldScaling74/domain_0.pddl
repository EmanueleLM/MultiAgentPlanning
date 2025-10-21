(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    ;; Relations describing the world
    (on ?b - block ?p - block)    ; block ?b is on top of block ?p
    (ontable ?b - block)         ; block ?b is directly on the table
    (clear ?b - block)           ; no block is on top of ?b (i.e., ?b is a top)
    ;; Agent-capability labels
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Vowel agent actions (may move only vowel-labeled blocks)
  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (clear ?b) (clear ?to) (on ?b ?from))
    :effect (and
      ;; remove old support
      (not (on ?b ?from))
      ;; place on new block
      (on ?b ?to)
      ;; update clear predicates
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (clear ?b) (on ?b ?from))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Consonant agent actions (may move only consonant-labeled blocks)
  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (clear ?b) (clear ?to) (on ?b ?from))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (clear ?b) (on ?b ?from))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )
)