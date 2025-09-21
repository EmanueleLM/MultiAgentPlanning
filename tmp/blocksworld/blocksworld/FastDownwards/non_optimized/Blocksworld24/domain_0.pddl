(define (domain multi_agent_blocks)
  (:requirements :strips)
  (:predicates
    (on ?x ?y)
    (ontable ?x)
    (clear ?x)
    (vowel ?x)
    (consonant ?x)
    ;; Separate hands/holding for the two agents to preserve agent-specific constraints
    (holding-vowel ?x)
    (handempty-vowel)
    (holding-consonant ?x)
    (handempty-consonant)
  )

  ;; Vowel-agent actions (can only manipulate blocks marked (vowel ?x))
  (:action vowel-unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-vowel) (vowel ?x))
    :effect (and
      (holding-vowel ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty-vowel))
    )
  )

  (:action vowel-stack
    :parameters (?x ?y)
    :precondition (and (holding-vowel ?x) (clear ?y) (vowel ?x))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding-vowel ?x))
      (handempty-vowel)
    )
  )

  (:action vowel-pickup
    :parameters (?x)
    :precondition (and (ontable ?x) (clear ?x) (handempty-vowel) (vowel ?x))
    :effect (and
      (holding-vowel ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-vowel))
    )
  )

  (:action vowel-putdown
    :parameters (?x)
    :precondition (and (holding-vowel ?x) (vowel ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding-vowel ?x))
      (handempty-vowel)
    )
  )

  ;; Consonant-agent actions (can only manipulate blocks marked (consonant ?x))
  (:action consonant-pickup
    :parameters (?x)
    :precondition (and (consonant ?x) (clear ?x) (ontable ?x) (handempty-consonant))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-consonant))
      (holding-consonant ?x)
    )
  )

  (:action consonant-unstack
    :parameters (?x ?y)
    :precondition (and (consonant ?x) (clear ?x) (on ?x ?y) (handempty-consonant))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty-consonant))
      (holding-consonant ?x)
      (clear ?y)
    )
  )

  (:action consonant-putdown
    :parameters (?x)
    :precondition (and (consonant ?x) (holding-consonant ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-consonant)
      (not (holding-consonant ?x))
    )
  )

  (:action consonant-stack
    :parameters (?x ?y)
    :precondition (and (consonant ?x) (holding-consonant ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty-consonant)
      (not (clear ?y))
      (not (holding-consonant ?x))
    )
  )
)