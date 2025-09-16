```pddl
(define (domain integrated-two-agent-blocks-world)
  (:requirements :strips :typing)

  (:types
    block agent - object
    vowel-block consonant-block - block
    vowel-agent consonant-agent - agent
  )

  (:predicates
    (on ?b1 - block ?b2 - block)
    (ontable ?b - block)
    (clear ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
  )

  ;; --- Actions for the Vowel Agent ---
  ;; The vowel_agent can only manipulate vowel-blocks (A, O)

  (:action pick-up-vowel-from-table
    :parameters (?a - vowel-agent ?b - vowel-block)
    :precondition (and (handempty ?a) (ontable ?b) (clear ?b))
    :effect (and 
              (not (handempty ?a))
              (not (ontable ?b))
              (not (clear ?b))
              (holding ?a ?b)
            )
  )

  (:action put-down-vowel-on-table
    :parameters (?a - vowel-agent ?b - vowel-block)
    :precondition (holding ?a ?b)
    :effect (and
              (handempty ?a)
              (ontable ?b)
              (clear ?b)
              (not (holding ?a ?b))
            )
  )

  (:action stack-vowel-on-any-block
    :parameters (?a - vowel-agent ?b1-to-stack - vowel-block ?b2-on-top-of - block)
    :precondition (and (holding ?a ?b1-to-stack) (clear ?b2-on-top-of))
    :effect (and
              (handempty ?a)
              (not (holding ?a ?b1-to-stack))
              (on ?b1-to-stack ?b2-on-top-of)
              (clear ?b1-to-stack)
              (not (clear ?b2-on-top-of))
            )
  )
  
  (:action unstack-vowel-from-any-block
    :parameters (?a - vowel-agent ?b1-to-unstack - vowel-block ?b2-underneath - block)
    :precondition (and (handempty ?a) (on ?b1-to-unstack ?b2-underneath) (clear ?b1-to-unstack))
    :effect (and
              (not (handempty ?a))
              (holding ?a ?b1-to-unstack)
              (not (on ?b1-to-unstack ?b2-underneath))
              (not (clear ?b1-to-unstack))
              (clear ?b2-underneath)
            )
  )
  
  ;; --- Actions for the Consonant Agent ---
  ;; The consonant_agent can only manipulate consonant-blocks (B, C)

  (:action pick-up-consonant-from-table
    :parameters (?a - consonant-agent ?b - consonant-block)
    :precondition (and (handempty ?a) (ontable ?b) (clear ?b))
    :effect (and 
              (not (handempty ?a))
              (not (ontable ?b))
              (not (clear ?b))
              (holding ?a ?b)
            )
  )

  (:action put-down-consonant-on-table
    :parameters (?a - consonant-agent ?b - consonant-block)
    :precondition (holding ?a ?b)
    :effect (and
              (handempty ?a)
              (ontable ?b)
              (clear ?b)
              (not (holding ?a ?b))
            )
  )

  (:action stack-consonant-on-any-block
    :parameters (?a - consonant-agent ?b1-to-stack - consonant-block ?b2-on-top-of - block)
    :precondition (and (holding ?a ?b1-to-stack) (clear ?b2-on-top-of))
    :effect (and
              (handempty ?a)
              (not (holding ?a ?b1-to-stack))
              (on ?b1-to-stack ?b2-on-top-of)
              (clear ?b1-to-stack)
              (not (clear ?b2-on-top-of))
            )
  )
  
  (:action unstack-consonant-from-any-block
    :parameters (?a - consonant-agent ?b1-to-unstack - consonant-block ?b2-underneath - block)
    :precondition (and (handempty ?a) (on ?b1-to-unstack ?b2-underneath) (clear ?b1-to-unstack))
    :effect (and
              (not (handempty ?a))
              (holding ?a ?b1-to-unstack)
              (not (on ?b1-to-unstack ?b2-underneath))
              (not (clear ?b1-to-unstack))
              (clear ?b2-underneath)
            )
  )
)
```