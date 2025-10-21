(define (domain blocks_multi_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)     ; ?x is on top of ?y
    (ontable ?x - block)           ; ?x is on the table
    (clear ?x - block)             ; nothing is on ?x AND it is not being held
    (holding ?x - block)           ; ?x is being held by the agent (hand not empty)
    (handempty)                    ; the agent's hand is empty
    (vowel ?x - block)             ; mark block as manipulable by vowel-agent
    (consonant ?x - block)         ; mark block as manipulable by consonant-agent
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Vowel-agent actions (only blocks with vowel predicate)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Unstack a vowel block from on top of another block (holding it)
  (:action vowel-unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (not (on ?x ?y))
      (holding ?x)
      (not (handempty))
      (clear ?y)
      (not (clear ?x))
    )
  )

  ;; Pick up a vowel block from the table (holding it)
  (:action vowel-pickup
    :parameters (?x - block)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (not (ontable ?x))
      (holding ?x)
      (not (handempty))
      (not (clear ?x))
    )
  )

  ;; Put down a vowel block currently held (onto the table)
  (:action vowel-putdown
    :parameters (?x - block)
    :precondition (and
      (vowel ?x)
      (holding ?x)
    )
    :effect (and
      (ontable ?x)
      (handempty)
      (not (holding ?x))
      (clear ?x)
    )
  )

  ;; Stack a vowel block currently held onto another block
  (:action vowel-stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (vowel ?x)
      (holding ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (clear ?x)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Consonant-agent actions (only blocks with consonant predicate)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Unstack a consonant block from on top of another block (holding it)
  (:action consonant-unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (not (on ?x ?y))
      (holding ?x)
      (not (handempty))
      (clear ?y)
      (not (clear ?x))
    )
  )

  ;; Pick up a consonant block from the table (holding it)
  (:action consonant-pickup
    :parameters (?x - block)
    :precondition (and
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (not (ontable ?x))
      (holding ?x)
      (not (handempty))
      (not (clear ?x))
    )
  )

  ;; Put down a consonant block currently held (onto the table)
  (:action consonant-putdown
    :parameters (?x - block)
    :precondition (and
      (consonant ?x)
      (holding ?x)
    )
    :effect (and
      (ontable ?x)
      (handempty)
      (not (holding ?x))
      (clear ?x)
    )
  )

  ;; Stack a consonant block currently held onto another block
  (:action consonant-stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (consonant ?x)
      (holding ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (clear ?x)
    )
  )
)