(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (holding-vowel ?b - block)
    (holding-cons ?b - block)
    (hand-free-vowel)    ;; true when the vowel agent's hand is free
    (hand-free-cons)     ;; true when the consonant agent's hand is free
  )

  ;; Vowel-agent actions (only manipulate A, E, I)
  (:action vowel-pick-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (hand-free-vowel))
    :effect (and
      (holding-vowel ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (hand-free-vowel))
    )
  )

  (:action vowel-unstack
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (on ?b ?under) (clear ?b) (hand-free-vowel))
    :effect (and
      (holding-vowel ?b)
      (clear ?under)
      (not (on ?b ?under))
      (not (clear ?b))
      (not (hand-free-vowel))
    )
  )

  (:action vowel-put-on-table
    :parameters (?b - block)
    :precondition (and (holding-vowel ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding-vowel ?b))
      (hand-free-vowel)
    )
  )

  (:action vowel-stack-on
    :parameters (?b - block ?target - block)
    :precondition (and (holding-vowel ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding-vowel ?b))
      (hand-free-vowel)
    )
  )

  ;; Consonant-agent actions (only manipulate B C D F G H J K L M N)
  (:action cons-pick-from-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (hand-free-cons))
    :effect (and
      (holding-cons ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (hand-free-cons))
    )
  )

  (:action cons-unstack
    :parameters (?b - block ?under - block)
    :precondition (and (consonant ?b) (on ?b ?under) (clear ?b) (hand-free-cons))
    :effect (and
      (holding-cons ?b)
      (clear ?under)
      (not (on ?b ?under))
      (not (clear ?b))
      (not (hand-free-cons))
    )
  )

  (:action cons-put-on-table
    :parameters (?b - block)
    :precondition (and (holding-cons ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding-cons ?b))
      (hand-free-cons)
    )
  )

  (:action cons-stack-on
    :parameters (?b - block ?target - block)
    :precondition (and (holding-cons ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding-cons ?b))
      (hand-free-cons)
    )
  )
)