(define (domain blocksworld-agents)
  (:requirements :strips :typing)
  (:types block vowel consonant)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty)
    (holding ?x - block)
  )

  ;; Vowel-agent pick actions
  (:action pick-vowel-from-block
    :parameters (?x - vowel ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
              (clear ?y)
            )
  )

  (:action pick-vowel-from-table
    :parameters (?x - vowel)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
            )
  )

  (:action place-vowel-onto-block
    :parameters (?x - vowel ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (clear ?y))
              (not (holding ?x))
              (handempty)
            )
  )

  (:action place-vowel-onto-table
    :parameters (?x - vowel)
    :precondition (and (holding ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (not (holding ?x))
              (handempty)
            )
  )

  ;; Consonant-agent pick actions
  (:action pick-consonant-from-block
    :parameters (?x - consonant ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
              (clear ?y)
            )
  )

  (:action pick-consonant-from-table
    :parameters (?x - consonant)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
            )
  )

  (:action place-consonant-onto-block
    :parameters (?x - consonant ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (clear ?y))
              (not (holding ?x))
              (handempty)
            )
  )

  (:action place-consonant-onto-table
    :parameters (?x - consonant)
    :precondition (and (holding ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (not (holding ?x))
              (handempty)
            )
  )
)