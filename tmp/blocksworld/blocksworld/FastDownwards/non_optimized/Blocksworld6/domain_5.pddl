(define (domain multiagent-blocks)
  (:requirements :typing :strips)
  (:types block - object
          vowel consonant - block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding-v ?x - vowel)
    (handempty-v)
    (holding-c ?x - consonant)
    (handempty-c)
  )

  (:action vowel-pickup
    :parameters (?b - vowel)
    :precondition (and (ontable ?b) (clear ?b) (handempty-v))
    :effect (and
              (holding-v ?b)
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty-v))
             )
  )

  (:action vowel-unstack
    :parameters (?b - vowel ?s - block)
    :precondition (and (on ?b ?s) (clear ?b) (handempty-v))
    :effect (and
              (holding-v ?b)
              (clear ?s)
              (not (on ?b ?s))
              (not (clear ?b))
              (not (handempty-v))
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
             )
  )

  (:action vowel-stack
    :parameters (?b - vowel ?s - block)
    :precondition (and (holding-v ?b) (clear ?s))
    :effect (and
              (on ?b ?s)
              (not (clear ?s))
              (clear ?b)
              (not (holding-v ?b))
              (handempty-v)
             )
  )

  (:action consonant-pickup
    :parameters (?x - consonant)
    :precondition (and (ontable ?x) (clear ?x) (handempty-c))
    :effect (and
              (holding-c ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty-c))
            )
  )

  (:action consonant-unstack
    :parameters (?x - consonant ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-c))
    :effect (and
              (holding-c ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty-c))
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
            )
  )

  (:action consonant-stack
    :parameters (?x - consonant ?y - block)
    :precondition (and (holding-c ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (not (clear ?y))
              (clear ?x)
              (not (holding-c ?x))
              (handempty-c)
            )
  )
)