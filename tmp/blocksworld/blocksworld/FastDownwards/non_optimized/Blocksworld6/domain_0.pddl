(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types block vowel consonant - block)
  (:predicates
    (on ?x - block ?y - block)     ; ?x is on ?y
    (ontable ?x - block)           ; ?x is on the table
    (clear ?x - block)             ; nothing on top of ?x
    (holding-v ?x - vowel)         ; vowel-agent is holding ?x
    (handempty-v)                  ; vowel-agent's hand is empty
    (holding-c ?x - consonant)     ; consonant-agent is holding ?x
    (handempty-c)                  ; consonant-agent's hand is empty
  )

  ;; Vowel agent actions (prefixed with vowel-)
  (:action vowel-pickup
    :parameters (?b - vowel)
    :precondition (and (ontable ?b) (clear ?b) (handempty-v))
    :effect (and
              (holding-v ?b)
              (not (ontable ?b))
              (not (handempty-v))
              (clear ?b)
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
              (clear ?b)
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
              (clear ?b)
              (not (clear ?s))
              (not (holding-v ?b))
              (handempty-v)
             )
  )

  ;; Consonant agent actions (prefixed with consonant-)
  (:action consonant-pick-up
    :parameters (?x - consonant)
    :precondition (and (ontable ?x) (clear ?x) (handempty-c))
    :effect (and
              (holding-c ?x)
              (not (ontable ?x))
              (not (handempty-c))
              (clear ?x)
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
              (clear ?x)
            )
  )

  (:action consonant-put-down
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