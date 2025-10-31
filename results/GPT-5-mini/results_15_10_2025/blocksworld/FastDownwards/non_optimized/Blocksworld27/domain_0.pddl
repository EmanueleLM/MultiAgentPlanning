(define (domain multi_agent_vowel_consonant_blocks)
  (:requirements :strips :equality)
  (:predicates
    (on ?x ?y)
    (ontable ?x)
    (clear ?x)
    (vowel ?x)
    (consonant ?x)
  )

  ;; ----- Vowel-agent actions (agent 1) -----
  ;; Vowel-agent can move only vowel-labeled blocks (A, E, I)
  (:action move-vowel-block-to-block
    :parameters (?b ?from ?to)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (on ?b ?to)
      (not (on ?b ?from))
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?b ?to)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (on ?b ?to)
      (not (ontable ?b))
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?b ?from)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (ontable ?b)
      (not (on ?b ?from))
      (clear ?from)
      (clear ?b)
    )
  )

  ;; ----- Consonant-agent actions (agent 1) -----
  ;; From first agent's specification (kept distinct names)
  (:action move-consonant-block-to-block
    :parameters (?b ?from ?to)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (on ?b ?to)
      (not (on ?b ?from))
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-consonant-table-to-block
    :parameters (?b ?to)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (on ?b ?to)
      (not (ontable ?b))
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?b ?from)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (ontable ?b)
      (not (on ?b ?from))
      (clear ?from)
      (clear ?b)
    )
  )

  ;; ----- Consonant-agent actions (agent 2) -----
  ;; From second agent's specification (kept distinct names)
  (:action move-from-block-to-block
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
    )
  )

  (:action move-from-table-to-block
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

  (:action move-from-block-to-table
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