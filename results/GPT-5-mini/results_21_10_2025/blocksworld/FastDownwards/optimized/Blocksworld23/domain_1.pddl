(define (domain multi-agent-blocks)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ; Relations for placement
    (on ?b ?s)            ; block ?b is on top of block ?s
    (on-table ?b)         ; block ?b is on the table
    (clear ?b)            ; nothing on top of block ?b AND block is not being held
    ; Hand / holding state per agent
    (handempty ?agent)
    (holding ?agent ?b)
    ; Movement permission: which agent may manipulate which block
    (agent-can-move ?agent ?b)
  )

  ;; -----------------------
  ;; Vowel-agent actions (vowel_agent can move only vowel-labelled blocks)
  ;; -----------------------

  ;; pick up a block from the table (vowel_agent)
  (:action vowel-pickup
    :parameters (?b)
    :precondition (and
      (on-table ?b)
      (clear ?b)
      (handempty vowel_agent)
      (agent-can-move vowel_agent ?b)
    )
    :effect (and
      (not (on-table ?b))
      (not (clear ?b))            ; held blocks are not considered clear
      (not (handempty vowel_agent))
      (holding vowel_agent ?b)
    )
  )

  ;; unstack a block from on top of another block (vowel_agent)
  (:action vowel-unstack
    :parameters (?b ?s)
    :precondition (and
      (on ?b ?s)
      (clear ?b)
      (handempty vowel_agent)
      (agent-can-move vowel_agent ?b)
    )
    :effect (and
      (not (on ?b ?s))
      (clear ?s)                  ; support becomes clear after removing top
      (not (clear ?b))
      (not (handempty vowel_agent))
      (holding vowel_agent ?b)
    )
  )

  ;; put down a held block onto the table (vowel_agent)
  (:action vowel-putdown-table
    :parameters (?b)
    :precondition (and
      (holding vowel_agent ?b)
    )
    :effect (and
      (on-table ?b)
      (clear ?b)
      (handempty vowel_agent)
      (not (holding vowel_agent ?b))
    )
  )

  ;; stack a held block onto another block (vowel_agent)
  (:action vowel-stack
    :parameters (?b ?t)
    :precondition (and
      (holding vowel_agent ?b)
      (clear ?t)
      (agent-can-move vowel_agent ?b)
    )
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (clear ?t))
      (handempty vowel_agent)
      (not (holding vowel_agent ?b))
    )
  )

  ;; -----------------------
  ;; Consonant-agent actions (consonant_agent can move only consonant-labelled blocks)
  ;; -----------------------

  (:action consonant-pickup
    :parameters (?b)
    :precondition (and
      (on-table ?b)
      (clear ?b)
      (handempty consonant_agent)
      (agent-can-move consonant_agent ?b)
    )
    :effect (and
      (not (on-table ?b))
      (not (clear ?b))
      (not (handempty consonant_agent))
      (holding consonant_agent ?b)
    )
  )

  (:action consonant-unstack
    :parameters (?b ?s)
    :precondition (and
      (on ?b ?s)
      (clear ?b)
      (handempty consonant_agent)
      (agent-can-move consonant_agent ?b)
    )
    :effect (and
      (not (on ?b ?s))
      (clear ?s)
      (not (clear ?b))
      (not (handempty consonant_agent))
      (holding consonant_agent ?b)
    )
  )

  (:action consonant-putdown-table
    :parameters (?b)
    :precondition (and
      (holding consonant_agent ?b)
    )
    :effect (and
      (on-table ?b)
      (clear ?b)
      (handempty consonant_agent)
      (not (holding consonant_agent ?b))
    )
  )

  (:action consonant-stack
    :parameters (?b ?t)
    :precondition (and
      (holding consonant_agent ?b)
      (clear ?t)
      (agent-can-move consonant_agent ?b)
    )
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (clear ?t))
      (handempty consonant_agent)
      (not (holding consonant_agent ?b))
    )
  )
)