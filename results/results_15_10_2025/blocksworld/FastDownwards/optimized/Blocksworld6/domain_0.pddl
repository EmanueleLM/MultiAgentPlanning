(define (domain multiagent_blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block place vowel cons - block)

  (:predicates
    (on ?x - block ?y - (either block place))
    (clear ?x - block)
    (handfree-vowel)
    (handfree-cons)
    (holding-v ?x - block)
    (holding-c ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Vowel-agent picks a vowel block from the table
  (:action vowel_pick_from_table
    :parameters (?b - vowel)
    :precondition (and
      (handfree-vowel)
      (on ?b table)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (not (on ?b table))
      (not (clear ?b))
      (holding-v ?b)
      (not (handfree-vowel))
    )
  )

  ;; Vowel-agent picks a vowel block from on top of another block
  (:action vowel_pick_from_block
    :parameters (?b - vowel ?under - block)
    :precondition (and
      (handfree-vowel)
      (on ?b ?under)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (not (clear ?b))
      (clear ?under)
      (holding-v ?b)
      (not (handfree-vowel))
    )
  )

  ;; Vowel-agent places a held vowel block onto the table
  (:action vowel_put_on_table
    :parameters (?b - vowel)
    :precondition (and
      (holding-v ?b)
      (vowel ?b)
    )
    :effect (and
      (on ?b table)
      (clear ?b)
      (not (holding-v ?b))
      (handfree-vowel)
    )
  )

  ;; Vowel-agent stacks a held vowel block onto another block
  (:action vowel_put_on_block
    :parameters (?b - vowel ?target - block)
    :precondition (and
      (holding-v ?b)
      (clear ?target)
      (vowel ?b)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding-v ?b))
      (handfree-vowel)
    )
  )

  ;; Consonant-agent picks a consonant block from the table
  (:action cons_pick_from_table
    :parameters (?b - cons)
    :precondition (and
      (handfree-cons)
      (on ?b table)
      (clear ?b)
      (consonant ?b)
    )
    :effect (and
      (not (on ?b table))
      (not (clear ?b))
      (holding-c ?b)
      (not (handfree-cons))
    )
  )

  ;; Consonant-agent picks a consonant block from on top of another block
  (:action cons_pick_from_block
    :parameters (?b - cons ?under - block)
    :precondition (and
      (handfree-cons)
      (on ?b ?under)
      (clear ?b)
      (consonant ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (not (clear ?b))
      (clear ?under)
      (holding-c ?b)
      (not (handfree-cons))
    )
  )

  ;; Consonant-agent places a held consonant block onto the table
  (:action cons_put_on_table
    :parameters (?b - cons)
    :precondition (and
      (holding-c ?b)
      (consonant ?b)
    )
    :effect (and
      (on ?b table)
      (clear ?b)
      (not (holding-c ?b))
      (handfree-cons)
    )
  )

  ;; Consonant-agent stacks a held consonant block onto another block
  (:action cons_put_on_block
    :parameters (?b - cons ?target - block)
    :precondition (and
      (holding-c ?b)
      (clear ?target)
      (consonant ?b)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding-c ?b))
      (handfree-cons)
    )
  )
)