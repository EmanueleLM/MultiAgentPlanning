(define (domain blocks-orchestrated)
  (:requirements :strips :typing)
  (:types block support) ;; blocks are also supports via subtype below
  ;; declare that block is a subtype of support so blocks can be supports too
  ;; PDDL type hierarchy: "block - support" would normally indicate block subtype of support,
  ;; but some planners expect explicit objects; we rely on block being usable where support is required.
  (:predicates
    (on ?b - block ?s - support)    ;; block ?b is directly on support ?s (support = table or a block)
    (clear ?b - block)             ;; block ?b has nothing on top and is not being held
    (holding ?b - block)           ;; the single shared hand is holding block ?b
    (handempty)                    ;; the single shared hand is empty
  )

  ;; Picker: picks up a block from the table (private responsibility: picker acts only when handempty)
  (:action picker-pick-up-table
    :parameters (?b - block)
    :precondition (and
      (on ?b table)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (holding ?b)
      (not (on ?b table))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Picker: puts a held block down on the table (picker may also use this to release the hand)
  (:action picker-put-down-table
    :parameters (?b - block)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (on ?b table)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Unstacker: remove block ?b from atop block ?s and hold it (unstacker requires handempty)
  (:action unstacker-unstack
    :parameters (?b - block ?s - block)
    :precondition (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (holding ?b)
      (clear ?s)
      (not (on ?b ?s))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Stacker: place the held block ?b onto clear destination block ?d
  (:action stacker-stack
    :parameters (?b - block ?d - block)
    :precondition (and
      (holding ?b)
      (clear ?d)
    )
    :effect (and
      (on ?b ?d)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?d))
    )
  )
)