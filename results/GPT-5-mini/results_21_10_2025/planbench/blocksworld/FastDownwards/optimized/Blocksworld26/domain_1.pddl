(define (domain blocks_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (handempty_vowel)
    (handempty_cons)
    (holding_vowel ?b - block)
    (holding_cons ?b - block)
  )

  ;; VOWEL agent actions (namespaced with vowel-)
  (:action vowel-pickup
    :parameters (?b - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (handempty_vowel)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty_vowel))
      (holding_vowel ?b)
    )
  )

  (:action vowel-unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?c)
      (clear ?b)
      (handempty_vowel)
    )
    :effect (and
      (not (on ?b ?c))
      (holding_vowel ?b)
      (clear ?c)
      (not (handempty_vowel))
      (not (clear ?b))
    )
  )

  (:action vowel-putdown
    :parameters (?b - block)
    :precondition (and
      (vowel ?b)
      (holding_vowel ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty_vowel)
      (not (holding_vowel ?b))
    )
  )

  (:action vowel-stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (vowel ?b)
      (holding_vowel ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty_vowel)
      (not (holding_vowel ?b))
      (not (clear ?c))
    )
  )

  ;; CONSONANT agent actions (namespaced with cons-)
  (:action cons-pickup
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (handempty_cons)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty_cons))
      (holding_cons ?b)
    )
  )

  (:action cons-unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?c)
      (clear ?b)
      (handempty_cons)
    )
    :effect (and
      (not (on ?b ?c))
      (holding_cons ?b)
      (clear ?c)
      (not (handempty_cons))
      (not (clear ?b))
    )
  )

  (:action cons-putdown
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (holding_cons ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty_cons)
      (not (holding_cons ?b))
    )
  )

  (:action cons-stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (consonant ?b)
      (holding_cons ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty_cons)
      (not (holding_cons ?b))
      (not (clear ?c))
    )
  )
)