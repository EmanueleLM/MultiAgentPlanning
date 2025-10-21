(define (domain blocks_world_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel consonant - block)
  (:predicates
    (on ?b - block ?under - block)    ; ?b is directly on ?under
    (ontable ?b - block)              ; ?b is on the table (stack bottom)
    (clear ?b - block)                ; nothing on top of ?b (it is a top block)
  )

  ; ===== Vowel-agent actions (can move only vowels A,E,I) =====

  ;; Move a vowel block from the table onto another clear block
  (:action vowel-move-from-table-to-block
    :parameters (?b - vowel ?dest - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?dest)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (not (clear ?dest))
      ; ?b remains clear (it becomes the top block)
    )
  )

  ;; Move a vowel block from one block onto another clear block
  (:action vowel-move-from-block-to-block
    :parameters (?b - vowel ?from - block ?dest - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?dest)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?dest)
      (clear ?from)
      (not (clear ?dest))
    )
  )

  ;; Move a vowel block from on top of a block to the table
  (:action vowel-move-from-block-to-table
    :parameters (?b - vowel ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ; ===== Consonant-agent actions (can move only consonants B,C,D,F,G,H,J,K) =====

  ;; Move a consonant block from the table onto another clear block
  (:action consonant-move-from-table-to-block
    :parameters (?b - consonant ?dest - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?dest)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (not (clear ?dest))
    )
  )

  ;; Move a consonant block from one block onto another clear block
  (:action consonant-move-from-block-to-block
    :parameters (?b - consonant ?from - block ?dest - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?dest)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?dest)
      (clear ?from)
      (not (clear ?dest))
    )
  )

  ;; Move a consonant block from on top of a block to the table
  (:action consonant-move-from-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and
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