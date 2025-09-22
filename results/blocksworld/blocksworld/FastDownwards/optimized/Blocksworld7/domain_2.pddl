(define (domain combined-vowel-consonant)
  (:requirements :strips :typing :equality)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (holding-v ?x - block)
    (handempty-v)
    (holding-c ?x - block)
    (handempty-c)
  )

  (:action pickup-vowel-from-table
    :parameters (?x - block)
    :precondition (and (vowel ?x) (ontable ?x) (clear ?x) (handempty-v))
    :effect (and (holding-v ?x) (not (ontable ?x)) (not (handempty-v)))
  )

  (:action unstack-vowel
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (on ?x ?y) (clear ?x) (handempty-v))
    :effect (and (holding-v ?x) (not (on ?x ?y)) (clear ?y) (not (handempty-v)))
  )

  (:action putdown-vowel
    :parameters (?x - block)
    :precondition (and (vowel ?x) (holding-v ?x))
    :effect (and (ontable ?x) (clear ?x) (not (holding-v ?x)) (handempty-v))
  )

  (:action stack-vowel
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (holding-v ?x) (clear ?y) (not (= ?x ?y)))
    :effect (and (on ?x ?y) (clear ?x) (not (clear ?y)) (not (holding-v ?x)) (handempty-v))
  )

  (:action pickup-consonant-from-table
    :parameters (?x - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?x) (handempty-c))
    :effect (and (holding-c ?x) (not (ontable ?x)) (not (handempty-c)))
  )

  (:action unstack-consonant
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?y) (clear ?x) (handempty-c))
    :effect (and (holding-c ?x) (not (on ?x ?y)) (clear ?y) (not (handempty-c)))
  )

  (:action putdown-consonant
    :parameters (?x - block)
    :precondition (and (consonant ?x) (holding-c ?x))
    :effect (and (ontable ?x) (clear ?x) (not (holding-c ?x)) (handempty-c))
  )

  (:action stack-consonant
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (holding-c ?x) (clear ?y) (not (= ?x ?y)))
    :effect (and (on ?x ?y) (clear ?x) (not (clear ?y)) (not (holding-c ?x)) (handempty-c))
  )
)