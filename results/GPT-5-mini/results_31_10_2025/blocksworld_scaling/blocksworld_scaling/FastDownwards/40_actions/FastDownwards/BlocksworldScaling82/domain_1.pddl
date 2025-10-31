(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (ontable ?b - block)
    (on ?b - block ?x - block)        ; ?b is on ?x
    (clear ?b - block)                ; nothing on ?b
    (holding_vowel ?b - block)
    (holding_consonant ?b - block)
    (handempty_vowel)
    (handempty_consonant)
    (is_vowel ?b - block)
    (is_consonant ?b - block)
  )

  ;; Vowel-agent actions (can move only vowels: A, E, I)
  (:action vowel_pickup
    :parameters (?b - block)
    :precondition (and (is_vowel ?b) (ontable ?b) (clear ?b) (handempty_vowel))
    :effect (and
      (holding_vowel ?b)
      (not (ontable ?b))
      (not (handempty_vowel))
      (not (clear ?b))
    )
  )

  (:action vowel_unstack
    :parameters (?b - block ?x - block)
    :precondition (and (is_vowel ?b) (on ?b ?x) (clear ?b) (handempty_vowel))
    :effect (and
      (holding_vowel ?b)
      (clear ?x)
      (not (on ?b ?x))
      (not (handempty_vowel))
      (not (clear ?b))
    )
  )

  (:action vowel_putdown
    :parameters (?b - block)
    :precondition (and (is_vowel ?b) (holding_vowel ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty_vowel)
      (not (holding_vowel ?b))
    )
  )

  (:action vowel_stack
    :parameters (?b - block ?x - block)
    :precondition (and (is_vowel ?b) (holding_vowel ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (handempty_vowel)
      (not (holding_vowel ?b))
      (not (clear ?x))
    )
  )

  ;; Consonant-agent actions (can move only consonants: B, C, D, F, G, H, J)
  (:action consonant_pickup
    :parameters (?b - block)
    :precondition (and (is_consonant ?b) (ontable ?b) (clear ?b) (handempty_consonant))
    :effect (and
      (holding_consonant ?b)
      (not (ontable ?b))
      (not (handempty_consonant))
      (not (clear ?b))
    )
  )

  (:action consonant_unstack
    :parameters (?b - block ?x - block)
    :precondition (and (is_consonant ?b) (on ?b ?x) (clear ?b) (handempty_consonant))
    :effect (and
      (holding_consonant ?b)
      (clear ?x)
      (not (on ?b ?x))
      (not (handempty_consonant))
      (not (clear ?b))
    )
  )

  (:action consonant_putdown
    :parameters (?b - block)
    :precondition (and (is_consonant ?b) (holding_consonant ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty_consonant)
      (not (holding_consonant ?b))
    )
  )

  (:action consonant_stack
    :parameters (?b - block ?x - block)
    :precondition (and (is_consonant ?b) (holding_consonant ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (handempty_consonant)
      (not (holding_consonant ?b))
      (not (clear ?x))
    )
  )
)