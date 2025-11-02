(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent vowel-agent consonant-agent block position)

  (:predicates
    ;; typing of blocks (vowel/consonant)
    (is-vowel ?b - block)
    (is-consonant ?b - block)

    ;; stacking relations
    (on ?b - block ?under - block)      ;; ?b is directly on ?under
    (ontable ?b - block ?p - position) ;; ?b is directly on table at position ?p

    ;; which blocks are currently top of their stack
    (top ?b - block)

    ;; which agent is available (not used for concurrency here, but keeps actions distinct)
    (available ?a - agent)
  )

  ;; Helper: ensure only top blocks can be moved and only allowed agent types move their class.

  ;; Vowel-agent: move a vowel block from on another block to on another block
  (:action vowel-move-block-to-block
    :parameters (?ag - vowel-agent ?b - block ?from - block ?to - block)
    :precondition (and
      (available ?ag)
      (is-vowel ?b)
      (on ?b ?from)
      (top ?b)
      (top ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      ;; update tops: new top is ?b, previous top ?to no longer top, and ?from becomes top if exists
      (not (top ?to))
      (top ?b)
      (when (top ?from) (top ?from))
      (not (top ?from)) ; ensure ?from is not asserted as top by leftover facts (maintain consistency)
    )
  )

  ;; Vowel-agent: move vowel from on block to table position
  (:action vowel-move-block-to-pos
    :parameters (?ag - vowel-agent ?b - block ?from - block ?p - position)
    :precondition (and
      (available ?ag)
      (is-vowel ?b)
      (on ?b ?from)
      (top ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b ?p)
      (top ?b)
      (not (top ?from))
    )
  )

  ;; Vowel-agent: move vowel from table position to on a block
  (:action vowel-move-pos-to-block
    :parameters (?ag - vowel-agent ?b - block ?p - position ?to - block)
    :precondition (and
      (available ?ag)
      (is-vowel ?b)
      (ontable ?b ?p)
      (top ?b)
      (top ?to)
    )
    :effect (and
      (not (ontable ?b ?p))
      (on ?b ?to)
      (not (top ?to))
      (top ?b)
    )
  )

  ;; Vowel-agent: move vowel from one table position to another table position
  (:action vowel-move-pos-to-pos
    :parameters (?ag - vowel-agent ?b - block ?p1 - position ?p2 - position)
    :precondition (and
      (available ?ag)
      (is-vowel ?b)
      (ontable ?b ?p1)
      (top ?b)
    )
    :effect (and
      (not (ontable ?b ?p1))
      (ontable ?b ?p2)
      (top ?b)
    )
  )

  ;; Consonant-agent: move consonant from block to block
  (:action consonant-move-block-to-block
    :parameters (?ag - consonant-agent ?b - block ?from - block ?to - block)
    :precondition (and
      (available ?ag)
      (is-consonant ?b)
      (on ?b ?from)
      (top ?b)
      (top ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (top ?to))
      (top ?b)
      (not (top ?from))
    )
  )

  ;; Consonant: from block to table
  (:action consonant-move-block-to-pos
    :parameters (?ag - consonant-agent ?b - block ?from - block ?p - position)
    :precondition (and
      (available ?ag)
      (is-consonant ?b)
      (on ?b ?from)
      (top ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b ?p)
      (top ?b)
      (not (top ?from))
    )
  )

  ;; Consonant: from table to block
  (:action consonant-move-pos-to-block
    :parameters (?ag - consonant-agent ?b - block ?p - position ?to - block)
    :precondition (and
      (available ?ag)
      (is-consonant ?b)
      (ontable ?b ?p)
      (top ?b)
      (top ?to)
    )
    :effect (and
      (not (ontable ?b ?p))
      (on ?b ?to)
      (not (top ?to))
      (top ?b)
    )
  )

  ;; Consonant: table to table
  (:action consonant-move-pos-to-pos
    :parameters (?ag - consonant-agent ?b - block ?p1 - position ?p2 - position)
    :precondition (and
      (available ?ag)
      (is-consonant ?b)
      (ontable ?b ?p1)
      (top ?b)
    )
    :effect (and
      (not (ontable ?b ?p1))
      (ontable ?b ?p2)
      (top ?b)
    )
  )
)