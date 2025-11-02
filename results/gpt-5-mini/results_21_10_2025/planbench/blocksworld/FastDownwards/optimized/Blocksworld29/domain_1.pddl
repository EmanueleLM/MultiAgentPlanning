(define (domain Blocksworld29)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?x - block)      ; ?b is on top of ?x
    (ontable ?b - block)            ; ?b is on the table
    (clear ?b - block)              ; nothing on top of ?b AND not being held
    (holding ?b - block)            ; the agent is holding ?b
    (handempty)                     ; the agent's hand is empty
    (vowel ?b - block)              ; ?b may be moved by the vowel agent
    (consonant ?b - block)          ; ?b may be moved by the consonant agent
  )

  ;; Vowel-agent actions (operate only on blocks marked (vowel ?b))
  (:action vowel-unstack
    :parameters (?b - block ?x - block)
    :precondition (and (vowel ?b) (on ?b ?x) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?x))
      (clear ?x)
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action vowel-pickup
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action vowel-stack
    :parameters (?b - block ?x - block)
    :precondition (and (vowel ?b) (holding ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (not (holding ?b))
      (clear ?b)
      (not (clear ?x))
      (handempty)
    )
  )

  (:action vowel-putdown
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding ?b))
    :effect (and
      (ontable ?b)
      (not (holding ?b))
      (handempty)
      (clear ?b)
    )
  )

  ;; Consonant-agent actions (operate only on blocks marked (consonant ?b))
  (:action consonant-unstack
    :parameters (?b - block ?x - block)
    :precondition (and (consonant ?b) (on ?b ?x) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?x))
      (clear ?x)
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action consonant-pickup
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action consonant-stack
    :parameters (?b - block ?x - block)
    :precondition (and (consonant ?b) (holding ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (not (holding ?b))
      (clear ?b)
      (not (clear ?x))
      (handempty)
    )
  )

  (:action consonant-putdown
    :parameters (?b - block)
    :precondition (and (consonant ?b) (holding ?b))
    :effect (and
      (ontable ?b)
      (not (holding ?b))
      (handempty)
      (clear ?b)
    )
  )
)