(define (domain multi_agent_blocks)
  (:requirements :strips :equality)
  (:predicates
    (on ?x ?y)      ; block ?x is on block ?y
    (ontable ?x)    ; block ?x is on the table
    (clear ?x)      ; block ?x has nothing on it (top)
    (vowel ?x)      ; manipulable by vowel agent
    (consonant ?x)  ; manipulable by consonant agent
  )

  ;; Vowel-agent actions (kept distinct from consonant actions)
  (:action vowel-move-block-to-block
    :parameters (?b ?from ?to)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
      (not (ontable ?b))
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?b ?to)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?b ?from)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Consonant-agent actions (kept distinct and preserving consonant manipulation constraint)
  (:action cons-move-from-block-to-block
    :parameters (?b ?from ?to)
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
      (clear ?b)
      (not (ontable ?b))
    )
  )

  (:action cons-move-from-table-to-block
    :parameters (?b ?to)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action cons-move-from-block-to-table
    :parameters (?b ?from)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )
)