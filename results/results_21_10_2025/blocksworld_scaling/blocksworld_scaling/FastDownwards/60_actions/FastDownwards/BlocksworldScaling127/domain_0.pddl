(define (domain blocks-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent vowel-agent consonant-agent block position)

  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    (on ?b - block ?under - block)
    (ontable ?b - block ?p - position)
    (top ?b - block)
  )

  ;; Vowel-agent actions (atomic pick-and-place variants)

  ;; Move a vowel from on-top-of-block to on-top-of-block
  (:action vowel-move-block-to-block
    :parameters (?a - vowel-agent ?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (top ?b)
      (top ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (top ?to))
      (top ?b)
      (top ?from)
    )
  )

  ;; Move a vowel from table-position to on-top-of-block
  (:action vowel-move-pos-to-block
    :parameters (?a - vowel-agent ?b - block ?p - position ?to - block)
    :precondition (and
      (vowel ?b)
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

  ;; Move a vowel from on-top-of-block to a table-position
  (:action vowel-move-block-to-pos
    :parameters (?a - vowel-agent ?b - block ?from - block ?p - position)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (top ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b ?p)
      (top ?b)
      (top ?from)
    )
  )

  ;; Move a vowel from one table position to another table position
  (:action vowel-move-pos-to-pos
    :parameters (?a - vowel-agent ?b - block ?p1 - position ?p2 - position)
    :precondition (and
      (vowel ?b)
      (ontable ?b ?p1)
      (top ?b)
    )
    :effect (and
      (not (ontable ?b ?p1))
      (ontable ?b ?p2)
      (top ?b)
    )
  )

  ;; Consonant-agent actions (atomic pick-and-place variants)

  ;; Move a consonant from on-top-of-block to on-top-of-block
  (:action consonant-move-block-to-block
    :parameters (?a - consonant-agent ?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (top ?b)
      (top ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (top ?to))
      (top ?b)
      (top ?from)
    )
  )

  ;; Move a consonant from table-position to on-top-of-block
  (:action consonant-move-pos-to-block
    :parameters (?a - consonant-agent ?b - block ?p - position ?to - block)
    :precondition (and
      (consonant ?b)
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

  ;; Move a consonant from on-top-of-block to a table-position
  (:action consonant-move-block-to-pos
    :parameters (?a - consonant-agent ?b - block ?from - block ?p - position)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (top ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b ?p)
      (top ?b)
      (top ?from)
    )
  )

  ;; Move a consonant from one table position to another table position
  (:action consonant-move-pos-to-pos
    :parameters (?a - consonant-agent ?b - block ?p1 - position ?p2 - position)
    :precondition (and
      (consonant ?b)
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