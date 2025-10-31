(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)
  (:predicates
    (on ?x - block ?y - block)       ; ?x is on top of block ?y
    (ontable ?x - block)             ; ?x is on the table (bottom of a stack)
    (clear ?x - block)               ; nothing on top of ?x
  )

  ;; Vowel-agent actions: only vowels (A E I) may be moved by these actions.
  (:action vowel-move-from-block-to-block
    :parameters (?b - vowel ?from - block ?dest - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?dest)
      (clear ?b)
      (not (clear ?dest))
      (clear ?from)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?b - vowel ?dest - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (clear ?b)
      (not (clear ?dest))
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?b - vowel ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?b)
      (clear ?from)
    )
  )

  ;; Consonant-agent actions: only consonants (B C D F G H J K L M N) may be moved.
  (:action consonant-move-from-block-to-block
    :parameters (?b - consonant ?from - block ?dest - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?dest)
      (clear ?b)
      (not (clear ?dest))
      (clear ?from)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?b - consonant ?dest - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (clear ?b)
      (not (clear ?dest))
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?b)
      (clear ?from)
    )
  )
)