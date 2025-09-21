(define (domain multiagent-blocks)
  (:requirements :typing :strips)
  (:types block - object
          vowel consonant - block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (free ?x - block)
    (holding-v ?x - vowel)
    (handempty-v)
    (holding-c ?x - consonant)
    (handempty-c)
  )

  (:action vowel-pickup
    :parameters (?b - vowel)
    :precondition (and (ontable ?b) (clear ?b) (handempty-v) (free ?b))
    :effect (and
              (holding-v ?b)
              (not (ontable ?b))
              (not (handempty-v))
              (not (free ?b))
             )
  )

  (:action vowel-unstack
    :parameters (?b - vowel ?s - block)
    :precondition (and (on ?b ?s) (clear ?b) (handempty-v))
    :effect (and
              (holding-v ?b)
              (clear ?s)
              (not (on ?b ?s))
              (not (handempty-v))
              (not (free ?b))
             )
  )

  (:action vowel-putdown
    :parameters (?b - vowel)
    :precondition (and (holding-v ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (not (holding-v ?b))
              (handempty-v)
              (free ?b)
             )
  )

  (:action vowel-stack
    :parameters (?b - vowel ?s - block)
    :precondition (and (holding-v ?b) (clear ?s) (free ?s))
    :effect (and
              (on ?b ?s)
              (not (clear ?s))
              (clear ?b)
              (not (holding-v ?b))
              (handempty-v)
              (free ?b)
             )
  )

  (:action consonant-pickup
    :parameters (?x - consonant)
    :precondition (and (ontable ?x) (clear ?x) (handempty-c) (free ?x))
    :effect (and
              (holding-c ?x)
              (not (ontable ?x))
              (not (handempty-c))
              (not (free ?x))
            )
  )

  (:action consonant-unstack
    :parameters (?x - consonant ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-c))
    :effect (and
              (holding-c ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (handempty-c))
              (not (free ?x))
            )
  )

  (:action consonant-putdown
    :parameters (?x - consonant)
    :precondition (and (holding-c ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (not (holding-c ?x))
              (handempty-c)
              (free ?x)
            )
  )

  (:action consonant-stack
    :parameters (?x - consonant ?y - block)
    :precondition (and (holding-c ?x) (clear ?y) (free ?y))
    :effect (and
              (on ?x ?y)
              (not (clear ?y))
              (clear ?x)
              (not (holding-c ?x))
              (handempty-c)
              (free ?x)
            )
  )
)