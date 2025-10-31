(define (domain blocksworld_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table)

  (:predicates
    (on ?x - block ?y - block)     ; ?x is on ?y (a block)
    (ontable ?x - block)           ; ?x is on the table
    (clear ?x - block)             ; nothing on top of ?x and ?x is not being held
    (handempty)                    ; the (single) hand is empty
    (holding ?x - block)           ; the hand is holding ?x
    (vowel ?x - block)             ; block label is a vowel (moved only by vowel agent)
    (consonant ?x - block)         ; block label is a consonant (moved only by consonant agent)
  )

  ;; ----------------------------
  ;; Vowel-agent actions (A, E, I)
  ;; ----------------------------

  ;; Unstack a vowel block from on top of another block (hand must be empty, block must be clear)
  (:action vowel-unstack
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?from))
      (holding ?b)
      (not (handempty))
      (clear ?from)
      (not (clear ?b))
    )
  )

  ;; Pick up a vowel block from the table
  (:action vowel-pick-up
    :parameters (?b - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?b)
      (not (handempty))
      (not (clear ?b))
    )
  )

  ;; Put down a vowel block onto the table
  (:action vowel-put-down
    :parameters (?b - block)
    :precondition (and
      (vowel ?b)
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (handempty)
      (clear ?b)
    )
  )

  ;; Stack a vowel block on top of another block
  (:action vowel-stack
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (holding ?b)
      (clear ?to)
    )
    :effect (and
      (not (holding ?b))
      (on ?b ?to)
      (handempty)
      (clear ?b)
      (not (clear ?to))
    )
  )

  ;; --------------------------------
  ;; Consonant-agent actions (B..N)
  ;; --------------------------------

  ;; Unstack a consonant block from on top of another block
  (:action consonant-unstack
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?from))
      (holding ?b)
      (not (handempty))
      (clear ?from)
      (not (clear ?b))
    )
  )

  ;; Pick up a consonant block from the table
  (:action consonant-pick-up
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?b)
      (not (handempty))
      (not (clear ?b))
    )
  )

  ;; Put down a consonant block onto the table
  (:action consonant-put-down
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (handempty)
      (clear ?b)
    )
  )

  ;; Stack a consonant block on top of another block
  (:action consonant-stack
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (holding ?b)
      (clear ?to)
    )
    :effect (and
      (not (holding ?b))
      (on ?b ?to)
      (handempty)
      (clear ?b)
      (not (clear ?to))
    )
  )
)