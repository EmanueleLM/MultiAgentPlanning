(define (domain blocksworld_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is immediately on ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing on top of ?x
  )

  ;; Vowel-agent actions (may move only vowels: A E I)
  (:action agentV-move-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action agentV-move-table-to-block
    :parameters (?b - vowel ?to - block)
    :precondition (and
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

  (:action agentV-move-block-to-table
    :parameters (?b - vowel ?from - block)
    :precondition (and
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

  ;; Consonant-agent actions (may move only consonants: B C D F G H J K)
  (:action agentC-move-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action agentC-move-table-to-block
    :parameters (?b - consonant ?to - block)
    :precondition (and
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

  (:action agentC-move-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and
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