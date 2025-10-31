(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)     ; ?x is on ?y
    (ontable ?x - block)           ; ?x is on the table
    (clear ?x - block)             ; nothing on ?x and not picked up
    (handempty)                    ; hand is empty
    (holding ?x - block)           ; holding ?x
    (vowel ?x - block)             ; block is vowel (moved only by vowel agent)
    (consonant ?x - block)         ; block is consonant (moved only by consonant agent)
  )

  ;; Vowel-agent actions
  (:action vowel-agent-pickup-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (handempty))
      (holding ?b)
      (not (clear ?b))
    )
  )

  (:action vowel-agent-unstack
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (on ?b ?under) (clear ?b) (handempty))
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (handempty))
      (holding ?b)
      (not (clear ?b))
    )
  )

  (:action vowel-agent-putdown
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  (:action vowel-agent-stack
    :parameters (?b - block ?t - block)
    :precondition (and (vowel ?b) (holding ?b) (clear ?t))
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (clear ?t))
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Consonant-agent actions
  (:action consonant-agent-pickup-from-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (handempty))
      (holding ?b)
      (not (clear ?b))
    )
  )

  (:action consonant-agent-unstack
    :parameters (?b - block ?under - block)
    :precondition (and (consonant ?b) (on ?b ?under) (clear ?b) (handempty))
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (handempty))
      (holding ?b)
      (not (clear ?b))
    )
  )

  (:action consonant-agent-putdown
    :parameters (?b - block)
    :precondition (and (consonant ?b) (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  (:action consonant-agent-stack
    :parameters (?b - block ?t - block)
    :precondition (and (consonant ?b) (holding ?b) (clear ?t))
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (clear ?t))
      (handempty)
      (not (holding ?b))
    )
  )
)